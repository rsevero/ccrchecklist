import 'package:flutter/material.dart';

class LinearityWorksheetText extends StatelessWidget {
  final String text;
  const LinearityWorksheetText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Add padding around the text
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onTertiary,
          fontSize: 16, // Increase text size (you can adjust this value)
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
