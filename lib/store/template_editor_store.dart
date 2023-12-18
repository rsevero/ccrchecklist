import 'dart:convert';
import 'dart:io';
import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/data/template_section.dart';
import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/main.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/store/observablelist_json_converter.dart';
import 'package:ccr_checklist/undo/undo_redo_storage.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';

part 'template_editor_store.g.dart';

@JsonSerializable(explicitToJson: true)
class TemplateEditorStore extends _TemplateEditorStoreBaseToJson
    with _$TemplateEditorStore {
  TemplateEditorStore();

  factory TemplateEditorStore.fromJson(Map<String, dynamic> json) =>
      _$TemplateEditorStoreFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateEditorStoreToJson(this);
}

abstract class _TemplateEditorStoreBaseToJson with Store {
  final _undoRedoClass = 'TemplateEditorStore';

  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  Template _currentTemplate = Template.empty();

  @readonly
  @JsonKey(
      includeFromJson: true,
      includeToJson: true,
      fromJson: ObservableListJsonConverter.obsvbLstOfTemplateSectionFromJson,
      toJson: ObservableListJsonConverter.obsvbLstOfTemplateSectionToJson)
  ObservableList<TemplateSection> _sections = ObservableList<TemplateSection>();

  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  TemplateSection _selectedSection = TemplateSection.empty();

  @readonly
  @JsonKey(
      includeFromJson: true,
      includeToJson: true,
      fromJson:
          ObservableListJsonConverter.obsvbLstOfObsvbLstOfTemplateCheckFromJson,
      toJson:
          ObservableListJsonConverter.obsvbLstOfObsvbLstOfTemplateCheckToJson)
  ObservableList<ObservableList<TemplateCheck>> _checks =
      ObservableList<ObservableList<TemplateCheck>>();

  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  int _selectedSectionIndex = -1;

  @computed
  bool get enableCheckCreation => _sections.isNotEmpty;

  @computed
  bool get enableLinearityStep2Creation =>
      _sections.isNotEmpty && _hasLinearityStep1 && !_hasLinearityStep2;

  @computed
  bool get enableLinearityStep1Creation =>
      _sections.isNotEmpty && !_hasLinearityStep1;

  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  bool _hasLinearityStep1 = false;

  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  bool _hasLinearityStep2 = false;

  @readonly
  bool _canUndo = false;

  @readonly
  bool _canRedo = false;

  @readonly
  String _undoDescription = '';

  @readonly
  String _redoDescription = '';

  void _saveSnapshot(String operation) {
    final snapshot = _$TemplateEditorStoreToJson(this as TemplateEditorStore);
    final undoRedoStatus =
        undoRedoStorage.addUndo(_undoRedoClass, operation, snapshot);

    _canUndo = undoRedoStatus.canUndo;
    _canRedo = undoRedoStatus.canRedo;
    _undoDescription = undoRedoStatus.undoDescription;
    _redoDescription = undoRedoStatus.redoDescription;
  }

  String createTemplateFile(Template template) {
    String jsonTemplate = jsonEncode(template.toJson());
    return jsonTemplate;
  }

  Future<String> createShareableFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final formattedDateTime =
        DateFormat('yyyy-MM-dd_HH:mm:ss').format(DateTime.now());
    final file = File(
        '${directory.path}/ccr_template_$formattedDateTime.$ccrTemplateExtension');
    final jsonContent = createTemplateFile(_currentTemplate);

    await file.writeAsString(jsonContent);

