// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_editor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TemplateEditorStore on TemplateEditorStoreBase, Store {
  Computed<int>? _$sectionsCountComputed;

  @override
  int get sectionsCount =>
      (_$sectionsCountComputed ??= Computed<int>(() => super.sectionsCount,
              name: 'TemplateEditorStoreBase.sectionsCount'))
          .value;

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

  late final _$_currentSectionAtom =
      Atom(name: 'TemplateEditorStoreBase._currentSection', context: context);

  TemplateSection get currentSection {
    _$_currentSectionAtom.reportRead();
    return super._currentSection;
  }

  @override
  TemplateSection get _currentSection => currentSection;

  @override
  set _currentSection(TemplateSection value) {
    _$_currentSectionAtom.reportWrite(value, super._currentSection, () {
      super._currentSection = value;
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

  late final _$_currentCheckAtom =
      Atom(name: 'TemplateEditorStoreBase._currentCheck', context: context);

  TemplateCheck? get currentCheck {
    _$_currentCheckAtom.reportRead();
    return super._currentCheck;
  }

  @override
  TemplateCheck? get _currentCheck => currentCheck;

  @override
  set _currentCheck(TemplateCheck? value) {
    _$_currentCheckAtom.reportWrite(value, super._currentCheck, () {
      super._currentCheck = value;
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
  void deleteSection(TemplateSection section) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.deleteSection');
    try {
      return super.deleteSection(section);
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
  void setCurrentCheck(TemplateCheck check) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.setCurrentCheck');
    try {
      return super.setCurrentCheck(check);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentSection(TemplateSection section) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.setCurrentSection');
    try {
      return super.setCurrentSection(section);
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
  void deleteTemplateSection(int index) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.deleteTemplateSection');
    try {
      return super.deleteTemplateSection(index);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapTemplateSection(int index) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.onTapTemplateSection');
    try {
      return super.onTapTemplateSection(index);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sectionsCount: ${sectionsCount}
    ''';
  }
}
