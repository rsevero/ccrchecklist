// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_editor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TemplateEditorStore on TemplateEditorStoreBase, Store {
  late final _$_currentTemplateAtom =
      Atom(name: 'TemplateEditorStoreBase._currentTemplate', context: context);

  Template get currentTemplate {
    _$_currentTemplateAtom.reportRead();
    return super._currentTemplate;
  }

  @override
  Template get _currentTemplate => currentTemplate;

  @override
  set _currentTemplate(Template value) {
    _$_currentTemplateAtom.reportWrite(value, super._currentTemplate, () {
      super._currentTemplate = value;
    });
  }

  late final _$_sectionsAtom =
      Atom(name: 'TemplateEditorStoreBase._sections', context: context);

  ObservableList<TemplateSection> get sections {
    _$_sectionsAtom.reportRead();
    return super._sections;
  }

  @override
  ObservableList<TemplateSection> get _sections => sections;

  @override
  set _sections(ObservableList<TemplateSection> value) {
    _$_sectionsAtom.reportWrite(value, super._sections, () {
      super._sections = value;
    });
  }

  late final _$_selectedSectionAtom =
      Atom(name: 'TemplateEditorStoreBase._selectedSection', context: context);

  TemplateSection get selectedSection {
    _$_selectedSectionAtom.reportRead();
    return super._selectedSection;
  }

  @override
  TemplateSection get _selectedSection => selectedSection;

  @override
  set _selectedSection(TemplateSection value) {
    _$_selectedSectionAtom.reportWrite(value, super._selectedSection, () {
      super._selectedSection = value;
    });
  }

  late final _$_checksAtom =
      Atom(name: 'TemplateEditorStoreBase._checks', context: context);

  ObservableList<TemplateCheck> get checks {
    _$_checksAtom.reportRead();
    return super._checks;
  }

  @override
  ObservableList<TemplateCheck> get _checks => checks;

  @override
  set _checks(ObservableList<TemplateCheck> value) {
    _$_checksAtom.reportWrite(value, super._checks, () {
      super._checks = value;
    });
  }

  late final _$_selectedCheckAtom =
      Atom(name: 'TemplateEditorStoreBase._selectedCheck', context: context);

  TemplateCheck? get selectedCheck {
    _$_selectedCheckAtom.reportRead();
    return super._selectedCheck;
  }

  @override
  TemplateCheck? get _selectedCheck => selectedCheck;

  @override
  set _selectedCheck(TemplateCheck? value) {
    _$_selectedCheckAtom.reportWrite(value, super._selectedCheck, () {
      super._selectedCheck = value;
    });
  }

  late final _$_selectedSectionIndexAtom = Atom(
      name: 'TemplateEditorStoreBase._selectedSectionIndex', context: context);

  int get selectedSectionIndex {
    _$_selectedSectionIndexAtom.reportRead();
    return super._selectedSectionIndex;
  }

  @override
  int get _selectedSectionIndex => selectedSectionIndex;

  @override
  set _selectedSectionIndex(int value) {
    _$_selectedSectionIndexAtom.reportWrite(value, super._selectedSectionIndex,
        () {
      super._selectedSectionIndex = value;
    });
  }

  late final _$_selectedCheckIndexAtom = Atom(
      name: 'TemplateEditorStoreBase._selectedCheckIndex', context: context);

  int get selectedCheckIndex {
    _$_selectedCheckIndexAtom.reportRead();
    return super._selectedCheckIndex;
  }

  @override
  int get _selectedCheckIndex => selectedCheckIndex;

  @override
  set _selectedCheckIndex(int value) {
    _$_selectedCheckIndexAtom.reportWrite(value, super._selectedCheckIndex, () {
      super._selectedCheckIndex = value;
    });
  }

  late final _$_sectionOrCheckSelectedAtom = Atom(
      name: 'TemplateEditorStoreBase._sectionOrCheckSelected',
      context: context);

  TemplateEditorSectionOrCheckSelected get sectionOrCheckSelected {
    _$_sectionOrCheckSelectedAtom.reportRead();
    return super._sectionOrCheckSelected;
  }

  @override
  TemplateEditorSectionOrCheckSelected get _sectionOrCheckSelected =>
      sectionOrCheckSelected;

  @override
  set _sectionOrCheckSelected(TemplateEditorSectionOrCheckSelected value) {
    _$_sectionOrCheckSelectedAtom
        .reportWrite(value, super._sectionOrCheckSelected, () {
      super._sectionOrCheckSelected = value;
    });
  }

  late final _$TemplateEditorStoreBaseActionController =
      ActionController(name: 'TemplateEditorStoreBase', context: context);

  @override
  void addNewSection(
      {required String title, required List<TemplateCheck> checks}) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.addNewSection');
    try {
      return super.addNewSection(title: title, checks: checks);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editTemplateRebreatherModel(String rebreatherModel) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.editTemplateRebreatherModel');
    try {
      return super.editTemplateRebreatherModel(rebreatherModel);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editTemplateTitle(String title) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.editTemplateTitle');
    try {
      return super.editTemplateTitle(title);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editTemplateDescription(String description) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.editTemplateDescription');
    try {
      return super.editTemplateDescription(description);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentTemplate(Template template) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.setCurrentTemplate');
    try {
      return super.setCurrentTemplate(template);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void moveCheckAnotherSection(TemplateCheck check, TemplateSection section) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.moveCheckAnotherSection');
    try {
      return super.moveCheckAnotherSection(check, section);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void moveTemplateSection(int oldIndex, int newIndex) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.moveTemplateSection');
    try {
      return super.moveTemplateSection(oldIndex, newIndex);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSectionTitle(int index, String newTitle) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.updateSectionTitle');
    try {
      return super.updateSectionTitle(index, newTitle);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteSection(int index) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.deleteSection');
    try {
      return super.deleteSection(index);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteCheck(int index) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.deleteCheck');
    try {
      return super.deleteCheck(index);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapSection(int index) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.onTapSection');
    try {
      return super.onTapSection(index);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapCheck(int index) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.onTapCheck');
    try {
      return super.onTapCheck(index);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
