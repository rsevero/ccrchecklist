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
    return super._template;
  }

  @override
  Template get _template => template;

  @override
  set _template(Template value) {
    _$_templateAtom.reportWrite(value, super._template, () {
      super._template = value;
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
    return super._selectedSection;
  }

  @override
  TemplateSection? get _selectedSection => selectedSection;

  @override
  set _selectedSection(TemplateSection? value) {
    _$_selectedSectionAtom.reportWrite(value, super._selectedSection, () {
      super._selectedSection = value;
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
  void editSection(TemplateSection section) {
    final _$actionInfo = _$TemplateEditorStoreBaseActionController.startAction(
        name: 'TemplateEditorStoreBase.editSection');
    try {
      return super.editSection(section);
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
