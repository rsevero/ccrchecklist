import 'package:ccrchecklist/misc/checklist_complete_helper.dart';
import 'package:ccrchecklist/misc/help_dialog_helper.dart';
import 'package:ccrchecklist/page/pdf_preview_page.dart';
import 'package:ccrchecklist/store/checklist_editor_store.dart';
import 'package:ccrchecklist/store/config_store.dart';
import 'package:ccrchecklist/widget/non_ok_sections_report.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChecklistCompletePage extends StatelessWidget {
  const ChecklistCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final nonOkSectionCount = checklistEditorStore.nonOkSectionsCount;
    final message = ChecklistCompleteHelper.mainReport(checklistEditorStore);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Checklist Report'),
          actions: [
            if (defaultTargetPlatform == TargetPlatform.linux) ...[
              IconButton(
                icon: const Icon(Icons.picture_as_pdf),
                onPressed: () => _onPressedShow(context),
              ),
            ],
            if (defaultTargetPlatform == TargetPlatform.android) ...[
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () => _onPressedShare(context),
              ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    message,
                    textScaler: const TextScaler.linear(1.3),
                  ),
                ],
              ),
              if (nonOkSectionCount > 0) ...[
                const NonOkSectionsReport(),
              ]
            ],
          ),
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

  void _onPressedShow(BuildContext context) {
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
