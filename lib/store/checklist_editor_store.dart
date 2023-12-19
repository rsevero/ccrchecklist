import 'dart:convert';
import 'dart:io';
import 'package:ccr_checklist/data/checklist_check.dart';
import 'package:ccr_checklist/data/checklist_section.dart';
import 'package:ccr_checklist/data/linearity_row.dart';
import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/misc/helper_functions.dart';
import 'package:ccr_checklist/store/observablelist_json_converter.dart';
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
  bool _canUndo = false;

  @readonly
  bool _canRedo = false;

  @readonly
  String _undoDescription = '';

  @readonly
  String _redoDescription = '';

  @readonly
  ObservableList<LinearityRow> _linearityWorksheet =
      ObservableList<LinearityRow>();

  @readonly
  int _linearityCheckReferenceCount = 0;

  @readonly
  ObservableList<ObservableList<bool>> _checksOk =
      ObservableList<ObservableList<bool>>();

  @readonly
  ObservableList<bool> _sectionsOk = ObservableList<bool>();

  @readonly
  ObservableList<bool> _previousSectionsOk = ObservableList<bool>();

  @readonly
  int _higherSectionEdited = 0;

  int _linearityStep1SectionIndex = -1;
  int _linearityStep1CheckIndex = -1;
  int _linearityStep2SectionIndex = -1;
  int _linearityStep2CheckIndex = -1;

  bool _nonOkChecksPerSectionUpdated = false;

  int _nonOkSectionsCount = 0;

  final List<int> _nonOkChecksPerSection = [];

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
        if (!_checksOk[index][checkIndex]) {
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
    Directory directory = await ccrGetSharedDirectory();
    final formattedDateTime =
        DateFormat('yyyy-MM-dd_HH:mm:ss').format(DateTime.now());
    String filename = 'ccr_checklist_$formattedDateTime.$ccrChecklistExtension';
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

    _checks[sectionIndex][checkIndex] =
        _checks[sectionIndex][checkIndex].copyWith(
      isChecked: value,
      lastChange: DateTime.now(),
    );

    _nonOkChecksPerSectionUpdated = false;

    _updateOfStatus(sectionIndex, checkIndex);
  }

  void _updateOfStatus(int sectionIndex, int checkIndex) {
    _isCheckOk(sectionIndex, checkIndex);
    _isSectionOk(sectionIndex);
    _isPreviousSectionsOk(sectionIndex);
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
  }

  @action
  void loadFromTemplate(Template template) {
    _rebreatherManufacturer = template.rebreatherManufacturer;
    _rebreatherModel = template.rebreatherModel;
    _title = template.title;
    _description = template.description;
    _date = DateTime.now();
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
    }
    _sectionsOk.addAll(
        List<bool>.generate(template.sections.length, (index) => false));
    _previousSectionsOk.addAll(
        List<bool>.generate(template.sections.length, (index) => false));
    _previousSectionsOk[0] = true;
  }

  List<ChecklistCheck> _getChecksFromTemplateChecks(
      List<TemplateCheck> templateChecks, int sectionIndex) {
    List<ChecklistCheck> checks = [];

    for (int checkIndex = 0; checkIndex < templateChecks.length; checkIndex++) {
      final templateCheck = templateChecks[checkIndex];

      ChecklistCheck checklistCheck;
      if (templateCheck is TemplateRegularCheck) {
        checklistCheck = ChecklistRegularCheck(
          description: templateCheck.description,
          lastChange: DateTime.now(),
          isChecked: false,
          referenceCount: templateCheck.referenceCount,
          references:
              ccrCreateAndInitializeReferencesMap(templateCheck.referenceCount),
          secondsTimer: templateCheck.secondsTimer,
        );
      } else if (templateCheck is TemplateLinearityStep1Check) {
        _linearityStep1SectionIndex = sectionIndex;
        _linearityStep1CheckIndex = checkIndex;
        _linearityCheckReferenceCount = templateCheck.referenceCount;
        _linearityWorksheet.clear();
        _linearityWorksheet.addAll(
          List<LinearityRow>.generate(
            templateCheck.referenceCount,
            (index) => LinearityRow(),
          ),
        );
        checklistCheck = ChecklistLinearityStep1Check(
          lastChange: DateTime.now(),
          isChecked: false,
          referenceCount: _linearityCheckReferenceCount,
        );
      } else {
        _linearityStep2SectionIndex = sectionIndex;
        _linearityStep2CheckIndex = checkIndex;
        checklistCheck = ChecklistLinearityStep2Check(
          lastChange: DateTime.now(),
          isChecked: false,
          referenceCount: 0,
        );
      }
      checks.add(checklistCheck);
    }

    return checks;
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
  void setDate(DateTime value) {}
}
