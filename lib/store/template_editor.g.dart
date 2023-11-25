// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_editor.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TemplateEditorStore on TemplateEditorStoreBase, Store {
  Computed<List<TemplateSection>>? _$sectionsComputed;

  @override
  List<TemplateSection> get sections => (_$sectionsComputed ??=
          Computed<List<TemplateSection>>(() => super.sections,
              name: 'TemplateEditorStoreBase.sections'))
      .value;
  Computed<List<TemplateCheck>>? _$checksComputed;

  @override
  List<TemplateCheck> get checks =>
      (_$checksComputed ??= Computed<List<TemplateCheck>>(() => super.checks,
              name: 'TemplateEditorStoreBase.checks'))
          .value;

  late final _$_templateAtom =
      Atom(name: 'TemplateEditorStoreBase._template', context: context);

  Template get template {
    _$_templateAtom.reportRead();
    return super._currentTemplate;
  }

  @override
  Template get _currentTemplate => template;

  @override
  set _currentTemplate(Template value) {
    _$_templateAtom.reportWrite(value, super._currentTemplate, () {
      super._currentTemplate = value;
    });
  }

  late final _$_templatesAtom =
      Atom(name: 'TemplateEditorStoreBase._templates', context: context);

  List<Template> get templates {
    _$_templatesAtom.reportRead();
    return super._templates;
  }

  @override
  List<Template> get _templates => templates;

  @override
  set _templates(List<Template> value) {
    _$_templatesAtom.reportWrite(value, super._templates, () {
      super._templates = value;
    });
  }

  late final _$_selectedSectionAtom =
      Atom(name: 'TemplateEditorStoreBase._selectedSection', context: context);

  TemplateSection? get selectedSection {
    _$_selectedSectionAtom.reportRead();
    return super._currentSection;
  }

  @override
  TemplateSection? get _currentSection => selectedSection;

  @override
  set _currentSection(TemplateSection? value) {
    _$_selectedSectionAtom.reportWrite(value, super._currentSection, () {
      super._currentSection = value;
    });
  }

  late final _$_selectedCheckAtom =
      Atom(name: 'TemplateEditorStoreBase._selectedCheck', context: context);

  TemplateCheck? get selectedCheck {
    _$_selectedCheckAtom.reportRead();
    return super._currentCheck;
  }

  @override
  TemplateCheck? get _currentCheck => selectedCheck;

  @override
  set _currentCheck(TemplateCheck? value) {
    _$_selectedCheckAtom.reportWrite(value, super._currentCheck, () {
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
