import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/data/template_section.dart';
import 'package:ccr_checklist/data/template.dart';
import 'package:mobx/mobx.dart';
import 'package:morphy_annotation/morphy_annotation.dart';

part 'template_editor_store.g.dart';

class TemplateEditorStore = TemplateEditorStoreBase with _$TemplateEditorStore;

abstract class TemplateEditorStoreBase with Store {
  @readonly
  Template _currentTemplate = $Template.empty();

  @readonly
  ObservableList<TemplateSection> _sections = ObservableList<TemplateSection>();

  @readonly
  TemplateSection _selectedSection = $TemplateSection.empty();

  @readonly
  ObservableList<TemplateCheck> _checks = ObservableList<TemplateCheck>();

  @readonly
  TemplateCheck? _selectedCheck;

  @readonly
  int _selectedSectionIndex = -1;

  @readonly
  int _selectedCheckIndex = -1;

  @readonly
  TemplateEditorSectionOrCheckSelected _sectionOrCheckSelected =
      TemplateEditorSectionOrCheckSelected.none;

  @computed
  bool get enableCheckCreation => _sections.isNotEmpty;

  @computed
  bool get enableLinearityStep2Creation =>
      _sections.isNotEmpty && _hasLinearityStep1 && !_hasLinearityStep2;

  @computed
  bool get enableLinearityStep1Creation =>
      _sections.isNotEmpty && !_hasLinearityStep1;

  @readonly
  bool _hasLinearityStep1 = false;

  @readonly
  bool _hasLinearityStep2 = false;

  @action
  void addNewSection(
      {required String title, required List<TemplateCheck> checks}) {
    _selectedSection = TemplateSection(title: title, checks: checks);
    _currentTemplate.sections.add(_selectedSection);
    _sections.add(_selectedSection);
    _selectLastSection();
    _updateHasLinearitySteps();
  }

  void _updateHasLinearitySteps() {
    _hasLinearityStep1 = _checks.any(
        (check) => (check.runtimeType == TemplateLinearityCheckStep1Check));
    _hasLinearityStep2 = _checks.any(
        (check) => (check.runtimeType == TemplateLinearityCheckStep2Check));
  }

  void _selectLastSection() {
    _setSelectedSectionByIndex(_sections.length - 1);
  }

  void _setSelectedSectionByIndex(int index) {
    if (_sections.isEmpty || (index < 0)) {
      _selectedSectionIndex = -1;
      _selectedSection = $TemplateSection.empty();
      _checks = ObservableList<TemplateCheck>();
      _updateHasLinearitySteps();
      _setSelectedCheckByIndex(-1);
      return;
    }

    if (index > _sections.length - 1) {
      index = _sections.length - 1;
    }

    _selectedSection = _sections[index];
    _checks = ObservableList.of(_selectedSection.checks);
    _selectedSectionIndex = index;
    _sectionOrCheckSelected = TemplateEditorSectionOrCheckSelected.section;
    _updateHasLinearitySteps();
  }

  void _setSelectedCheckByIndex(int index) {
    if (_checks.isEmpty || (index < 0)) {
      _selectedCheckIndex = -1;
      _selectedCheck = null;
      return;
    }

    if (index > _checks.length - 1) {
      index = _checks.length - 1;
    }

    _selectedCheck = _checks[index];
    _selectedCheckIndex = index;
    _sectionOrCheckSelected = TemplateEditorSectionOrCheckSelected.check;
  }

  @action
  void editTemplateRebreatherModel(String rebreatherModel) {
    _currentTemplate = _currentTemplate.copyWith_Template(
        rebreatherModel: Opt(rebreatherModel));
  }

  @action
  void editTemplateTitle(String title) {
    _currentTemplate = _currentTemplate.copyWith_Template(title: Opt(title));
  }

  @action
  void editTemplateDescription(String description) {
    _currentTemplate =
        _currentTemplate.copyWith_Template(description: Opt(description));
  }

  @action
  void setCurrentTemplate(Template template) {
    _currentTemplate = template;
    _sections = ObservableList.of(template.sections);
    _sectionOrCheckSelected = TemplateEditorSectionOrCheckSelected.none;
  }

  @action
  void moveCheckAnotherSection(TemplateCheck check, TemplateSection section) {
    if (section.checks.contains(check)) {
      return;
    }

    _selectedCheck = check;
    _selectedSection = section;
    _updateHasLinearitySteps();
  }

  @action
  void moveTemplateSection(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final section = _currentTemplate.sections.removeAt(oldIndex);
    _currentTemplate.sections.insert(newIndex, section);

    final observableSection = _sections.removeAt(oldIndex);
    _sections.insert(newIndex, observableSection);
  }

  @action
  void updateSectionTitle(int index, String newTitle) {
    if (index >= 0 && index < _currentTemplate.sections.length) {
      final updatedTemplateSection = _currentTemplate.sections[index]
          .copyWith_TemplateSection(title: Opt(newTitle));
      _currentTemplate.sections[index] = updatedTemplateSection;
      _sections[index] = updatedTemplateSection;
    }
  }

  @action
  void deleteSection(int index) {
    if (index >= 0 && index < _currentTemplate.sections.length) {
      _currentTemplate.sections.removeAt(index);
      _sections.removeAt(index);
      _setSelectedSectionByIndex(index);
    }
  }

  @action
  void deleteCheck(int index) {
    if (index >= 0 && index < _selectedSection.checks.length) {
      _selectedSection.checks.removeAt(index);
      _checks.removeAt(index);
    }
  }

  @action
  void onTapSection(int index) {
    _setSelectedSectionByIndex(index);
  }

  @action
  void onTapCheck(int index) {
    _setSelectedCheckByIndex(index);
  }
}

enum TemplateEditorSectionOrCheckSelected {
  none,
  section,
  check,
}
