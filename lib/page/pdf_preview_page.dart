import 'package:ccr_checklist/misc/checklist_complete_helper.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/store/config_store.dart';
import 'package:ccr_checklist/widget/checklist_as_pdf.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:slugify/slugify.dart';

class PdfPreviewPage extends StatelessWidget {
  final ChecklistEditorStore checklistEditorStore;
  final ConfigStore configStore;

  const PdfPreviewPage({
    super.key,
    required this.checklistEditorStore,
    required this.configStore,
  });

  Future<void> _onPressedShare(BuildContext context) async {
    final pdf = await _generatePdf();
    if (pdf != null) {
      await Printing.sharePdf(bytes: pdf);
    } else {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to generate PDF'),
        ),
      );
    }
  }

  Future<Uint8List?> _generatePdf() async {
    final checklistAsPdf = ChecklistAsPdf();
    final pdfDocument = await checklistAsPdf.export(
      checklistEditorStore: checklistEditorStore,
      configStore: configStore,
    );

    return pdfDocument;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PDF Preview'),
          actions: [
            if (defaultTargetPlatform == TargetPlatform.android) ...[
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () => _onPressedShare(context),
              ),
            ],
          ],
        ),
        body: PdfPreview(
          initialPageFormat: PdfPageFormat.a4,
          canDebug: false,
          canChangePageFormat: true,
          canChangeOrientation: false,
          pageFormats: const {
            'A4': PdfPageFormat.a4,
            'Letter': PdfPageFormat.letter,
            'Legal': PdfPageFormat.legal,
          },
          pdfFileName: _pdfFilename(),
          build: (context) async {
            final pdfBytes = await _generatePdf();
            if (pdfBytes != null) {
              return pdfBytes;
            } else {
              return Future.error('Failed to generate PDF');
            }
          },
        ),
      ),
    );
  }

  String _pdfFilename() {
    final buffer = StringBuffer();

    buffer.write(slugify(configStore.configData['DiverName'],
        delimiter: '_', lowercase: false));
    buffer.write('-');
    buffer.write(ChecklistCompleteHelper.formatDate(checklistEditorStore.date));
    buffer.write('-');
    buffer.write(
        slugify(checklistEditorStore.title, delimiter: '_', lowercase: false));
    buffer.write('_Checklist.pdf');

    final String filename = buffer.toString();

    return filename;
  }
}
