import 'package:ccr_checklist/misc/help_dialog_helper.dart';
import 'package:ccr_checklist/page/pdf_preview_page.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/store/config_store.dart';
import 'package:ccr_checklist/widget/checklist_as_pdf.dart';
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
          if (defaultTargetPlatform == TargetPlatform.linux) ...[
            IconButton(
              icon: const Icon(Icons.picture_as_pdf),
              onPressed: () => _onPressedShare(context),
            )
          ],
          if (defaultTargetPlatform != TargetPlatform.linux) ...[
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => _onPressedShare(context),
            )
          ],
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () =>
                ccrOpenHelpDialog(context, 'ChecklistCompletePage'),
            tooltip: 'Help',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(message),
            if (nonOkSectionCount > 0) ...[
              const NonOkSectionsReport(),
            ]
          ],
        ),
      ),
    );
  }

  void _onPressedShare(BuildContext context) {
    final checklistEditorStore =
        Provider.of<ChecklistEditorStore>(context, listen: false);
    final configStore = Provider.of<ConfigStore>(context, listen: false);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfPreviewPage(
          checklistEditorStore: checklistEditorStore,
          configStore: configStore,
        ),
      ),
    );
  }
}
