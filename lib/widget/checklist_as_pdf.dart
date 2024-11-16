import 'package:ccrchecklist/data/checklist_check.dart';
import 'package:ccrchecklist/data/checklist_section.dart';
import 'package:ccrchecklist/data/linearity_row.dart';
import 'package:ccrchecklist/misc/checklist_complete_helper.dart';
import 'package:ccrchecklist/misc/constants.dart';
import 'package:ccrchecklist/store/checklist_editor_store.dart';
import 'package:ccrchecklist/store/config_store.dart';
import 'package:flutter/services.dart';
import 'package:htmltopdfwidgets/htmltopdfwidgets.dart';
import 'package:mobx/mobx.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ChecklistAsPdf {
  late pw.Document _pdf;
  late pw.Font _regularFont;
  late pw.Font _boldFont;
  late pw.Font _italicFont;
  late pw.Font _boldItalicFont;
  late pw.Font _thinItalicFont;
  late pw.Font _checkFont;
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

      _thinItalicFont = await PdfGoogleFonts.notoSansThinItalic();

      _checkFont = await PdfGoogleFonts.notoSansSymbols2Regular();

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
                pw.SizedBox(height: 5),
                _buildDiverDateRow(),
                pw.SizedBox(height: 5),
              ] +
              _buildChecks() +
              _buildBrief();
        },
      ),
    );

    return _pdf.save();
  }

  List<pw.SpanningWidget> _buildBrief() {
    final List<pw.SpanningWidget> rows = [];
    final message = ChecklistCompleteHelper.mainReport(_checklistEditorStore);

    rows.add(_buildBriefHeader());
    rows.add(_text(message));

    if (_checklistEditorStore.nonOkSectionsCount > 0) {
      for (int i = 0; i < _checklistEditorStore.sections.length; i++) {
        rows.add(pw.Divider(thickness: 0.2));
        rows.add(
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                width: 14,
                height: 14,
                margin: const pw.EdgeInsets.only(top: 2),
                decoration: pw.BoxDecoration(
                  shape: pw.BoxShape.circle,
                  color: _checklistEditorStore.sectionsOk[i]
                      ? PdfColors.green
                      : PdfColors.red,
                ),
                child: pw.Center(
                  child: pw.Text(
                    _checklistEditorStore.sectionsOk[i] ? '✔' : '❗',
                    style: pw.TextStyle(
                      font: _checkFont,
                      fontSize: 9,
                      color: PdfColors.white,
                    ),
                  ),
                ),
              ),
              pw.SizedBox(width: 5),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(children: [
                    _buildHeader2(_checklistEditorStore.sections[i].title)
                  ]),
                  _text(ChecklistCompleteHelper.sectionMessage(
                      _checklistEditorStore, i)),
                ],
              ),
            ],
          ),
        );
      }
    }

    return rows;
  }

  List<pw.SpanningWidget> _buildChecks() {
    final List<pw.SpanningWidget> rows = [];

    for (final sectionEntry in _checklistEditorStore.sections.asMap().entries) {
      final sectionIndex = sectionEntry.key;
      final section = sectionEntry.value;

      rows.add(_buildSectionTitle(section));
      rows.add(pw.SizedBox(height: 5));
      for (final checkEntry in section.checks.asMap().entries) {
        final checkIndex = checkEntry.key;
        final check = checkEntry.value;

        switch (check) {
          case ChecklistRegularCheck():
            rows.add(_regularChecklistItem(check));
            break;
          case ChecklistCompleteLinearityCheck():
            rows.add(_completeLinearityChecklistItem(
              check,
              sectionIndex,
              checkIndex,
            ));
            break;
          case ChecklistLinearityStep1Check():
            rows.add(_linearityStep1ChecklistItem(check));
            break;
          case ChecklistLinearityStep2Check():
            rows.add(_linearityStep2ChecklistItem(check));
            break;
        }
      }

      rows.add(pw.Divider(thickness: 0.4));
    }

    return rows;
  }

  pw.SpanningWidget _buildBriefHeader() {
    return pw.Container(
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [_buildHeader1('Checklist brief')],
      ),
    );
  }

  pw.SpanningWidget _buildSectionTitle(ChecklistSection section) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 5),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _buildHeader1(section.title),
        ],
      ),
    );
  }

  pw.SpanningWidget _buildHeader1(String text) {
    return pw.Expanded(
      child: _text(text, fontSize: 14, bold: true),
    );
  }

  pw.SpanningWidget _buildHeader2(String text) {
    return _text(text, fontSize: 12, bold: true);
  }

  pw.SpanningWidget _buildDiverDateRow() {
    return pw.Container(
      decoration: const pw.BoxDecoration(
        color: PdfColors.grey800,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(5)),
      ),
      padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: pw.Column(
        children: [
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _text('Diver: ', color: PdfColors.white),
              _text(_configStore.diverName,
                  italic: true, color: PdfColors.white),
            ],
          ),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _text('Start: ', color: PdfColors.white),
              _text(
                  ChecklistCompleteHelper.formatDate(
                      _checklistEditorStore.date),
                  italic: true,
                  color: PdfColors.white),
              pw.Spacer(),
              _text('Last change: ', color: PdfColors.white),
              _text(
                  ChecklistCompleteHelper.formatDate(
                      _checklistEditorStore.lastChange),
                  italic: true,
                  color: PdfColors.white),
            ],
          ),
        ],
      ),
    );
  }

  pw.Text _text(String text,
      {double fontSize = 12,
      bool italic = false,
      bool bold = false,
      PdfColor color = PdfColors.black}) {
    final pw.Font font = (italic && bold)
        ? _boldItalicFont
        : (italic ? _italicFont : (bold ? _boldFont : _regularFont));

    return pw.Text(
      text,
      style: pw.TextStyle(
        font: font,
        fontSize: fontSize,
        color: color, // Use the color parameter
      ),
    );
  }

  pw.SpanningWidget _linearityStep1ChecklistItem(
      ChecklistLinearityStep1Check check) {
    List<pw.SpanningWidget> rows = [];
    bool isOk = true;

    rows.add(
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(width: 15),
          pw.Expanded(
            child: _text(check.description, fontSize: 12),
          ),
        ],
      ),
    );

    final List<pw.SpanningWidget> mvs = [
      _text(check.measurement, fontSize: 10, bold: true)
    ];
    final List<pw.SpanningWidget> oxygens1_0 = [
      _text('/0.21', fontSize: 10, italic: true)
    ];
    final List<pw.SpanningWidget> oxygens1_6 = [
      _text('x1.6', fontSize: 10, italic: true)
    ];

    for (final line in _checklistEditorStore.linearityWorksheet) {
      final String mv = ((line.mv == null) || (line.mv!.isNaN))
          ? '—'
          : line.mv!.toStringAsFixed(1);
      mvs.add(_text(mv, fontSize: 10, bold: true));

      final String oxygen1_0 = ((line.divided == null) || (line.divided!.isNaN))
          ? '—'
          : line.divided!.toStringAsFixed(1);
      oxygens1_0.add(_text(oxygen1_0, fontSize: 10, italic: true));

      final String oxygen1_6 =
          ((line.multiplied == null) || (line.multiplied!.isNaN))
              ? '—'
              : line.multiplied!.toStringAsFixed(1);
      oxygens1_6.add(_text(oxygen1_6, fontSize: 10, italic: true));

      isOk = isOk && ((line.mv != null) && (!line.mv!.isNaN));
    }

    rows.add(
      pw.Row(
        children: [
          pw.SizedBox(width: 15),
          pw.Container(
            decoration: const pw.BoxDecoration(
              color: PdfColors.grey300,
              borderRadius: pw.BorderRadius.all(pw.Radius.circular(5)),
            ),
            margin: const pw.EdgeInsets.only(bottom: 3, top: 4),
            padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: pw.Row(
              children: [
                pw.Column(children: mvs),
                pw.SizedBox(width: 5),
                pw.Column(children: oxygens1_0),
                pw.SizedBox(width: 5),
                pw.Column(children: oxygens1_6),
              ],
            ),
          ),
        ],
      ),
    );

    return pw.Column(
      children: [
        pw.Container(
          decoration: isOk
              ? null
              : const pw.BoxDecoration(
                  color: PdfColors.red300,
                  borderRadius: pw.BorderRadius.all(pw.Radius.circular(5)),
                ),
          padding:
              const pw.EdgeInsets.only(left: 6, right: 5, top: 5, bottom: 5),
          child: pw.Column(children: rows),
        ),
        pw.SizedBox(height: 3),
      ],
    );
  }

  pw.SpanningWidget _linearityStep2ChecklistItem(
      ChecklistLinearityStep2Check check) {
    return _linearityWorksheetItem(
        check, _checklistEditorStore.linearityWorksheet);
  }

  pw.SpanningWidget _completeLinearityChecklistItem(
    ChecklistCompleteLinearityCheck check,
    int sectionIndex,
    int checkIndex,
  ) {
    final linearityWorksheet = _checklistEditorStore
        .getCompleteLinearityWorksheet(sectionIndex, checkIndex);

    return _linearityWorksheetItem(check, linearityWorksheet);
  }

  pw.SpanningWidget _linearityWorksheetItem(
    ChecklistCheck check,
    ObservableList<LinearityRow> linearityWorksheet,
  ) {
    if ((check is! ChecklistCompleteLinearityCheck) &&
        (check is! ChecklistLinearityStep2Check)) {
      throw Exception('Invalid check type');
    }

    List<pw.SpanningWidget> rows = [];
    bool isOk = true;

    rows.add(
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(width: 15),
          pw.Expanded(
            child: _text(check.description, fontSize: 12),
          ),
        ],
      ),
    );

    final String measurement = check is ChecklistCompleteLinearityCheck
        ? check.measurement
        : _checklistEditorStore.linearityCheckMeasurement;
    final List<pw.SpanningWidget> mvs = [
      _text(measurement, fontSize: 10, bold: true)
    ];
    final List<pw.SpanningWidget> oxygens1_0 = [
      _text('/0.21', fontSize: 10, italic: true)
    ];
    final List<pw.SpanningWidget> oxygens1_6 = [
      _text('x1.6', fontSize: 10, italic: true)
    ];
    final List<pw.SpanningWidget> actuals = [
      _text('actual', fontSize: 10, bold: true)
    ];
    final List<pw.SpanningWidget> percentages = [
      _text('%', fontSize: 10, italic: true)
    ];

    for (final line in linearityWorksheet) {
      final String mv = ((line.mv == null) || (line.mv!.isNaN))
          ? '—'
          : line.mv!.toStringAsFixed(1);
      mvs.add(_text(mv, fontSize: 10, bold: true));

      final String oxygen1_0 = ((line.divided == null) || (line.divided!.isNaN))
          ? '—'
          : line.divided!.toStringAsFixed(1);
      oxygens1_0.add(_text(oxygen1_0, fontSize: 10, italic: true));

      final String oxygen1_6 =
          ((line.multiplied == null) || (line.multiplied!.isNaN))
              ? '—'
              : line.multiplied!.toStringAsFixed(1);
      oxygens1_6.add(_text(oxygen1_6, fontSize: 10, italic: true));

      final String actual = ((line.actual == null) || (line.actual!.isNaN))
          ? '—'
          : line.actual!.toStringAsFixed(1);
      actuals.add(_text(actual, fontSize: 10, bold: true));

      final String percentage =
          ((line.percentage == null) || (line.percentage!.isNaN))
              ? '—'
              : line.percentage!.toStringAsFixed(1);
      percentages.add(_text(percentage, fontSize: 10, italic: true));

      isOk = isOk &&
          ((line.percentage != null) &&
              (!line.percentage!.isNaN) &&
              (line.percentage! >= ccrMinimumLinearity));
    }

    rows.add(
      pw.Row(
        children: [
          pw.SizedBox(width: 15),
          pw.Container(
            decoration: const pw.BoxDecoration(
              color: PdfColors.grey300,
              borderRadius: pw.BorderRadius.all(pw.Radius.circular(5)),
            ),
            margin: const pw.EdgeInsets.only(bottom: 3, top: 4),
            padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: pw.Row(
              children: [
                pw.Column(children: mvs),
                pw.SizedBox(width: 5),
                pw.Column(children: oxygens1_0),
                pw.SizedBox(width: 5),
                pw.Column(children: oxygens1_6),
                pw.SizedBox(width: 5),
                pw.Column(children: actuals),
                pw.SizedBox(width: 5),
                pw.Column(children: percentages),
              ],
            ),
          ),
        ],
      ),
    );

    return pw.Column(
      children: [
        pw.Container(
          decoration: isOk
              ? null
              : const pw.BoxDecoration(
                  color: PdfColors.orange300,
                  borderRadius: pw.BorderRadius.all(pw.Radius.circular(5)),
                ),
          padding:
              const pw.EdgeInsets.only(left: 6, right: 5, top: 5, bottom: 5),
          child: pw.Column(children: rows),
        ),
        pw.SizedBox(height: 3),
      ],
    );
  }

  pw.SpanningWidget _regularChecklistItem(ChecklistRegularCheck check) {
    List<pw.SpanningWidget> rows = [];
    bool isOk = check.isChecked;

    rows.add(
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
            width: 10,
            height: 12,
            margin: const pw.EdgeInsets.only(top: 1),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.black),
              borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
            ),
            child: pw.Center(
              child: pw.Text(
                check.isChecked ? '✔' : '',
                style: pw.TextStyle(
                  font: _checkFont,
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

    if (check.references.isNotEmpty) {
      final List<pw.SpanningWidget> prefixes = [];
      final List<pw.SpanningWidget> values = [];
      final List<pw.SpanningWidget> suffixes = [];

      for (final reference in check.references) {
        final String prefix =
            ((reference.prefix != null) && (reference.prefix!.isNotEmpty))
                ? reference.prefix.toString()
                : '';
        prefixes.add(_text(prefix, fontSize: 10, italic: true));

        final String value =
            ((reference.value == null) || (reference.value!.isNaN))
                ? '—'
                : reference.value.toString();
        values.add(_text(value, fontSize: 10, bold: true));

        final String suffix =
            ((reference.suffix != null) && (reference.suffix!.isNotEmpty))
                ? reference.suffix.toString()
                : '';
        suffixes.add(_text(suffix, fontSize: 10, italic: true));

        isOk = isOk && ((reference.value != null) && (!reference.value!.isNaN));
      }

      rows.add(
        pw.Row(
          children: [
            pw.SizedBox(width: 15),
            pw.Column(
              children: prefixes,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
            ),
            pw.SizedBox(width: 5),
            pw.Column(children: values),
            pw.SizedBox(width: 5),
            pw.Column(
              children: suffixes,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
            ),
          ],
        ),
      );
    }

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
          decoration: isOk
              ? null
              : const pw.BoxDecoration(
                  color: PdfColors.red300,
                  borderRadius: pw.BorderRadius.all(pw.Radius.circular(5)),
                ),
          padding:
              const pw.EdgeInsets.only(left: 6, right: 5, top: 5, bottom: 5),
          child: pw.Column(children: rows),
        ),
        pw.SizedBox(height: 3),
      ],
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
}
