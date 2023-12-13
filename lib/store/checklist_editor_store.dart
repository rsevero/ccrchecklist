import 'package:ccr_checklist/data/checklist_check.dart';
import 'package:ccr_checklist/data/checklist_section.dart';
import 'package:ccr_checklist/data/linearity_row.dart';
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
  void updateLinearityMV(int referenceIndex, double value) {
    _linearityWorksheet[referenceIndex] =
        _linearityWorksheet[referenceIndex].copyWith(mv: value);
  }

  @action
  void updateLinearityActual(int referenceIndex, double value) {
    _linearityWorksheet[referenceIndex] =
        _linearityWorksheet[referenceIndex].copyWith(actual: value);
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
    }
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
              createAndInitializeReferencesMap(templateCheck.referenceCount),
          secondsTimer: templateCheck.secondsTimer,
        );
      } else if (templateCheck is TemplateLinearityStep1Check) {
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
