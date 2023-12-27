import 'package:ccr_checklist/page/checklist_page.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NonOkSectionsReport extends StatelessWidget {
  const NonOkSectionsReport({super.key});

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final nonOkSections = checklistEditorStore.nonOkChecksPerSection
        .asMap()
        .entries
        .where((entry) => entry.value > 0)
        .map((entry) => entry.key)
        .toList();

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: nonOkSections.length,
        itemBuilder: (context, index) {
          final sectionIndex = nonOkSections[index];
          final sectionTitle =
              checklistEditorStore.sections[sectionIndex].title;

          return ListTile(
            leading: const Icon(Icons.error, color: Colors.red),
            title: Text(sectionTitle),
            subtitle: Text(
                "Has ${checklistEditorStore.nonOkChecksPerSection[sectionIndex]} issues."),
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
