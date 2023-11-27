// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TemplateListStore on TemplateListStoreBase, Store {
  Computed<ObservableList<Template>>? _$templatesComputed;

  @override
  ObservableList<Template> get templates => (_$templatesComputed ??=
          Computed<ObservableList<Template>>(() => super.templates,
              name: 'TemplateListStoreBase.templates'))
      .value;

  late final _$_templatesAtom =
      Atom(name: 'TemplateListStoreBase._templates', context: context);

  @override
  ObservableList<Template> get _templates {
    _$_templatesAtom.reportRead();
    return super._templates;
  }

  @override
  set _templates(ObservableList<Template> value) {
    _$_templatesAtom.reportWrite(value, super._templates, () {
      super._templates = value;
    });
  }

  late final _$_getDefaultTemplatesAsyncAction = AsyncAction(
      'TemplateListStoreBase._getDefaultTemplates',
      context: context);

  @override
  Future<void> _getDefaultTemplates() {
    return _$_getDefaultTemplatesAsyncAction
        .run(() => super._getDefaultTemplates());
  }

  late final _$TemplateListStoreBaseActionController =
      ActionController(name: 'TemplateListStoreBase', context: context);

  @override
  Template addNewTemplate(
      {required String title,
      required String description,
      required String rebreatherModel}) {
    final _$actionInfo = _$TemplateListStoreBaseActionController.startAction(
        name: 'TemplateListStoreBase.addNewTemplate');
    try {
      return super.addNewTemplate(
          title: title,
          description: description,
          rebreatherModel: rebreatherModel);
    } finally {
      _$TemplateListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
templates: ${templates}
    ''';
  }
}
