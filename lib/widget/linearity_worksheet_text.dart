import 'package:flutter/material.dart';

class LinearityWorksheetText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const LinearityWorksheetText(this.text, this.style, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }
}
