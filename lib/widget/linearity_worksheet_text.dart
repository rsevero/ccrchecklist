import 'package:flutter/material.dart';

class LinearityWorksheetText extends StatelessWidget {
  final String text;
  const LinearityWorksheetText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onTertiary,
      ),
    );
  }
}
