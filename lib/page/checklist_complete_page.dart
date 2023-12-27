import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/widget/non_ok_sections_report.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

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
      message = 'You have 1 page not completed.';
    } else {
      message = 'You have $nonOkSectionCount pages not completed.';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist Report'),
        actions: [
          if (defaultTargetPlatform != TargetPlatform.linux) ...[
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => onPressedShare(context),
            )
          ],
        ],
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

  Future<void> onPressedShare(BuildContext context) async {
    final checklistEditorStore =
        Provider.of<ChecklistEditorStore>(context, listen: false);
    final file = await checklistEditorStore.createShareableFile();

    Share.shareXFiles([XFile(file)], text: 'Check out my checklist!');
  }
}
