import 'package:ccr_checklist/data/checklist_check.dart';
import 'package:ccr_checklist/data/checklist_section.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/store/config_store.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ChecklistAsPdf {
  late pw.Document _pdf;
  late pw.Font _regularFont;
  late pw.Font _boldFont;
  late pw.Font _italicFont;
  late pw.Font _boldItalicFont;
  late pw.Font _thinFont;
  late pw.Font _thinItalicFont;
  late pw.Font _textFont;
  late pw.ThemeData _mainTheme;
  bool _isInitialized = false;
  late ChecklistEditorStore _checklistEditorStore;
  late ConfigStore _configStore;

  ChecklistAsPdf();

  Future<void> _initializePdf() async {
    _pdf = pw.Document();
    if (!_isInitialized) {
      _regularFont = await PdfGoogleFonts.notoSansRegular();
      _boldFont = await PdfGoogleFonts.notoSansBold();
      _italicFont = await PdfGoogleFonts.notoSansItalic();
      _boldItalicFont = await PdfGoogleFonts.notoSansBoldItalic();
      _mainTheme = pw.ThemeData.withFont(
        base: _regularFont,
        bold: _boldFont,
        italic: _italicFont,
        boldItalic: _boldItalicFont,
      );

      _thinFont = await PdfGoogleFonts.notoSansThin();
      _thinItalicFont = await PdfGoogleFonts.notoSansThinItalic();

      _textFont = await PdfGoogleFonts.notoSansRegular();

      _isInitialized = true;
    }
  }

  Future<Uint8List> export({
    required ChecklistEditorStore checklistEditorStore,
    required ConfigStore configStore,
  }) async {
    await _initializePdf();

    _checklistEditorStore = checklistEditorStore;
    _configStore = configStore;

    _pdf.addPage(
      pw.MultiPage(
        theme: _mainTheme,
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return [
                _buildChecklistTitle(
                    "${_checklistEditorStore.title} Checklist"),
                _buildChecklistDescription(_checklistEditorStore.description),
                _buildChecklistRebreatherName(
                    "${_checklistEditorStore.rebreatherManufacturer} ${_checklistEditorStore.rebreatherModel}"),
                pw.Divider(thickness: 0.1),
                _buildDiverDateRow(),
                pw.Divider(thickness: 1),
              ] +
              _buildChecks();
        },
      ),
    );

    return _pdf.save();
  }

  List<pw.SpanningWidget> _buildChecks() {
    final List<pw.SpanningWidget> rows = [];
    for (final section in _checklistEditorStore.sections) {
      rows.add(_buildSectionTitle(section));
      for (final check in section.checks) {
        switch (check) {
          case ChecklistRegularCheck():
            rows.add(_regularChecklistItem(check));
            break;
          case ChecklistLinearityStep1Check():
            break;
          case ChecklistLinearityStep2Check():
            break;
        }
      }
      rows.add(pw.Divider(thickness: 0.4));
    }
    return rows;
  }

  pw.SpanningWidget _buildSectionTitle(ChecklistSection section) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 5),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            child: _text(section.title, fontSize: 14, bold: true),
          ),
        ],
      ),
    );
  }

  pw.SpanningWidget _buildDiverDateRow() {
    return pw.Column(
      children: [
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            _text('Diver: '),
            _text(_configStore.diverName, italic: true),
          ],
        ),
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            _text('Start: '),
            _text(_formatDate(_checklistEditorStore.date), italic: true),
            pw.Spacer(),
            _text('Last change: '),
            _text(_formatDate(_checklistEditorStore.lastChange), italic: true),
          ],
        ),
      ],
    );
  }

  pw.SpanningWidget _regularChecklistItem(ChecklistRegularCheck check) {
    List<pw.SpanningWidget> rows = [];

    rows.add(
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
            width: 10,
            height: 11,
            margin: const pw.EdgeInsets.only(top: 2),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.black),
            ),
            child: pw.Center(
              child: pw.Text(
                check.isChecked ? 'X' : ' ',
                style: pw.TextStyle(
                  font: _boldFont,
                  fontSize: 8,
                ),
              ),
            ),
          ),
          pw.SizedBox(width: 5),
          pw.Expanded(
            child: _text(check.description, fontSize: 12),
          ),
        ],
      ),
    );

    if (check.observation.isNotEmpty) {
      rows.add(
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.SizedBox(width: 15),
            _text('Note: ', fontSize: 10, bold: true),
            pw.Expanded(
              child: _text(check.observation, fontSize: 10, italic: true),
            ),
          ],
        ),
      );
    }

    return pw.Column(
      children: [
        pw.Container(
          decoration: check.isChecked
              ? null
              : const pw.BoxDecoration(
                  color: PdfColors.red300,
                ),
          padding:
              const pw.EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 2),
          child: pw.Column(children: rows),
        ),
        pw.SizedBox(height: 3),
      ],
    );
  }

  pw.Text _text(String text,
      {double fontSize = 12, bool italic = false, bool bold = false}) {
    final pw.Font font = (italic && bold)
        ? _boldItalicFont
        : (italic ? _italicFont : (bold ? _boldFont : _textFont));

    return pw.Text(
      text,
      style: pw.TextStyle(
        font: font,
        fontSize: fontSize,
      ),
    );
  }

  pw.SpanningWidget _buildChecklistTitle(String title) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          child: _text(title, fontSize: 18, bold: true),
        ),
      ],
    );
  }

  pw.SpanningWidget _buildChecklistDescription(String description) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          child: pw.Text(
            description,
            style: pw.TextStyle(
              font: _thinItalicFont,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  pw.SpanningWidget _buildChecklistRebreatherName(String rebreatherName) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          child: pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'For ',
                style: pw.TextStyle(
                  font: _regularFont,
                  fontSize: 12,
                ),
              ),
              pw.Text(
                rebreatherName,
                style: pw.TextStyle(
                  font: _italicFont,
                  fontSize: 12,
                ),
              ),
              pw.Text(
                ' rebreathers',
                style: pw.TextStyle(
                  font: _regularFont,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime dateTime) {
    DateFormat formatter = DateFormat('yyyy.MM.dd - HH:mm');
    return formatter.format(dateTime);
  }
}