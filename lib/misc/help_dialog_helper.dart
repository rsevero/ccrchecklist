import 'package:ccrchecklist/widget/help_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String ccrSeparateCamelCase(String text) {
  RegExp exp = RegExp(r'(?<=[a-z])(?=[A-Z])');
  return text.replaceAll(exp, ' ');
}

void ccrOpenHelpDialog(BuildContext context, String pageName) async {
  final helpTextFileName = 'assets/help/$pageName.md';
  final helpText = await ccrLoadHelpText(helpTextFileName);

  if (!context.mounted) return;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return HelpDialog(helpText: helpText, pageName: pageName);
    },
  );
}

Future<String> ccrLoadHelpText(String path) async {
  try {
    return await rootBundle.loadString(path);
  } catch (e) {
    return 'Error loading help text: $e';
  }
}
