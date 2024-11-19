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

import 'package:ccrchecklist/misc/about_dialog_helper.dart';
import 'package:ccrchecklist/misc/checklist_complete_helper.dart';
import 'package:ccrchecklist/misc/constants.dart';
import 'package:ccrchecklist/misc/flutter_extension_methods.dart';
import 'package:ccrchecklist/store/checklist_editor_store.dart';
import 'package:ccrchecklist/store/config_store.dart';
import 'package:ccrchecklist/widget/checklist_as_pdf.dart';
import 'package:ccrchecklist/widget/tool_bar.dart';
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
        ),
        body: ToolBar(
          actions: [
            if (defaultTargetPlatform == TargetPlatform.android) ...[
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () => _onPressedShare(context),
              ),
            ],
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                showCCRAboutDialog(context);
              },
              tooltip: 'About',
            ),
          ],
          content: PdfPreview(
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
            scrollViewDecoration: BoxDecoration(
              color: context.ccrThemeExtension.surface,
            ),
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
      ),
    );
  }

  String _pdfFilename() {
    final buffer = StringBuffer();

    buffer.write(slugify(configStore.configData['DiverName'] ?? ccrNoDiverName,
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
