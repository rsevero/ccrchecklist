import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/data/template_section.dart';
import 'package:ccr_checklist/data/template.dart';
import 'package:flutter/material.dart';
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
  ObservableList<bool> _sectionsIsExpanded = ObservableList<bool>();

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

  @readonly
  Map<int, ExpansionTileController> _sectionExpansionTileControllers = {};

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
  void setSectionIsExpanded(int index, bool value) {
    if (index >= 0 && index < _sectionsIsExpanded.length) {
      _sectionsIsExpanded[index] = value;
    }
  }

  @action
  void addSection({required String title}) {
    _selectedSection = TemplateSection(title: title, checks: []);
    _currentTemplate.sections.add(_selectedSection);
    _sections.add(_selectedSection);
    _checks.add(ObservableList.of(_selectedSection.checks));
    _sectionsIsExpanded.add(true);
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

  void _setSelectedSectionByIndex(int index) {
    if (_sections.isEmpty || (index < 0)) {
      _selectedSectionIndex = -1;
      _selectedSection = TemplateSection.empty();
      return;
    }

    if (index >= _sections.length) {
      index = _sections.length - 1;
    }

    _selectedSection = _sections[index];
    _selectedSectionIndex = index;
    _sectionsIsExpanded[index] = true;
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
    _sectionsIsExpanded = ObservableList.of(
        List.generate(template.sections.length, (_) => false));
    _sectionExpansionTileControllers.clear();
    for (final section in _currentTemplate.sections) {
      _checks.add(ObservableList.of(section.checks));
    }
    _selectLastSection();
  }

  @action
  void moveCheckAnotherSection(TemplateCheck check, TemplateSection section) {
    if (section.checks.contains(check)) {
      return;
    }

    _selectedSection = section;
  }

  @action
  void updateRegularCheck(int sectionIndex, int index, String description) {
    final check = _checks[sectionIndex][index] as TemplateRegularCheck;
    final newCheck = check.copyWith(description: description);

    _currentTemplate.sections[sectionIndex].checks[index] = newCheck;
    _checks[sectionIndex][index] = newCheck;
  }

  @action
  void updateWithReferenceCheck(
      int sectionIndex, int index, String description, int referenceCount) {
    final check = _checks[sectionIndex][index] as TemplateWithReferenceCheck;
    final newCheck = check.copyWith(
        description: description, referenceCount: referenceCount);

    _currentTemplate.sections[sectionIndex].checks[index] = newCheck;
    _checks[sectionIndex][index] = newCheck;
  }

  @action
  void updateLinearityStep1Check(
      int sectionIndex, int index, int referenceCount) {
    final check = _checks[sectionIndex][index] as TemplateLinearityStep1Check;
    final newCheck = check.copyWith(referenceCount: referenceCount);

    _currentTemplate.sections[sectionIndex].checks[index] = newCheck;
    _checks[sectionIndex][index] = newCheck;
  }

  @action
  void moveTemplateSection(int oldIndex, int newIndex) {
    if (oldIndex == newIndex) {
      return;
    }
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final section = _currentTemplate.sections.removeAt(oldIndex);
    _currentTemplate.sections.insert(newIndex, section);

    final observableSection = _sections.removeAt(oldIndex);
    _sections.insert(newIndex, observableSection);

    final newSectionIsExpanded = _sectionsIsExpanded[newIndex];
    final oldSectionIsExpanded = _sectionsIsExpanded.removeAt(oldIndex);
    _sectionsIsExpanded.insert(newIndex, oldSectionIsExpanded);

    final observableChecks = _checks.removeAt(oldIndex);
    _checks.insert(newIndex, observableChecks);

    final oldSectionExpansionTileController =
        _sectionExpansionTileControllers.remove(oldIndex);
    final newSectionExpansionTileController =
        _sectionExpansionTileControllers.remove(newIndex);
    _sectionExpansionTileControllers[newIndex] =
        oldSectionExpansionTileController!;
    _sectionExpansionTileControllers[oldIndex] =
        newSectionExpansionTileController!;

    // If someone can please explain to me why the following code does work I
    // would be very grateful.
    //
    // AFAICT, the following code is doing exactly the opposite of what it
    // should be doing as I want the controller in the NEW position to reproduce
    // the isExpanded state of the OLD position but it works as it is. I don't
    // get it.
    if (oldSectionIsExpanded) {
      _sectionExpansionTileControllers[oldIndex]!.expand();
    } else {
      _sectionExpansionTileControllers[oldIndex]!.collapse();
    }
    if (newSectionIsExpanded) {
      _sectionExpansionTileControllers[newIndex]!.expand();
    } else {
      _sectionExpansionTileControllers[newIndex]!.collapse();
    }

    _setSelectedSectionByIndex(newIndex);
  }

  void setSectionExpansionTileController(
      int index, ExpansionTileController expansionTileController) {
    _sectionExpansionTileControllers[index] = expansionTileController;
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
      _sectionsIsExpanded.removeAt(index);
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

// @action
// void moveTemplateSection(String oldKey, String newKey) {
//   final oldPosition = oldKey.split('|');
//   final newPosition = newKey.split('|');
//   final oldSectionIndex = int.parse(oldPosition[0]);
//   final newSectionIndex = int.parse(newPosition[0]);
//   // One item means it's a section, two items means it's a check.
//   final draggingSection = (oldPosition.length == 1);

//   if (draggingSection) { 
//     _moveSection(oldSectionIndex, newSectionIndex);
//   } else {
//     // Moving a check
//     final oldCheckIndex = int.parse(oldPosition[1]);
//     // One item means it's a section, two items means it's a check.
//     final targetIsSection = (newPosition.length == 1);
//     if (targetIsSection) {
//       if (oldSectionIndex == newSectionIndex) {
//         return;
//       } else {
//         _moveCheckToEndOfAnotherSection(
//             oldSectionIndex, oldCheckIndex, newSectionIndex);
//       }
//     } else {
//       final newCheckIndex = int.parse(newPosition[1]);
//       if (oldSectionIndex == newSectionIndex) {
//         _moveCheckInSameSection(
//             oldSectionIndex, oldCheckIndex, newCheckIndex);
//       } else {
//         _moveCheckToChoosenPositionInAnotherSection(
//             oldSectionIndex, oldCheckIndex, newSectionIndex, newCheckIndex);
//       }
//     }
//   }
// }

// void _moveCheckToChoosenPositionInAnotherSection(int oldSectionIndex,
//     int oldCheckIndex, int newSectionIndex, int newCheckIndex) {
//   final check = _currentTemplate.sections[oldSectionIndex].checks
//       .removeAt(oldCheckIndex);
//   _currentTemplate.sections[newSectionIndex].checks
//       .insert(newCheckIndex, check);

//   final observableCheck = _checks.removeAt(oldCheckIndex);
//   _setSelectedSectionByIndex(newSectionIndex);
//   _checks.insert(newCheckIndex, observableCheck);
// }

// void _moveCheckInSameSection(
//     int sectionIndex, int oldCheckIndex, int newCheckIndex) {
//   if (oldCheckIndex < newCheckIndex) {
//     newCheckIndex -= 1;
//   }

//   final check =
//       _currentTemplate.sections[sectionIndex].checks.removeAt(oldCheckIndex);
//   _currentTemplate.sections[sectionIndex].checks.insert(newCheckIndex, check);

//   final observableCheck = _checks.removeAt(oldCheckIndex);
//   _checks.insert(newCheckIndex, observableCheck);
// }

// void _moveCheckToEndOfAnotherSection(
//     int oldSectionIndex, int oldCheckIndex, int newSectionIndex) {
//   final check = _currentTemplate.sections[oldSectionIndex].checks
//       .removeAt(oldCheckIndex);
//   _currentTemplate.sections[newSectionIndex].checks.add(check);

//   final observableCheck = _checks.removeAt(oldCheckIndex);
//   _setSelectedSectionByIndex(newSectionIndex);
//   _checks.add(observableCheck);
// }
