import 'dart:convert';
import 'dart:io';
import 'package:ccrchecklist/data/checklist_check.dart';
import 'package:ccrchecklist/data/checklist_section.dart';
import 'package:ccrchecklist/data/linearity_row.dart';
import 'package:ccrchecklist/data/regular_check_reference.dart';
import 'package:ccrchecklist/data/template.dart';
import 'package:ccrchecklist/data/template_check.dart';
import 'package:ccrchecklist/misc/constants.dart';
import 'package:ccrchecklist/misc/ccr_directory_helper.dart';
import 'package:ccrchecklist/misc/linearity_check_helper.dart';
import 'package:ccrchecklist/store/observablelist_json_converter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:slugify/slugify.dart';

part 'checklist_editor_store.g.dart';

@JsonSerializable(explicitToJson: true)
class ChecklistEditorStore extends _ChecklistEditorStoreBaseToJson
    with _$ChecklistEditorStore {
  ChecklistEditorStore();

  factory ChecklistEditorStore.fromJson(Map<String, dynamic> json) =>
      _$ChecklistEditorStoreFromJson(json);

  Map<String, dynamic> toJson() => _$ChecklistEditorStoreToJson(this);
}

abstract class _ChecklistEditorStoreBaseToJson with Store {
  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  String _rebreatherManufacturer = '';

  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  String _rebreatherModel = '';

  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  String _title = '';

  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  String _description = '';

  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  String _diverName = '';

  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  DateTime _date = DateTime.now();

  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  DateTime _lastChange = DateTime.now();

  @readonly
  @JsonKey(
      includeFromJson: true,
      includeToJson: true,
      fromJson: ObservableListJsonConverter.obsvbLstOfChecklistSectionFromJson,
      toJson: ObservableListJsonConverter.obsvbLstOfChecklistSectionToJson)
  ObservableList<ChecklistSection> _sections =
      ObservableList<ChecklistSection>();

  @readonly
  @JsonKey(
      includeFromJson: true,
      includeToJson: true,
      fromJson: ObservableListJsonConverter
          .obsvbLstOfObsvbLstOfChecklistCheckFromJson,
      toJson:
          ObservableListJsonConverter.obsvbLstOfObsvbLstOfChecklistCheckToJson)
  ObservableList<ObservableList<ChecklistCheck>> _checks =
      ObservableList<ObservableList<ChecklistCheck>>();

  @readonly
  ObservableList<LinearityRow> _linearityWorksheet =
      ObservableList<LinearityRow>();

  @readonly
  int _linearityCheckReferenceCount = -1;

  @readonly
  String _linearityCheckMeasurement = '';

  @readonly
  ObservableMap<String, ObservableList<LinearityRow>> _linearityWorksheets =
      ObservableMap();

  @readonly
  ObservableMap<String, int> _linearityCheckReferenceCounts = ObservableMap();

  @readonly
  ObservableList<ObservableList<bool>> _checksOk =
      ObservableList<ObservableList<bool>>();

  @readonly
  ObservableList<ObservableList<int>> _emptyReferences =
      ObservableList<ObservableList<int>>();

  @readonly
  ObservableList<bool> _sectionsOk = ObservableList<bool>();

  @readonly
  ObservableList<bool> _previousSectionsOk = ObservableList<bool>();

  @readonly
  int _higherSectionEdited = -1;

  @readonly
  bool _checklistChanged = false;

  int _linearityStep1SectionIndex = -1;
  int _linearityStep1CheckIndex = -1;
  int _linearityStep2SectionIndex = -1;
  int _linearityStep2CheckIndex = -1;

  bool _nonOkChecksPerSectionUpdated = false;

  int _nonOkSectionsCount = -1;

  final List<int> _nonOkChecksPerSection = [];

  Template _currentTemplate = Template.empty();

  int get nonOkSectionsCount {
    if (!_nonOkChecksPerSectionUpdated) {
      _updateNonOkSections();
    }

    return _nonOkSectionsCount;
  }

  void _updateNonOkSections() {
    var nonOkSections = 0;
    _nonOkChecksPerSection.clear();

    for (var index = 0; index < _checksOk.length; index++) {
      int nonOkCount = 0;

      for (var checkIndex = 0;
          checkIndex < _checksOk[index].length;
          checkIndex++) {
        bool notOk = false;
        if (!_checksOk[index][checkIndex]) {
          notOk = true;
        }
        if (!notOk) {
          final check = _checks[index][checkIndex];
          if (check is ChecklistRegularCheck) {
            if (_emptyReferences[index][checkIndex] > 0) {
              notOk = true;
            }
          }
        }

        if (notOk) {
          nonOkCount++;
        }
      }

      _nonOkChecksPerSection.add(nonOkCount);
      if (nonOkCount > 0) {
        nonOkSections++;
      }
    }

    _nonOkChecksPerSectionUpdated = true;
    _nonOkSectionsCount = nonOkSections;
  }