    return file.path;
  }

  @action
  void undo() {
    final undoRedoRequest = undoRedoStorage.getUndo(_undoRedoClass);
    if (!undoRedoRequest.available) {
      return;
    }

    _applySnapshot(undoRedoRequest.json!);
    _updateUndoRedoStatus(undoRedoRequest.undoRedoStatus);
  }

  void _updateUndoRedoStatus(UndoRedoStatus undoRedoStatus) {
    _canUndo = undoRedoStatus.canUndo;
    _canRedo = undoRedoStatus.canRedo;
    _undoDescription = undoRedoStatus.undoDescription;
    _redoDescription = undoRedoStatus.redoDescription;
  }

  @action
  void redo() {
    final undoRedoRequest = undoRedoStorage.getRedo(_undoRedoClass);
    if (!undoRedoRequest.available) {
      return;
    }

    _applySnapshot(undoRedoRequest.json!);
    _updateUndoRedoStatus(undoRedoRequest.undoRedoStatus);
  }

  void _applySnapshot(Map<String, dynamic> json) {
    final templateEditorStore = TemplateEditorStore.fromJson(json);

    _currentTemplate = templateEditorStore._currentTemplate;
    _sections = templateEditorStore._sections;
    _selectedSection = templateEditorStore._selectedSection;
    _checks = templateEditorStore._checks;
    _selectedSectionIndex = templateEditorStore._selectedSectionIndex;
    _hasLinearityStep1 = templateEditorStore._hasLinearityStep1;
    _hasLinearityStep2 = templateEditorStore._hasLinearityStep2;
  }

  @action
  void addLinearityStep2Check() {
    final newLinearityStep2Check = TemplateLinearityStep2Check();
    _selectedSection.checks.add(newLinearityStep2Check);
    _checks[_selectedSectionIndex].add(newLinearityStep2Check);
    _updateHasLinearitySteps();
    _saveSnapshot('Add linearity step 2');
  }

  @action
  void addLinearityStep1Check({required int referenceCount}) {
    final newLinearityStep1Check =
        TemplateLinearityStep1Check(referenceCount: referenceCount);
    _selectedSection.checks.add(newLinearityStep1Check);
    _checks[_selectedSectionIndex].add(newLinearityStep1Check);
    _updateHasLinearitySteps();
    _saveSnapshot('Add linearity step 1');
  }

  @action
  void addRegularCheck(
      {required String description,
      required int secondsTimer,
      required int referenceCount}) {
    final newRegularCheck = TemplateRegularCheck(
        description: description,
        secondsTimer: secondsTimer,
        referenceCount: referenceCount);
    _selectedSection.checks.add(newRegularCheck);
    _checks[_selectedSectionIndex].add(newRegularCheck);
    _saveSnapshot('Add regular check');
  }

  @action
  void addSection({required String title}) {
    _selectedSection = TemplateSection(title: title, checks: []);
    _currentTemplate.sections.add(_selectedSection);
    _sections.add(_selectedSection);
    _checks.add(ObservableList.of(_selectedSection.checks));
    _selectLastSection();
    _saveSnapshot('Add section');
  }

  void _updateHasLinearitySteps() {
    bool hasStep1 = false;
    bool hasStep2 = false;
    for (final checkList in _checks) {
      for (final aCheck in checkList) {
        if (aCheck is TemplateLinearityStep1Check) {
          hasStep1 = true;
        } else if (aCheck is TemplateLinearityStep2Check) {
          hasStep2 = true;
        }
      }
    }

    _hasLinearityStep1 = hasStep1;
    _hasLinearityStep2 = hasStep2;
  }

  void _selectLastSection() {
    _setSelectedSectionByIndex(_sections.length - 1);
  }

  void _setSelectedSectionByIndex(int sectionIndex) {
    if (_sections.isEmpty || (sectionIndex < 0)) {
      _selectedSectionIndex = -1;
      _selectedSection = TemplateSection.empty();
      return;
    }

    if (sectionIndex >= _sections.length) {
      sectionIndex = _sections.length - 1;
    }

    _selectedSection = _sections[sectionIndex];
    _selectedSectionIndex = sectionIndex;
  }

  @action
  void setCurrentTemplate(Template template) {
    _currentTemplate = template;
    _sections = ObservableList.of(template.sections);
    for (final section in _currentTemplate.sections) {
      _checks.add(ObservableList.of(section.checks));
    }
    _selectLastSection();

    undoRedoStorage.clearUndoRedo(_undoRedoClass);
    _saveSnapshot('Set current template');
  }

  @action
  void moveCheckToAnotherSection(
      int currentSectionIndex, int checkIndex, int newSectionIndex) {
    if (currentSectionIndex == newSectionIndex) {
      return;
    }

    final check = _checks[currentSectionIndex][checkIndex];
    _checks[currentSectionIndex].removeAt(checkIndex);
    _currentTemplate.sections[currentSectionIndex].checks.removeAt(checkIndex);

    _checks[newSectionIndex].add(check);
    _currentTemplate.sections[newSectionIndex].checks.add(check);

    _setSelectedSectionByIndex(newSectionIndex);
    _saveSnapshot('Move check to another section');
  }

  @action
  void updateRegularCheck(int sectionIndex, int checkIndex,
      {String? description, int? timerDuration, int? referenceCount}) {
    final check = _checks[sectionIndex][checkIndex] as TemplateRegularCheck;

    final newCheck = check.copyWith(
        description: description ?? check.description,
        secondsTimer: timerDuration ?? check.secondsTimer,
        referenceCount: referenceCount ?? check.referenceCount);

    _currentTemplate.sections[sectionIndex].checks[checkIndex] = newCheck;
    _checks[sectionIndex][checkIndex] = newCheck;
    _saveSnapshot('Update regular check');
  }

  @action
  void updateLinearityStep1Check(
      int sectionIndex, int checkIndex, int referenceCount) {
    final check =
        _checks[sectionIndex][checkIndex] as TemplateLinearityStep1Check;
    final newCheck = check.copyWith(referenceCount: referenceCount);

    _currentTemplate.sections[sectionIndex].checks[checkIndex] = newCheck;
    _checks[sectionIndex][checkIndex] = newCheck;
    _saveSnapshot('Update linearity step 1 check');
  }

  @action
  void moveSection(int oldSectionIndex, int newSectionIndex) {
    if (oldSectionIndex == newSectionIndex) {
      return;
    }
    if (oldSectionIndex < newSectionIndex) {
      newSectionIndex -= 1;
    }

    final section = _currentTemplate.sections.removeAt(oldSectionIndex);
    _currentTemplate.sections.insert(newSectionIndex, section);

    final observableSection = _sections.removeAt(oldSectionIndex);
    _sections.insert(newSectionIndex, observableSection);

    final observableChecks = _checks.removeAt(oldSectionIndex);
    _checks.insert(newSectionIndex, observableChecks);

    _setSelectedSectionByIndex(newSectionIndex);
    _saveSnapshot('Move section');
  }

  @action
  void updateTemplate(
      String rebreatherModel, String title, String description) {
    final newTemplate = _currentTemplate.copyWith(
        description: description,
        rebreatherModel: rebreatherModel,
        title: title);

    _currentTemplate = newTemplate;
    _saveSnapshot('Update template');
  }

  @action
  void updateSectionTitle(int sectionIndex, String newTitle) {
    if (sectionIndex >= 0 && sectionIndex < _currentTemplate.sections.length) {
      final updatedTemplateSection =
          _currentTemplate.sections[sectionIndex].copyWith(title: newTitle);

      _currentTemplate.sections[sectionIndex] = updatedTemplateSection;
      _sections[sectionIndex] = updatedTemplateSection;
      _saveSnapshot('Update section title');
    }
  }

  @action
  void deleteSection(int index) {
    if (index >= 0 && index < _currentTemplate.sections.length) {
      _currentTemplate.sections.removeAt(index);
      _sections.removeAt(index);
      _setSelectedSectionByIndex(index);
      _updateHasLinearitySteps();
      _saveSnapshot('Delete section');
    }
  }

  @action
  void deleteCheck(int sectionIndex, int index) {
    if (((sectionIndex >= 0) &&
            (sectionIndex < _currentTemplate.sections.length)) &&
        ((index >= 0) &&
            (index < _currentTemplate.sections[sectionIndex].checks.length))) {
      _currentTemplate.sections[sectionIndex].checks.removeAt(index);
      _checks[sectionIndex].removeAt(index);
      _updateHasLinearitySteps();
      _saveSnapshot('Delete check');
    }
  }
}
