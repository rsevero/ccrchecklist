// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigStore _$ConfigStoreFromJson(Map<String, dynamic> json) => ConfigStore();

Map<String, dynamic> _$ConfigStoreToJson(ConfigStore instance) =>
    <String, dynamic>{};

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfigStore on _ConfigStoreBaseToJson, Store {
  late final _$_configDataAtom =
      Atom(name: '_ConfigStoreBaseToJson._configData', context: context);

  Map<String, dynamic> get configData {
    _$_configDataAtom.reportRead();
    return super._configData;
  }

  @override
  Map<String, dynamic> get _configData => configData;

  @override
  set _configData(Map<String, dynamic> value) {
    _$_configDataAtom.reportWrite(value, super._configData, () {
      super._configData = value;
    });
  }

  late final _$_configLoadStatusAtom =
      Atom(name: '_ConfigStoreBaseToJson._configLoadStatus', context: context);

  ConfigLoadStatusEnum get configLoadStatus {
    _$_configLoadStatusAtom.reportRead();
    return super._configLoadStatus;
  }

  @override
  ConfigLoadStatusEnum get _configLoadStatus => configLoadStatus;

  @override
  set _configLoadStatus(ConfigLoadStatusEnum value) {
    _$_configLoadStatusAtom.reportWrite(value, super._configLoadStatus, () {
      super._configLoadStatus = value;
    });
  }

  late final _$_isModifiedAtom =
      Atom(name: '_ConfigStoreBaseToJson._isModified', context: context);

  bool get isModified {
    _$_isModifiedAtom.reportRead();
    return super._isModified;
  }

  @override
  bool get _isModified => isModified;

  @override
  set _isModified(bool value) {
    _$_isModifiedAtom.reportWrite(value, super._isModified, () {
      super._isModified = value;
    });
  }

  late final _$loadConfigAsyncAction =
      AsyncAction('_ConfigStoreBaseToJson.loadConfig', context: context);

  @override
  Future<void> loadConfig() {
    return _$loadConfigAsyncAction.run(() => super.loadConfig());
  }

  late final _$_ConfigStoreBaseToJsonActionController =
      ActionController(name: '_ConfigStoreBaseToJson', context: context);

  @override
  void setDiverName(String name) {
    final _$actionInfo = _$_ConfigStoreBaseToJsonActionController.startAction(
        name: '_ConfigStoreBaseToJson.setDiverName');
    try {
      return super.setDiverName(name);
    } finally {
      _$_ConfigStoreBaseToJsonActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
