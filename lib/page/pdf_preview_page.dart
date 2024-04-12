import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/store/config_store.dart';
import 'package:ccr_checklist/widget/checklist_as_pdf.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatelessWidget {
  final ChecklistEditorStore checklistEditorStore;
  final ConfigStore configStore;

  const PdfPreviewPage({
    super.key,
    required this.checklistEditorStore,
    required this.configStore,
  });

  @override
  Widget build(BuildContext context) {
    final checklistAsPdf = ChecklistAsPdf();
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => checklistAsPdf.export(
          checklistEditorStore: checklistEditorStore,
          configStore: configStore,
        ),
      ),
    );
  }
}
