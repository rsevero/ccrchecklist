import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/widget/non_ok_sections_report.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChecklistCompletePage extends StatelessWidget {
  const ChecklistCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final nonOkSectionCount = checklistEditorStore.nonOkSectionsCount;
    var message = '';

    if (nonOkSectionCount == 0) {
      message = 'All sections completed!';
    } else if (nonOkSectionCount == 1) {
      message = 'You have 1 section is not completed.';
    } else {
      message = 'You have $nonOkSectionCount sections not completed.';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist Report'),
      ),
      body: Column(
        children: [
          Text(message),
          if (nonOkSectionCount > 0) ...[
            const NonOkSectionsReport(),
          ]
        ],
      ),
    );
  }
}
