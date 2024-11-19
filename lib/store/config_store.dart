// CCR Checklist - a checklist app for rebreather users
// Copyright (C) 2024  Rodrigo Severo
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'dart:io';

import 'package:ccrchecklist/misc/ccr_directory_helper.dart';
import 'package:ccrchecklist/misc/constants.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
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
      final Directory configDirectory = await CCRDirectory.config();
      final String configPath = '${configDirectory.path}/$ccrConfigFile';
      if (!File(configPath).existsSync()) {
        print("No TOML file to read");
        _configData = {};
        _configLoadStatus = ConfigLoadStatusEnum.loaded;
        return;
      }
      final String tomlContent = await File(configPath).readAsString();
      final TomlDocument document = TomlDocument.parse(tomlContent);
      _configData = document.toMap();
      _configLoadStatus = ConfigLoadStatusEnum.loaded;
    } catch (e) {
      _configLoadStatus = ConfigLoadStatusEnum.error;
      print("Failed to read TOML file: $e");
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
