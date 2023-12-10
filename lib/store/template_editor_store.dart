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
  ObservableList<ObservableList<TemplateCheck>> _checks =
      ObservableList<ObservableList<TemplateCheck>>();

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
  void addLinearityStep2Check() {
    final newLinearityStep2Check = TemplateLinearityStep2Check();
    _selectedSection.checks.add(newLinearityStep2Check);
    _checks[_selectedSectionIndex].add(newLinearityStep2Check);
    _updateHasLinearitySteps();
  }

  @action
  void addLinearityStep1Check({required int referenceCount}) {
    final newLinearityStep1Check =
        TemplateLinearityStep1Check(referenceCount: referenceCount);
    _selectedSection.checks.add(newLinearityStep1Check);
    _checks[_selectedSectionIndex].add(newLinearityStep1Check);
    _updateHasLinearitySteps();
  }

  @action
  void addWithReferenceCheck(
      {required String description, required int referenceCount}) {
    final newWithReferenceCheck = TemplateWithReferenceCheck(
        description: description, referenceCount: referenceCount);
    _selectedSection.checks.add(newWithReferenceCheck);
    _checks[_selectedSectionIndex].add(newWithReferenceCheck);
  }

  @action
  void addRegularCheck({required String description}) {
    final newRegularCheck = TemplateRegularCheck(description: description);
    _selectedSection.checks.add(newRegularCheck);
    _checks[_selectedSectionIndex].add(newRegularCheck);
  }

  @action
  void addSection({required String title}) {
    _selectedSection = TemplateSection(title: title, checks: []);
    _currentTemplate.sections.add(_selectedSection);
    _sections.add(_selectedSection);
    _checks.add(ObservableList.of(_selectedSection.checks));
    _selectLastSection();
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
    for (final section in _currentTemplate.sections) {
      _checks.add(ObservableList.of(section.checks));
    }
    _selectLastSection();
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
  }

  @action
  void updateRegularCheck(
      int sectionIndex, int checkIndex, String description) {
    final check = _checks[sectionIndex][checkIndex] as TemplateRegularCheck;
    final newCheck = check.copyWith(description: description);

    _currentTemplate.sections[sectionIndex].checks[checkIndex] = newCheck;
    _checks[sectionIndex][checkIndex] = newCheck;
  }

  @action
  void updateWithReferenceCheck(int sectionIndex, int checkIndex,
      String description, int referenceCount) {
    final check =
        _checks[sectionIndex][checkIndex] as TemplateWithReferenceCheck;
    final newCheck = check.copyWith(
        description: description, referenceCount: referenceCount);

    _currentTemplate.sections[sectionIndex].checks[checkIndex] = newCheck;
    _checks[sectionIndex][checkIndex] = newCheck;
  }

  @action
  void updateLinearityStep1Check(
      int sectionIndex, int checkIndex, int referenceCount) {
    final check =
        _checks[sectionIndex][checkIndex] as TemplateLinearityStep1Check;
    final newCheck = check.copyWith(referenceCount: referenceCount);

    _currentTemplate.sections[sectionIndex].checks[checkIndex] = newCheck;
    _checks[sectionIndex][checkIndex] = newCheck;
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
  }

  @action
  void updateTemplate(
      String rebreatherModel, String title, String description) {
    final newTemplate = _currentTemplate.copyWith(
        description: description,
        rebreatherModel: rebreatherModel,
        title: title);

    _currentTemplate = newTemplate;
  }

  @action
  void updateSectionTitle(int sectionIndex, String newTitle) {
    if (sectionIndex >= 0 && sectionIndex < _currentTemplate.sections.length) {
      final updatedTemplateSection =
          _currentTemplate.sections[sectionIndex].copyWith(title: newTitle);

      _currentTemplate.sections[sectionIndex] = updatedTemplateSection;
      _sections[sectionIndex] = updatedTemplateSection;
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
  void deleteCheck(int sectionIndex, int index) {
    if (((sectionIndex >= 0) &&
            (sectionIndex < _currentTemplate.sections.length)) &&
        ((index >= 0) &&
            (index < _currentTemplate.sections[sectionIndex].checks.length))) {
      _currentTemplate.sections[sectionIndex].checks.removeAt(index);
      _checks[sectionIndex].removeAt(index);
      _updateHasLinearitySteps();
    }
  }
}
