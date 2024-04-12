import 'package:ccr_checklist/data/checklist_check.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/store/config_store.dart';
import 'package:ccr_checklist/widget/checklist_linearity_step1_check_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ChecklistAsPdf {
  late pw.Document _pdf;
  late pw.Font _regularFont;
  late pw.Font _boldFont;
  late pw.Font _italicFont;
  late pw.Font _boldItalicFont;
  late pw.Font _lightFont;
  late pw.Font _lightItalicFont;
  late pw.Font _thinFont;
  late pw.Font _thinItalicFont;
  late pw.ThemeData _mainTheme;
  bool _isInitialized = false;
  late ChecklistEditorStore _checklistEditorStore;
  late ConfigStore _configStore;

  ChecklistAsPdf();

  Future<void> _initializePdf() async {
    _pdf = pw.Document();
    if (!_isInitialized) {
      _regularFont =
          pw.Font.ttf(await rootBundle.load('assets/fonts/DMSans-Regular.ttf'));
      _boldFont =
          pw.Font.ttf(await rootBundle.load('assets/fonts/DMSans-Bold.ttf'));
      _italicFont =
          pw.Font.ttf(await rootBundle.load('assets/fonts/DMSans-Italic.ttf'));
      _boldItalicFont = pw.Font.ttf(
          await rootBundle.load('assets/fonts/DMSans-BoldItalic.ttf'));
      _mainTheme = pw.ThemeData.withFont(
        base: _regularFont,
        bold: _boldFont,
        italic: _italicFont,
        boldItalic: _boldItalicFont,
      );

      _lightFont =
          pw.Font.ttf(await rootBundle.load('assets/fonts/DMSans-Light.ttf'));
      _lightItalicFont = pw.Font.ttf(
          await rootBundle.load('assets/fonts/DMSans-LightItalic.ttf'));
      _thinFont =
          pw.Font.ttf(await rootBundle.load('assets/fonts/DMSans-Thin.ttf'));
      _thinItalicFont = pw.Font.ttf(
          await rootBundle.load('assets/fonts/DMSans-ThinItalic.ttf'));
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
      pw.Page(
        theme: _mainTheme,
        build: (context) {
          return pw.Column(
            children: [
                  _buildChecklistTitle(
                      "${_checklistEditorStore.title} Checklist"),
                  _buildChecklistDescription(_checklistEditorStore.description),
                  _buildChecklistRebreatherName(
                      "${_checklistEditorStore.rebreatherManufacturer} ${_checklistEditorStore.rebreatherModel}"),
                  pw.Divider(thickness: 0.1),
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      _text('Diver: '),
                      _text(_configStore.diverName, italic: true),
                      pw.Spacer(),
                      _text('Date: '),
                      _text(_formatDate(_checklistEditorStore.date),
                          italic: true),
                    ],
                  ),
                  pw.Divider(thickness: 1),
                ] +
                _buildChecks(),
          );
        },
      ),
    );

    return _pdf.save();
  }

  List<pw.SpanningWidget> _buildChecks() {
    final List<pw.SpanningWidget> rows = [];
    for (final section in _checklistEditorStore.sections) {
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
    }
    return rows;
  }

  pw.SpanningWidget _regularChecklistItem(ChecklistRegularCheck check) {
    List<pw.SpanningWidget> rows = [];

    rows.add(pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          width: 10,
          height: 10,
          margin: const pw.EdgeInsets.only(top: 2),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.black),
          ),
          child: pw.Center(
            child: pw.Text(
              check.isChecked ? 'X' : ' ',
              style: pw.TextStyle(
                font: _regularFont,
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
    ));

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

    return pw.Column(children: rows);
  }

  pw.Text _text(String text,
      {double fontSize = 12, bool italic = false, bool bold = false}) {
    final pw.Font font = (italic && bold)
        ? _boldItalicFont
        : (italic ? _italicFont : (bold ? _boldFont : _regularFont));

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