  List<int> get nonOkChecksPerSection {
    if (!_nonOkChecksPerSectionUpdated) {
      _updateNonOkSections();
    }

    return _nonOkChecksPerSection;
  }

  String createChecklistFile() {
    final jsonContent =
        jsonEncode(_$ChecklistEditorStoreToJson(this as ChecklistEditorStore));

    return jsonContent;
  }

  Future<String> createShareableFile() async {
    Directory directory = await CCRDirectory.shared();
    final formattedDateTime =
        DateFormat('yyyy-MM-dd_HH:mm:ss').format(DateTime.now());
    String filename = 'ccrchecklist_$formattedDateTime.$ccrChecklistExtension';
    filename = slugify(filename);
    final file =
        await File('${directory.path}/$filename').create(recursive: true);

    final jsonContent = createChecklistFile();

    await file.writeAsString(jsonContent);

    return file.path;
  }

  @action
  void setCheckIsChecked(int sectionIndex, int checkIndex, bool value) {
    _setCheckIsChecked(sectionIndex, checkIndex, value);
  }

  void _setCheckIsChecked(int sectionIndex, int checkIndex, bool value) {
    if (_checks[sectionIndex][checkIndex].isChecked == value) {
      return;
    }

    final now = DateTime.now();

    _checks[sectionIndex][checkIndex] =
        _checks[sectionIndex][checkIndex].copyWith(
      isChecked: value,
      lastChange: now,
    );

    _sections[sectionIndex].checks[checkIndex] =
        _sections[sectionIndex].checks[checkIndex].copyWith(
              isChecked: value,
              lastChange: now,
            );

    _lastChange = now;
    _nonOkChecksPerSectionUpdated = false;
    _checklistChanged = true;

    _statusUpdate(sectionIndex, checkIndex);
  }

  void _statusUpdate(int sectionIndex, int checkIndex) {
    _isCheckOk(sectionIndex, checkIndex);
    _updateEmptyRefs(sectionIndex, checkIndex);
    _isSectionOk(sectionIndex);
    _isPreviousSectionsOk(sectionIndex);
  }

  void _updateEmptyRefs(int sectionIndex, int checkIndex) {
    int emptyRefs = 0;
    final check = _checks[sectionIndex][checkIndex];
    if (check is ChecklistRegularCheck) {
      for (var index = 0; index < check.references.length; index++) {
        if (check.references[index].value == null) {
          emptyRefs++;
        }
      }
    }
    if (_emptyReferences[sectionIndex][checkIndex] != emptyRefs) {
      _emptyReferences[sectionIndex][checkIndex] = emptyRefs;
      _nonOkChecksPerSectionUpdated = false;
    }
  }

  void _isCheckOk(int sectionIndex, int checkIndex) {
    final check = _checks[sectionIndex][checkIndex];

    _checksOk[sectionIndex][checkIndex] = check.isChecked;
  }

  void _isSectionOk(int sectionIndex) {
    bool isOk = true;
    for (var index = 0; index < _checksOk[sectionIndex].length; index++) {
      if (!_checksOk[sectionIndex][index]) {
        isOk = false;
        break;
      }
      if (_emptyReferences[sectionIndex][index] != 0) {
        isOk = false;
        break;
      }
    }

    _sectionsOk[sectionIndex] = isOk;
  }

  void _isPreviousSectionsOk(int sectionIndex) {
    if (sectionIndex >= _previousSectionsOk.length - 1) {
      return;
    }

    bool isOk = true;
    for (var index = 0; index <= sectionIndex; index++) {
      if (!_sectionsOk[index]) {
        isOk = false;
        break;
      }
    }

    _previousSectionsOk[sectionIndex + 1] = isOk;
  }

  @action
  void updateLinearityMV(int referenceIndex, double value) {
    _linearityWorksheet[referenceIndex] =
        _linearityWorksheet[referenceIndex].copyWith(mv: value);

    bool isOk = true;
    for (var index = 0; index < _linearityCheckReferenceCount; index++) {
      if (_linearityWorksheet[index].mv == null) {
        isOk = false;
        break;
      }
    }
    _setCheckIsChecked(
        _linearityStep1SectionIndex, _linearityStep1CheckIndex, isOk);

    _checklistChanged = true;
  }

