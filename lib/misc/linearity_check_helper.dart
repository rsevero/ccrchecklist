import 'package:ccr_checklist/widget/linearity_worksheet_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

Widget buildNonEditableLinearityCheckCell(
    BuildContext context, int index, String text, VoidCallback onTap) {
  return SizedBox(
    height: 68,
    child: InkWell(
      onTap: onTap,
      child: Center(
        child: Observer(
          builder: (_) => LinearityWorksheetText(text),
        ),
      ),
    ),
  );
}
