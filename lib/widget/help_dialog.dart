import 'package:ccrchecklist/misc/help_dialog_helper.dart';
import 'package:ccrchecklist/widget/bottom_fade.dart';
import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class HelpDialog extends StatefulWidget {
  final String pageName;
  final String helpText;

  const HelpDialog({super.key, required this.helpText, required this.pageName});

  @override
  State<HelpDialog> createState() => _HelpDialogState();
}

class _HelpDialogState extends State<HelpDialog> {
  final GlobalKey contentKey = GlobalKey();
  bool _isOverflowing = false;
  bool _atBottom = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    // Schedule a post-frame callback to determine the content size
    WidgetsBinding.instance.addPostFrameCallback((_) => checkOverflow());
  }

  void _scrollListener() {
    if (_isOverflowing) {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        setState(() {
          _atBottom = true;
        });
      } else {
        setState(() {
          _atBottom = false;
        });
      }
    } else {
      setState(() {
        _atBottom = true;
      });
    }
  }

  void checkOverflow() {
    final RenderBox contentBox =
        contentKey.currentContext?.findRenderObject() as RenderBox;
    final RenderBox containerBox = contentBox.parent as RenderBox;

    if (contentBox.size.height > containerBox.size.height) {
      setState(() {
        _isOverflowing = true;
      });
    } else {
      setState(() {
        _isOverflowing = false;
      });
    }

    _scrollListener();
  }

  @override
  Widget build(BuildContext context) {
    final helpDialogTitle = "# ${ccrSeparateCamelCase(widget.pageName)}";

    return AlertDialog(
      title: MarkdownBlock(data: helpDialogTitle),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.8,
        child: BottomFade(
          showFade: _isOverflowing && !_atBottom,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: MarkdownBlock(
              key: contentKey,
              data: widget.helpText.isEmpty
                  ? 'No help available.'
                  : widget.helpText,
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