  int getCompleteLinearityReferenceCount(int sectionIndex, int checkIndex) {
    final String key = _getCompleteLinearityKey(sectionIndex, checkIndex);

    return _linearityCheckReferenceCounts[key] ?? 0;
  }

  int getCompleteLinearityReferenceCountByKey(String key) {
    return _linearityCheckReferenceCounts[key] ?? 0;
  }

  ObservableList<LinearityRow> getCompleteLinearityWorksheet(
    int sectionIndex,
    int checkIndex,
  ) {
    final String key = _getCompleteLinearityKey(sectionIndex, checkIndex);

    return _linearityWorksheets[key] ?? ObservableList();
  }

  String _getCompleteLinearityKey(int sectionIndex, int checkIndex) {
    return '$sectionIndex-$checkIndex';
  }

  @action
  void updateCompleteLinearity(
    int sectionIndex,
    int checkIndex,
    int rowIndex,
    LinearityCheckDataType dataType,
    double value,
  ) {
    final String key = _getCompleteLinearityKey(sectionIndex, checkIndex);

    if (!_linearityWorksheets.containsKey(key) ||
        !_linearityCheckReferenceCounts.containsKey(key)) {
      return;
    }

    switch (dataType) {
      case LinearityCheckDataType.mv:
        _linearityWorksheets[key]![rowIndex] =
            _linearityWorksheets[key]![rowIndex].copyWith(mv: value);
        break;
      case LinearityCheckDataType.actual:
        _linearityWorksheets[key]![rowIndex] =
            _linearityWorksheets[key]![rowIndex].copyWith(actual: value);
        break;
    }

    bool isOk = true;
    final int maxReferences = _linearityCheckReferenceCounts[key] ?? 0;
    for (var index = 0; index < maxReferences; index++) {
      final row = _linearityWorksheets[key]![index];

      if ((row.mv == null) || (row.actual == null)) {
        isOk = false;
        break;
      }
    }
    _setCheckIsChecked(sectionIndex, checkIndex, isOk);

    _checklistChanged = true;
  }

  @action
  void updateLinearityActual(int referenceIndex, double value) {
    _linearityWorksheet[referenceIndex] =
        _linearityWorksheet[referenceIndex].copyWith(actual: value);

    bool isOk = true;
    for (var index = 0; index < _linearityCheckReferenceCount; index++) {
      if (_linearityWorksheet[index].actual == null) {
        isOk = false;
        break;
      }
    }
    _setCheckIsChecked(
        _linearityStep2SectionIndex, _linearityStep2CheckIndex, isOk);

    _checklistChanged = true;
  }

  @action
  Future<bool> loadFromTemplate(BuildContext context, Template template) async {
    return await _loadFromTemplate(context, template);
  }

  void _resetStore() {
    _sections.clear();
    _checks.clear();
    _checksOk.clear();
    _emptyReferences.clear();
    _sectionsOk.clear();
    _previousSectionsOk.clear();
    _linearityWorksheets.clear();
    _linearityCheckReferenceCounts.clear();
    _linearityWorksheet.clear();
    _linearityCheckReferenceCount = -1;
    _linearityCheckMeasurement = '';
    _linearityStep1SectionIndex = -1;
    _linearityStep1CheckIndex = -1;
    _linearityStep2SectionIndex = -1;
    _linearityStep2CheckIndex = -1;
    _nonOkChecksPerSectionUpdated = false;
    _nonOkSectionsCount = -1;
    _nonOkChecksPerSection.clear();
    _higherSectionEdited = -1;
    _checklistChanged = false;
  }

  Future<void> _showNoPagesTemplateDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Empty Checklist'),
        content: const Text('The selected checklist is empty.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
    return;
  }

  Future<bool> _loadFromTemplate(
      BuildContext context, Template template) async {
    if (template.sections.isEmpty) {
      await _showNoPagesTemplateDialog(context);
      return false;
    }

    _resetStore();

    _rebreatherManufacturer = template.rebreatherManufacturer;
    _rebreatherModel = template.rebreatherModel;
    _title = template.title;
    _description = template.description;
    _date = DateTime.now();
    _diverName = '';

    for (int sectionIndex = 0;
        sectionIndex < template.sections.length;
        sectionIndex++) {
      final templateSection = template.sections[sectionIndex];
      final checks =
          _getChecksFromTemplateChecks(templateSection.checks, sectionIndex);
      _sections.add(ChecklistSection(
        title: templateSection.title,
        checks: checks,
      ));
      _checks.add(ObservableList<ChecklistCheck>.of(checks));
      _checksOk.add(ObservableList<bool>.of(
          List<bool>.generate(checks.length, (index) => false)));
      _emptyReferences.add(ObservableList<int>.of(
          List<int>.generate(checks.length, (index) => 0)));
    }
    _sectionsOk.addAll(
        List<bool>.generate(template.sections.length, (index) => false));
    _previousSectionsOk.addAll(
        List<bool>.generate(template.sections.length, (index) => false));
    _previousSectionsOk[0] = true;
    _currentTemplate = template;
    _checklistChanged = false;

    return true;
  }

