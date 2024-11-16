import 'package:ccrchecklist/misc/constants.dart';
import 'package:flutter/material.dart';

class DialogBoxColumnItem extends StatelessWidget {
  final List<Widget> children;

  const DialogBoxColumnItem({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: ccrVerticalPaddingItem),
      child: SizedBox(
        width: ccrDescriptionFieldWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
