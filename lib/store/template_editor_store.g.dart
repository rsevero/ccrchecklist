// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_editor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TemplateEditorStore on TemplateEditorStoreBase, Store {
  Computed<bool>? _$enableCheckCreationComputed;

  @override
  bool get enableCheckCreation => (_$enableCheckCreationComputed ??=
          Computed<bool>(() => super.enableCheckCreation,
              name: 'TemplateEditorStoreBase.enableCheckCreation'))
      .value;
  Computed<bool>? _$enableLinearityStep2CreationComputed;

  @override
  bool get enableLinearityStep2Creation =>
      (_$enableLinearityStep2CreationComputed ??= Computed<bool>(
              () => super.enableLinearityStep2Creation,
              name: 'TemplateEditorStoreBase.enableLinearityStep2Creation'))
          .value;
  Computed<bool>? _$enableLinearityStep1CreationComputed;

  @override
  bool get enableLinearityStep1Creation =>
      (_$enableLinearityStep1CreationComputed ??= Computed<bool>(
              () => super.enableLinearityStep1Creation,
              name: 'TemplateEditorStoreBase.enableLinearityStep1Creation'))
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

  ObservableList<ObservableList<TemplateCheck>> get checks {
    _$_checksAtom.reportRead();
    return super._checks;
  }

  @override
  ObservableList<ObservableList<TemplateCheck>> get _checks => checks;

  @override
  set _checks(ObservableList<ObservableList<TemplateCheck>> value) {
    _$_checksAtom.reportWrite(value, super._checks, () {
      super._checks = value;
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

  late final _$_hasLinearityStep1Atom = Atom(
      name: 'TemplateEditorStoreBase._hasLinearityStep1', context: context);

  bool get hasLinearityStep1 {
    _$_hasLinearityStep1Atom.reportRead();
    return super._hasLinearityStep1;
  }

  @override
  bool get _hasLinearityStep1 => hasLinearityStep1;

  @override
  set _hasLinearityStep1(bool value) {
    _$_hasLinearityStep1Atom.reportWrite(value, super._hasLinearityStep1, () {
      super._hasLinearityStep1 = value;
    });
  }

  late final _$_hasLinearityStep2Atom = Atom(
      name: 'TemplateEditorStoreBase._hasLinearityStep2', context: context);

  bool get hasLinearityStep2 {
    _$_hasLinearityStep2Atom.reportRead();
    return super._hasLinearityStep2;
  }

  @override
  bool get _hasLinearityStep2 => hasLinearityStep2;

  @override
  set _hasLinearityStep2(bool value) {
    _$_hasLinearityStep2Atom.reportWrite(value, super._hasLinearityStep2, () {
      super._hasLinearityStep2 = value;
    });
  }

  late final _$TemplateEditorStoreBaseActionController =
      ActionController(name: 'TemplateEditorStoreBase', context: context);

  @override
  void addLinearityStep2Check() {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.addLinearityStep2Check');
    try {
      return super.addLinearityStep2Check();
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addLinearityStep1Check({required int referenceCount}) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.addLinearityStep1Check');
    try {
      return super.addLinearityStep1Check(referenceCount: referenceCount);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addWithReferenceCheck(
      {required String description, required int referenceCount}) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.addWithReferenceCheck');
    try {
      return super.addWithReferenceCheck(
          description: description, referenceCount: referenceCount);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addRegularCheck({required String description}) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.addRegularCheck');
    try {
      return super.addRegularCheck(description: description);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSection({required String title}) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.addSection');
    try {
      return super.addSection(title: title);
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
  void moveCheckToAnotherSection(
      int currentSectionIndex, int checkIndex, int newSectionIndex) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.moveCheckToAnotherSection');
    try {
      return super.moveCheckToAnotherSection(
          currentSectionIndex, checkIndex, newSectionIndex);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateRegularCheck(
      int sectionIndex, int checkIndex, String description) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.updateRegularCheck');
    try {
      return super.updateRegularCheck(sectionIndex, checkIndex, description);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateWithReferenceCheck(int sectionIndex, int checkIndex,
      String description, int referenceCount) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.updateWithReferenceCheck');
    try {
      return super.updateWithReferenceCheck(
          sectionIndex, checkIndex, description, referenceCount);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateLinearityStep1Check(
      int sectionIndex, int checkIndex, int referenceCount) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.updateLinearityStep1Check');
    try {
      return super
          .updateLinearityStep1Check(sectionIndex, checkIndex, referenceCount);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void moveSection(int oldSectionIndex, int newSectionIndex) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.moveSection');
    try {
      return super.moveSection(oldSectionIndex, newSectionIndex);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTemplate(
      String rebreatherModel, String title, String description) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.updateTemplate');
    try {
      return super.updateTemplate(rebreatherModel, title, description);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSectionTitle(int sectionIndex, String newTitle) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.updateSectionTitle');
    try {
      return super.updateSectionTitle(sectionIndex, newTitle);
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
  void deleteCheck(int sectionIndex, int index) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.deleteCheck');
    try {
      return super.deleteCheck(sectionIndex, index);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
enableCheckCreation: ${enableCheckCreation},
enableLinearityStep2Creation: ${enableLinearityStep2Creation},
enableLinearityStep1Creation: ${enableLinearityStep1Creation}
    ''';
  }
}
