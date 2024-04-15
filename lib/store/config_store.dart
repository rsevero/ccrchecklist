import 'dart:io';

import 'package:ccr_checklist/misc/ccr_directory_helper.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:toml/toml.dart';

part 'config_store.g.dart';

@JsonSerializable(explicitToJson: true)
class ConfigStore extends _ConfigStoreBaseToJson with _$ConfigStore {
  ConfigStore();

  factory ConfigStore.fromJson(Map<String, dynamic> json) =>
      _$ConfigStoreFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigStoreToJson(this);
}

abstract class _ConfigStoreBaseToJson with Store implements TomlEncodableValue {
  @readonly
  Map<String, dynamic> _configData = {};

  @readonly
  ConfigLoadStatusEnum _configLoadStatus = ConfigLoadStatusEnum.notLoaded;

  @readonly
  bool _isModified = false;

  _ConfigStoreBaseToJson() {
    loadConfig();
  }

  // Implementing the toTomlValue method from TomlEncodableValue
  @override
  toTomlValue() {
    return _configData;
  }

  @action
  Future<void> loadConfig() async {
    _configLoadStatus = ConfigLoadStatusEnum.loading;
    try {
      final directory = await CCRDirectory.config();
      final path = '${directory.path}/$ccrConfigFile';
      if (!File(path).existsSync()) {
        _configData = {};
        _configLoadStatus = ConfigLoadStatusEnum.loaded;
        return;
      }
      String tomlContent = await rootBundle.loadString(path);
      final document = TomlDocument.parse(tomlContent);
      _configData = document.toMap();
      _configLoadStatus = ConfigLoadStatusEnum.loaded;
    } catch (e) {
      _configLoadStatus = ConfigLoadStatusEnum.error;
      // print("Failed to read TOML file: $e");
    }
  }

  @action
  void setDiverName(String name) {
    if (_configData.containsKey('DiverName') &&
        _configData['DiverName'] == name) return;
    _configData['DiverName'] = name;
    _isModified = true;
  }

  @computed
  String get diverName => _configData['DiverName'] ?? '';

  void saveConfig() async {
    var tomlString = TomlDocument.fromMap(_configData).toString();

    try {
      final directory = await CCRDirectory.config();
      final file = File('${directory.path}/$ccrConfigFile');

      await file.writeAsString(tomlString);
      _isModified = false;
      // print("Config saved successfully.");
    } catch (e) {
      // print("Failed to save config: $e");
    }
  }
}

enum ConfigLoadStatusEnum { notLoaded, loading, loaded, error }
