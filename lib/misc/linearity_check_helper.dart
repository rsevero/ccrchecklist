import 'package:ccrchecklist/misc/flutter_extension_methods.dart';
import 'package:ccrchecklist/widget/linearity_worksheet_text.dart';
import 'package:flutter/material.dart';

Widget buildNonEditableLinearityCheckCell(
    BuildContext context, int index, String text, VoidCallback onTap) {
  return SizedBox(
    height: 68,
    child: InkWell(
      onTap: onTap,
      child: Center(
        child: LinearityWorksheetText(
          text,
          context.ccrThemeExtension.linearityColumnContentTextTheme,
        ),
      ),
    ),
  );
}

enum LinearityCheckDataType {
  mv,
  actual,
}
