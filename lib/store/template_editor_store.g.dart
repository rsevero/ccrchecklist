// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_editor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TemplateEditorStore on TemplateEditorStoreBase, Store {
  Computed<ObservableList<TemplateSection>>? _$sectionsComputed;

  @override
  ObservableList<TemplateSection> get sections => (_$sectionsComputed ??=
          Computed<ObservableList<TemplateSection>>(() => super.sections,
              name: 'TemplateEditorStoreBase.sections'))
      .value;
  Computed<ObservableList<TemplateCheck>>? _$checksComputed;

  @override
  ObservableList<TemplateCheck> get checks => (_$checksComputed ??=
          Computed<ObservableList<TemplateCheck>>(() => super.checks,
              name: 'TemplateEditorStoreBase.checks'))
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

  late final _$_currentSectionAtom =
      Atom(name: 'TemplateEditorStoreBase._currentSection', context: context);

  TemplateSection? get currentSection {
    _$_currentSectionAtom.reportRead();
    return super._currentSection;
  }

  @override
  TemplateSection? get _currentSection => currentSection;

  @override
  set _currentSection(TemplateSection? value) {
    _$_currentSectionAtom.reportWrite(value, super._currentSection, () {
      super._currentSection = value;
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
  void setTemplate(Template template) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.setTemplate');
    try {
      return super.setTemplate(template);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSectionTitle(int index, String title) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.updateSectionTitle');
    try {
      return super.updateSectionTitle(index, title);
    } finally {
      _$TemplateEditorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editCheck(TemplateCheck check) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.editCheck');
    try {
      return super.editCheck(check);
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
  String toString() {
    return '''
sections: ${sections},
checks: ${checks}
    ''';
  }
}