  @action
  void setCheckReferenceValue(
      int sectionIndex, int checkIndex, int refIndex, double? newValue) {
    final check = _checks[sectionIndex][checkIndex];

    if (check is! ChecklistRegularCheck) {
      return;
    }

    final references = check.references;
    final now = DateTime.now();

    references[refIndex] = references[refIndex].copyWith(value: newValue);
    _checks[sectionIndex][checkIndex] =
        check.copyWith(references: references, lastChange: now);
    _sections[sectionIndex].checks[checkIndex] =
        check.copyWith(references: references, lastChange: now);

    _checklistChanged = true;
    _lastChange = now;

    _statusUpdate(sectionIndex, checkIndex);
  }

  List<ChecklistCheck> _getChecksFromTemplateChecks(
      List<TemplateCheck> templateChecks, int sectionIndex) {
    List<ChecklistCheck> checks = [];

    for (int checkIndex = 0; checkIndex < templateChecks.length; checkIndex++) {
      ChecklistCheck checklistCheck;
      final templateCheck = templateChecks[checkIndex];

      if (templateCheck is TemplateRegularCheck) {
        final checklistReferences = List<RegularCheckReference>.generate(
          templateCheck.references.length,
          (index) => RegularCheckReference(
            prefix: templateCheck.references[index].prefix,
            suffix: templateCheck.references[index].suffix,
            value: null,
          ),
        );
        checklistCheck = ChecklistRegularCheck(
          description: templateCheck.description,
          observation: templateCheck.observation,
          lastChange: DateTime.now(),
          isChecked: false,
          references: checklistReferences,
          secondsTimer: templateCheck.secondsTimer,
        );
      } else if (templateCheck is TemplateCompleteLinearityCheck) {
        final String key = _getCompleteLinearityKey(sectionIndex, checkIndex);
        final referenceCount = templateCheck.referenceCount;

        _linearityCheckReferenceCounts[key] = referenceCount;
        _linearityWorksheets[key] = ObservableList();
        _linearityWorksheets[key]!.addAll(
          List<LinearityRow>.generate(
            referenceCount,
            (index) => LinearityRow(),
          ),
        );
        checklistCheck = ChecklistCompleteLinearityCheck(
          measurement: templateCheck.measurement,
          description: templateCheck.description,
          lastChange: DateTime.now(),
          isChecked: false,
          referenceCount: referenceCount,
        );
      } else if (templateCheck is TemplateLinearityStep1Check) {
        _linearityStep1SectionIndex = sectionIndex;
        _linearityStep1CheckIndex = checkIndex;
        _linearityCheckReferenceCount = templateCheck.referenceCount;
        _linearityCheckMeasurement = templateCheck.measurement;
        _linearityWorksheet.clear();
        _linearityWorksheet.addAll(
          List<LinearityRow>.generate(
            _linearityCheckReferenceCount,
            (index) => LinearityRow(),
          ),
        );
        checklistCheck = ChecklistLinearityStep1Check(
          measurement: templateCheck.measurement,
          description: templateCheck.description,
          lastChange: DateTime.now(),
          isChecked: false,
          referenceCount: _linearityCheckReferenceCount,
        );
      } else {
        _linearityStep2SectionIndex = sectionIndex;
        _linearityStep2CheckIndex = checkIndex;
        checklistCheck = ChecklistLinearityStep2Check(
          description: templateCheck.description,
          lastChange: DateTime.now(),
          isChecked: false,
        );
      }

      checks.add(checklistCheck);
    }

    return checks;
  }

  @action
  Future<bool> resetChecklist(BuildContext context) async {
    return await _loadFromTemplate(context, _currentTemplate);
  }

  @action
  void setTitle(String value) {
    _title = value;
  }

  @action
  void setDescription(String value) {
    _description = value;
  }

  @action
  void setDiverName(String value) {
    _diverName = value;
  }

  @action
  void setDate(DateTime value) {
    _date = value;
  }
}
