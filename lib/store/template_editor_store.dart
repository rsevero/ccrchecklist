import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/data/template_section.dart';
import 'package:ccr_checklist/data/template.dart';
import 'package:mobx/mobx.dart';

part 'template_editor_store.g.dart';

class TemplateEditorStore = TemplateEditorStoreBase with _$TemplateEditorStore;

abstract class TemplateEditorStoreBase with Store {
  @readonly
  Template _currentTemplate = Template.empty();

  @readonly
  ObservableList<TemplateSection> _sections = ObservableList<TemplateSection>();

  @readonly
  TemplateSection _selectedSection = TemplateSection.empty();

  @readonly
  ObservableList<TemplateCheck> _checks = ObservableList<TemplateCheck>();

  @readonly
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
  bool _hasLinearityStep1 = false;

  @readonly
  bool _hasLinearityStep2 = false;

  @action
  void addRegularCheck({required String description}) {
    final newRegularCheck = TemplateRegularCheck(description: description);
    _selectedSection.checks.add(newRegularCheck);
    _checks.add(newRegularCheck);
    _updateHasLinearitySteps();
  }

  @action
  void addNewSection({required String title}) {
    _selectedSection = TemplateSection(title: title, checks: []);
    _currentTemplate.sections.add(_selectedSection);
    _sections.add(_selectedSection);
    _selectLastSection();
    _updateHasLinearitySteps();
  }

  void _updateHasLinearitySteps() {
    bool hasStep1 = false;
    bool hasStep2 = false;
    for (final aSection in _currentTemplate.sections) {
      for (final aCheck in aSection.checks) {
        if (aCheck.runtimeType == TemplateLinearityStep1Check) {
          hasStep1 = true;
        } else if (aCheck.runtimeType == TemplateLinearityStep2Check) {
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

  void _setSelectedSectionByIndex(int index) {
    if (_sections.isEmpty || (index < 0)) {
      _selectedSectionIndex = -1;
      _selectedSection = TemplateSection.empty();
      _checks = ObservableList<TemplateCheck>();
      _updateHasLinearitySteps();
      return;
    }

    if (index > _sections.length - 1) {
      index = _sections.length - 1;
    }

    _selectedSection = _sections[index];
    _checks = ObservableList.of(_selectedSection.checks);
    _selectedSectionIndex = index;
  }

  @action
  void editTemplateRebreatherModel(String rebreatherModel) {
    _currentTemplate =
        _currentTemplate.copyWith(rebreatherModel: rebreatherModel);
  }

  @action
  void editTemplateTitle(String title) {
    _currentTemplate = _currentTemplate.copyWith(title: title);
  }

  @action
  void editTemplateDescription(String description) {
    _currentTemplate = _currentTemplate.copyWith(description: description);
  }

  @action
  void setCurrentTemplate(Template template) {
    _currentTemplate = template;
    _sections = ObservableList.of(template.sections);
  }

  @action
  void moveCheckAnotherSection(TemplateCheck check, TemplateSection section) {
    if (section.checks.contains(check)) {
      return;
    }

    _selectedSection = section;
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
      final updatedTemplateSection =
          _currentTemplate.sections[index].copyWith(title: newTitle);
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
      _updateHasLinearitySteps();
    }
  }

  @action
  void deleteCheck(TemplateCheck aCheck) {
    for (final aSection in _currentTemplate.sections) {
      if (aSection.checks.contains(aCheck)) {
        aSection.checks.remove(aCheck);
        if (aSection == _selectedSection) {
          _checks.remove(aCheck);
        }
        _updateHasLinearitySteps();
        return;
      }
    }
  }

  @action
  void onTapSection(int index) {
    _setSelectedSectionByIndex(index);
  }
}
