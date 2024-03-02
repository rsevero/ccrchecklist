import 'package:ccr_checklist/misc/help_dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class HelpDialog extends StatelessWidget {
  final String pageName;
  final Future<String> helpTextFuture;

  const HelpDialog(
      {super.key, required this.helpTextFuture, required this.pageName});

  @override
  Widget build(BuildContext context) {
    final helpDialogTitle = "# ${ccrSeparateCamelCase(pageName)}";

    return AlertDialog(
      title: MarkdownBlock(data: helpDialogTitle),
      content: FutureBuilder<String>(
        future: helpTextFuture,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.8,
              child: SingleChildScrollView(
                child: MarkdownBlock(
                  data: snapshot.data ?? 'No help available.',
                ),
              ),
            );
          }
        },
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
