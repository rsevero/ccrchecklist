import 'package:ccr_checklist/data/checklist_check.dart';
import 'package:ccr_checklist/data/checklist_section.dart';
import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/misc/helper_functions.dart';
import 'package:ccr_checklist/store/observablelist_json_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

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

  int _linearityCheckReferenceCount = 0;
  bool _linearityStep1CheckPresent = false;
  bool _linearityStep2CheckPresent = false;

  @action
  void setCheckIsChecked(int sectionIndex, int checkIndex, bool value) {
    if (_checks[sectionIndex][checkIndex].isChecked == value) {
      return;
    }

    _checks[sectionIndex][checkIndex] =
        _checks[sectionIndex][checkIndex].copyWith(
      isChecked: value,
      lastChange: DateTime.now(),
    );
  }

  @action
  void loadFromTemplate(Template template) {
    _title = template.title;
    _description = template.description;
    _linearityStep1CheckPresent = false;
    _linearityStep2CheckPresent = false;
    for (final templateSection in template.sections) {
      final checks = _getChecksFromTemplateChecks(templateSection.checks);
      _sections.add(ChecklistSection(
        title: templateSection.title,
        checks: checks,
      ));
      _checks.add(ObservableList<ChecklistCheck>.of(checks));
    }

    _updateLinearityStep2CheckReferenceCount();
  }

  void _updateLinearityStep2CheckReferenceCount() {
    if (!_linearityStep1CheckPresent || !_linearityStep2CheckPresent) {
      return;
    }

    for (int sectionIndex = 0;
        sectionIndex < _sections.length;
        sectionIndex++) {
      for (int checkIndex = 0;
          checkIndex < _sections[sectionIndex].checks.length;
          checkIndex++) {
        final check = _sections[sectionIndex].checks[checkIndex];
        if (check is ChecklistLinearityStep2Check) {
          if (check.referenceCount != _linearityCheckReferenceCount) {
            _sections[sectionIndex].checks[checkIndex] =
                _sections[sectionIndex].checks[checkIndex].copyWith(
                      referenceCount: _linearityCheckReferenceCount,
                      references: createAndInitializeReferencesMap(
                          _linearityCheckReferenceCount),
                    );
            _checks[sectionIndex][checkIndex] =
                _checks[sectionIndex][checkIndex].copyWith(
              referenceCount: _linearityCheckReferenceCount,
              references: createAndInitializeReferencesMap(
                  _linearityCheckReferenceCount),
            );
          }
          return;
        }
      }
    }
  }

  List<ChecklistCheck> _getChecksFromTemplateChecks(
      List<TemplateCheck> templateChecks) {
    List<ChecklistCheck> checks = [];

    for (final templateCheck in templateChecks) {
      ChecklistCheck checklistCheck;
      if (templateCheck is TemplateRegularCheck) {
        checklistCheck = ChecklistRegularCheck(
          description: templateCheck.description,
          lastChange: DateTime.now(),
          isChecked: false,
          referenceCount: templateCheck.referenceCount,
          references:
              createAndInitializeReferencesMap(templateCheck.referenceCount),
          secondsTimer: templateCheck.secondsTimer,
        );
      } else if (templateCheck is TemplateLinearityStep1Check) {
        _linearityStep1CheckPresent = true;
        _linearityCheckReferenceCount = templateCheck.referenceCount;
        checklistCheck = ChecklistLinearityStep1Check(
          lastChange: DateTime.now(),
          isChecked: false,
          referenceCount: templateCheck.referenceCount,
          references:
              createAndInitializeReferencesMap(templateCheck.referenceCount),
        );
      } else {
        _linearityStep2CheckPresent = true;
        checklistCheck = ChecklistLinearityStep2Check(
          lastChange: DateTime.now(),
          isChecked: false,
          referenceCount: 0,
          references: createAndInitializeReferencesMap(0),
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
