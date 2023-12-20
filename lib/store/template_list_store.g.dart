// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TemplateListStore on TemplateListStoreBase, Store {
  late final _$_defaultTemplatesAtom =
      Atom(name: 'TemplateListStoreBase._defaultTemplates', context: context);

  ObservableList<TemplateFile> get defaultTemplates {
    _$_defaultTemplatesAtom.reportRead();
    return super._defaultTemplates;
  }

  @override
  ObservableList<TemplateFile> get _defaultTemplates => defaultTemplates;

  @override
  set _defaultTemplates(ObservableList<TemplateFile> value) {
    _$_defaultTemplatesAtom.reportWrite(value, super._defaultTemplates, () {
      super._defaultTemplates = value;
    });
  }

  late final _$_isInitializedAtom =
      Atom(name: 'TemplateListStoreBase._isInitialized', context: context);

  bool get isInitialized {
    _$_isInitializedAtom.reportRead();
    return super._isInitialized;
  }

  @override
  bool get _isInitialized => isInitialized;

  @override
  set _isInitialized(bool value) {
    _$_isInitializedAtom.reportWrite(value, super._isInitialized, () {
      super._isInitialized = value;
    });
  }

  late final _$initializeAsyncAsyncAction =
      AsyncAction('TemplateListStoreBase.initializeAsync', context: context);

  @override
  Future<void> initializeAsync() {
    return _$initializeAsyncAsyncAction.run(() => super.initializeAsync());
  }

  late final _$removeTemplateAsyncAction =
      AsyncAction('TemplateListStoreBase.removeTemplate', context: context);

  @override
  Future<void> removeTemplate(int index) {
    return _$removeTemplateAsyncAction.run(() => super.removeTemplate(index));
  }

  late final _$TemplateListStoreBaseActionController =
      ActionController(name: 'TemplateListStoreBase', context: context);

  @override
  void markOutdated() {
    final _$actionInfo = _$TemplateListStoreBaseActionController.startAction(
        name: 'TemplateListStoreBase.markOutdated');
    try {
      return super.markOutdated();
    } finally {
      _$TemplateListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int addNewTemplate(
      {required String path,
      required String title,
      required String rebreatherManufacturer,
      required String rebreatherModel,
      required String description}) {
    final _$actionInfo = _$TemplateListStoreBaseActionController.startAction(
        name: 'TemplateListStoreBase.addNewTemplate');
    try {
      return super.addNewTemplate(
          path: path,
          title: title,
          rebreatherManufacturer: rebreatherManufacturer,
          rebreatherModel: rebreatherModel,
          description: description);
    } finally {
      _$TemplateListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTemplate(
      {required int templateIndex,
      required String rebreatherManufacturer,
      required String rebreatherModel,
      required String title,
      required String description}) {
    final _$actionInfo = _$TemplateListStoreBaseActionController.startAction(
        name: 'TemplateListStoreBase.updateTemplate');
    try {
      return super.updateTemplate(
          templateIndex: templateIndex,
          rebreatherManufacturer: rebreatherManufacturer,
          rebreatherModel: rebreatherModel,
          title: title,
          description: description);
    } finally {
      _$TemplateListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
