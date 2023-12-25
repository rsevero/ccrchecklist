import 'dart:convert';
import 'dart:io';
import 'package:ccr_checklist/data/regular_check_reference.dart';
import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/data/template_section.dart';
import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/main.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/misc/get_directory_helper.dart';
import 'package:ccr_checklist/store/observablelist_json_converter.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
import 'package:ccr_checklist/undo/undo_redo_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

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
  @JsonKey(includeFromJson: true, includeToJson: true)
  bool _currentTemplateIsModified = false;

  @readonly
  @JsonKey(includeFromJson: true, includeToJson: true)
  bool _isCurrentTemplateAsset = false;

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

  @readonly
  ObservableMap<int, bool> _isSectionExpanded = ObservableMap<int, bool>();

  @readonly
  bool _isAnySectionExpanded = false;

  @action
  void setExpandedSection(int sectionIndex, bool expanded) {
    _isSectionExpanded[sectionIndex] = expanded;
    _updateIsAnySectionExpanded();
  }

  void _updateIsAnySectionExpanded() {
    _isAnySectionExpanded = _isSectionExpanded.values.any((element) => element);
  }

  @action
  void setExpandedSectionIfUnset(int sectionIndex, bool expanded) {
    if (!_isSectionExpanded.containsKey(sectionIndex)) {
      _isSectionExpanded[sectionIndex] = expanded;
      _updateIsAnySectionExpanded();
    }
  }

  void _saveSnapshot(String operation) {
    final snapshot = _$TemplateEditorStoreToJson(this as TemplateEditorStore);
    final undoRedoStatus =
        undoRedoStorage.addUndo(_undoRedoClass, operation, snapshot);

    _canUndo = undoRedoStatus.canUndo;
    _canRedo = undoRedoStatus.canRedo;
    _undoDescription = undoRedoStatus.undoDescription;
    _redoDescription = undoRedoStatus.redoDescription;
    _currentTemplateIsModified = true;
  }

  String createTemplateFile(Template template) {
    String jsonTemplate = jsonEncode(template.toJson());
    return jsonTemplate;
  }

  Future<String> createShareableFile() async {
    final directory = await ccrGetSharedDirectory();
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
  Future<bool> saveTemplate(BuildContext context, Template template,
      [String filePath = '']) async {
    filePath = filePath.trim();

    if (filePath.isEmpty) {
      filePath = template.path;
      if (filePath.isEmpty) {
        return false;
      }
    } else {
      template = template.copyWith(path: filePath);
    }

    final jsonTemplate = createTemplateFile(template);

    try {
      final file = File(filePath);
      file.writeAsString(jsonTemplate);
      if (!context.mounted) return false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Template "$filePath" saved successfully.'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      if (!context.mounted) return false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save template: $e'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    _currentTemplate = template;
    undoRedoStorage.clearUndoRedo(_undoRedoClass);
    _saveSnapshot('Save template');
    _currentTemplateIsModified = false;
    _isCurrentTemplateAsset = false;

    if (!context.mounted) return false;
    final templateListStore =
        Provider.of<TemplateListStore>(context, listen: false);
    templateListStore.invalidate();

    return true;
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
  void addLinearityStep2Check({required String description}) {
    final newLinearityStep2Check =
        TemplateLinearityStep2Check(description: description);
    _selectedSection.checks.add(newLinearityStep2Check);
    _checks[_selectedSectionIndex].add(newLinearityStep2Check);
    _updateHasLinearitySteps();
    _saveSnapshot('Add linearity step 2');
  }

  @action
  void addLinearityStep1Check(
      {required String description, required int referenceCount}) {
    final newLinearityStep1Check = TemplateLinearityStep1Check(
        referenceCount: referenceCount, description: description);
    _selectedSection.checks.add(newLinearityStep1Check);
    _checks[_selectedSectionIndex].add(newLinearityStep1Check);
    _updateHasLinearitySteps();
    _saveSnapshot('Add linearity step 1');
  }

  @action
  void addRegularCheck(
      {required String description,
      required String observation,
      required int secondsTimer,
      required List<RegularCheckReference> references}) {
    final newRegularCheck = TemplateRegularCheck(
        description: description,
        observation: observation,
        secondsTimer: secondsTimer,
        references: references);
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
  void setCurrentTemplate(Template template, [bool isAsset = false]) {
    _currentTemplate = template;
    _sections = ObservableList.of(template.sections);
    for (final section in _currentTemplate.sections) {
      _checks.add(ObservableList.of(section.checks));
    }
    _selectLastSection();
    _updateHasLinearitySteps();

    undoRedoStorage.clearUndoRedo(_undoRedoClass);
    _saveSnapshot('Set current template');
    _currentTemplateIsModified = false;
    _isCurrentTemplateAsset = isAsset;
  }

  @action
  void moveCheck(int sectionIndex, int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final check = _checks[sectionIndex].removeAt(oldIndex);
    _checks[sectionIndex].insert(newIndex, check);

    final templateSection = _currentTemplate.sections[sectionIndex];
    final templateCheck = templateSection.checks.removeAt(oldIndex);
    templateSection.checks.insert(newIndex, templateCheck);

    _saveSnapshot('Move check');
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
      {String? description,
      String? observation,
      int? timerDuration,
      List<RegularCheckReference>? references}) {
    final check = _checks[sectionIndex][checkIndex] as TemplateRegularCheck;

    final newCheck = check.copyWith(
        description: description ?? check.description,
        observation: observation ?? check.observation,
        secondsTimer: timerDuration ?? check.secondsTimer,
        references: references ?? check.references);

    _currentTemplate.sections[sectionIndex].checks[checkIndex] = newCheck;
    _checks[sectionIndex][checkIndex] = newCheck;
    _saveSnapshot('Update regular check');
  }

  @action
  void updateLinearityStep1Check(
    int sectionIndex,
    int checkIndex, {
    required int referenceCount,
    required String description,
  }) {
    final check =
        _checks[sectionIndex][checkIndex] as TemplateLinearityStep1Check;
    final newCheck = check.copyWith(
        referenceCount: referenceCount, description: description);

    _currentTemplate.sections[sectionIndex].checks[checkIndex] = newCheck;
    _checks[sectionIndex][checkIndex] = newCheck;
    _saveSnapshot('Update linearity step 1 check');
  }

  @action
  void updateLinearityStep2Check(
    int sectionIndex,
    int checkIndex, {
    required String description,
  }) {
    final check =
        _checks[sectionIndex][checkIndex] as TemplateLinearityStep2Check;
    final newCheck = check.copyWith(description: description);

    _currentTemplate.sections[sectionIndex].checks[checkIndex] = newCheck;
    _checks[sectionIndex][checkIndex] = newCheck;
    _saveSnapshot('Update linearity step 2 check');
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
  void updateTemplate({
    String? rebreatherManufacturer,
    String? rebreatherModel,
    String? title,
    String? description,
    String? filename,
  }) {
    final newTemplate = _currentTemplate.copyWith(
      rebreatherManufacturer:
          rebreatherManufacturer ?? _currentTemplate.rebreatherManufacturer,
      description: description ?? _currentTemplate.description,
      rebreatherModel: rebreatherModel ?? _currentTemplate.rebreatherModel,
      title: title ?? _currentTemplate.title,
      path: filename ?? _currentTemplate.path,
    );

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
  setSelectedSectionByIndex(int sectionIndex) {
    _setSelectedSectionByIndex(sectionIndex);
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
