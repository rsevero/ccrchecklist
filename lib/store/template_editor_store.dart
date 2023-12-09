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
  ObservableList<TemplateCheck> _checks = ObservableList<TemplateCheck>();

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
  void addRegularCheck({required String description}) {
    final newRegularCheck = TemplateRegularCheck(description: description);
    _selectedSection.checks.add(newRegularCheck);
    _checks.add(newRegularCheck);
    _updateHasLinearitySteps();
  }

  @action
  void setSectionIsExpansion(int index, bool value) {
    if (index >= 0 && index < _sectionsIsExpanded.length) {
      _sectionsIsExpanded[index] = value;
    }
  }

  @action
  void addSection({required String title}) {
    _selectedSection = TemplateSection(title: title, checks: []);
    _currentTemplate.sections.add(_selectedSection);
    _sections.add(_selectedSection);
    _sectionsIsExpanded.add(true);
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

    if (index >= _sections.length) {
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
    _sectionsIsExpanded = ObservableList.of(
        List.generate(template.sections.length, (_) => false));
    _sectionExpansionTileControllers.clear();
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

    final oldSectionExpansionTileController =
        _sectionExpansionTileControllers.remove(oldIndex);
    final newSectionExpansionTileController =
        _sectionExpansionTileControllers.remove(newIndex);
    _sectionExpansionTileControllers[newIndex] =
        oldSectionExpansionTileController!;
    _sectionExpansionTileControllers[oldIndex] =
        newSectionExpansionTileController!;

    // If someone can please explain to me why the following code does work I
    // would be very grateful. AFAICT, the following code is doing exactly the
    // opposite of what it should be doing as I want the controller in the NEW
    // position to reproduce the isExpanded state of the OLD position as it's
    // the same controller at the NEW position but it works as it is. I don't
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
      _sectionsIsExpanded.removeAt(index);
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
