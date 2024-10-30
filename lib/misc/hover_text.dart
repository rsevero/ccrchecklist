import 'package:ccr_checklist/misc/flutter_extension_methods.dart';
import 'package:flutter/material.dart';

class HoverText extends StatefulWidget {
  final String text;
  final TextStyle? style;

  const HoverText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  OverlayEntry? _overlayEntry;
  bool _isOverflowing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkOverflow();
    });
  }

  void _checkOverflow() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width);

    setState(() {
      _isOverflowing = textPainter.didExceedMaxLines;
    });
  }

  void _showOverlay(BuildContext context) {
    if (!_isOverflowing) return;

    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        child: Material(
          elevation: 4.0,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: context.colorScheme.primary,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: context.mediaQuery.size.width * 0.9,
              ),
              child: Text(
                widget.text,
                style: widget.style?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
                softWrap: true,
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _hideOverlay() {
    if (!_isOverflowing) return;

    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _showOverlay(context),
      onExit: (_) => _hideOverlay(),
      child: Text(
        widget.text,
        style: widget.style,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        softWrap: false,
      ),
    );
  }
}
