// CCR Checklist - a checklist app for rebreather users
// Copyright (C) 2024  Rodrigo Severo
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
