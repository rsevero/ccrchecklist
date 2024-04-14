import 'package:ccr_checklist/misc/checklist_complete_helper.dart';
import 'package:ccr_checklist/page/checklist_page.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NonOkSectionsReport extends StatelessWidget {
  const NonOkSectionsReport({super.key});

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final nonOkSections =
        ChecklistCompleteHelper.nonOkSectionIndexes(checklistEditorStore);

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: nonOkSections.length,
        itemBuilder: (context, index) {
          final int sectionIndex = nonOkSections[index];
          final String sectionTitle = ChecklistCompleteHelper.sectionTitle(
              checklistEditorStore, sectionIndex);
          final String sectionMessage = ChecklistCompleteHelper.sectionMessage(
              checklistEditorStore, sectionIndex);

          return ListTile(
            leading: const Icon(Icons.error, color: Colors.red),
            title: Text(sectionTitle),
            subtitle: Text(sectionMessage),
            trailing: ElevatedButton(
              child: const Text('Fix'),
              onPressed: () {
                onPressedFix(context, sectionIndex);
              },
            ),
          );
        },
      ),
    );
  }

  void onPressedFix(BuildContext context, int sectionIndex) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ChecklistPage(sectionIndex: sectionIndex),
      ),
    );
  }
}
