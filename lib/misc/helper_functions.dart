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

import 'package:ccrchecklist/page/checklist_page.dart';
import 'package:ccrchecklist/store/checklist_editor_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void navigateToSection(BuildContext context, int newSectionIndex) {
  final checklistEditorStore =
      Provider.of<ChecklistEditorStore>(context, listen: false);
  final totalSections = checklistEditorStore.sections.length;

  if ((newSectionIndex >= 0) && (newSectionIndex < totalSections)) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ChecklistPage(sectionIndex: newSectionIndex),
      ),
    );
  }
}

Future<bool> ccrConfirmActionDialog(
    BuildContext context, String title, String text) async {
  return await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
          ],
        ),
      ) ??
      false;
}
