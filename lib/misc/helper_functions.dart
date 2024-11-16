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
