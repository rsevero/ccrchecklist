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

  late final _$_stateAtom =
      Atom(name: 'TemplateListStoreBase._state', context: context);

  TemplateListStoreState get state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  TemplateListStoreState get _state => state;

  @override
  set _state(TemplateListStoreState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$_actuallyUpdateAsyncAction =
      AsyncAction('TemplateListStoreBase._actuallyUpdate', context: context);

  @override
  Future<void> _actuallyUpdate() {
    return _$_actuallyUpdateAsyncAction.run(() => super._actuallyUpdate());
  }

  late final _$removeTemplateAsyncAction =
      AsyncAction('TemplateListStoreBase.removeTemplate', context: context);

  @override
  Future<void> removeTemplate(int index) {
    return _$removeTemplateAsyncAction.run(() => super.removeTemplate(index));
  }

  late final _$_getSharedTemplatesAsyncAction = AsyncAction(
      'TemplateListStoreBase._getSharedTemplates',
      context: context);

  @override
  Future<void> _getSharedTemplates(List<SharedMediaFile> sharedList) {
    return _$_getSharedTemplatesAsyncAction
        .run(() => super._getSharedTemplates(sharedList));
  }

  late final _$TemplateListStoreBaseActionController =
      ActionController(name: 'TemplateListStoreBase', context: context);

  @override
  void invalidate() {
    final _$actionInfo = _$TemplateListStoreBaseActionController.startAction(
        name: 'TemplateListStoreBase.invalidate');
    try {
      return super.invalidate();
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
