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

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ccrchecklist/data/template_file.dart';
import 'package:ccrchecklist/misc/constants.dart';
import 'package:ccrchecklist/data/template.dart';
import 'package:ccrchecklist/misc/ccr_directory_helper.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobx/mobx.dart';
import 'package:platform_info/platform_info.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

part 'template_list_store.g.dart';

enum TemplateListStoreState {
  outdated,
  uptodate,
  updating,
}

class TemplateListStore = TemplateListStoreBase with _$TemplateListStore;

abstract class TemplateListStoreBase with Store {
  @readonly
  ObservableList<TemplateFile> _defaultTemplates =
      ObservableList<TemplateFile>();

  final List<TemplateFile> _defaultTemplatesList = [];

  @readonly
  TemplateListStoreState _state = TemplateListStoreState.outdated;

  // ignore: unused_field
  late StreamSubscription _intentSub;

  @readonly
  bool _showedTemplateStats = false;

  @readonly
  int _assetTemplateCount = 0;

  @readonly
  int _savedTemplateCount = 0;

  @readonly
  int _manufacturerCount = 0;

  @readonly
  int _modelCount = 0;

  final Set<String> _manufacturers = {};

  final Set<String> _models = {};

  TemplateListStoreBase() {
    _init();
  }

  void _init() {
    if (platform.android || platform.iOS) {
      _initReceiveSharingIntent();
    }
  }

  void _initReceiveSharingIntent() {
    _intentSub = ReceiveSharingIntent.instance.getMediaStream().listen(
      (List<SharedMediaFile> value) {
        _getSharedTemplates(value);
      },
      onError: (err) {
        print("-------------->>  getIntentDataStream error: $err");
      },
    );

    // Get the media sharing coming from outside the app while the app is
    // closed.
    ReceiveSharingIntent.instance.getInitialMedia().then(
      (List<SharedMediaFile> value) {
        _getSharedTemplates(value);

        // Tell the library that we are done processing the intent.
        ReceiveSharingIntent.instance.reset();
      },
    );
  }

  @action
  void setShowedTemplateStats() {
    if (!_showedTemplateStats) {
      _showedTemplateStats = true;
    }
  }

  Future<Template> getTemplate(String templatePath,
      [bool isAsset = false]) async {
    String jsonString;
    if (isAsset) {
      jsonString = await rootBundle.loadString(templatePath);
    } else {
      final File templateFileHandle = File(templatePath);
      jsonString = await templateFileHandle.readAsString();
    }
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return Template.fromJson(jsonMap);
  }

  void update() {
    if (_state != TemplateListStoreState.outdated) {
      return;
    }
    _state = TemplateListStoreState.updating;
    _actuallyUpdate();
  }

  void _reset() {
    _defaultTemplatesList.clear();
    _manufacturers.clear();
    _models.clear();
    _assetTemplateCount = 0;
    _savedTemplateCount = 0;
    _manufacturerCount = 0;
    _modelCount = 0;
  }

  @action
  Future<void> _actuallyUpdate() async {
    _reset();
    await _getAssetTemplates();
    await _getSavedTemplates();
    _defaultTemplatesList.sort(_compareTemplateFile);
    _defaultTemplates = ObservableList.of(_defaultTemplatesList);
    _manufacturerCount = _manufacturers.length;
    _modelCount = _models.length;
    _state = TemplateListStoreState.uptodate;
  }

  @action
  void invalidate() {
    _state = TemplateListStoreState.outdated;
  }

  @action
  Future<void> removeTemplate(int index) async {
    final templateFile = _defaultTemplatesList[index];
    if (templateFile.isAsset) {
      throw Exception('Cannot remove asset template');
    }

    final templateFileHandle = File(templateFile.path);

    // Check if the file exists before attempting to delete
    if (await templateFileHandle.exists()) {
      await templateFileHandle.delete();
    }

    _defaultTemplatesList.removeAt(index);
    _defaultTemplates.removeAt(index);
  }

  Future<void> _getAssetTemplates() async {
    String manifestJson =
        await rootBundle.loadString(ccrDefaultTemplatesManifestDirectory);
    List<String> templateFileNames = ((json.decode(manifestJson)
            as Map<String, dynamic>)['templates'] as List<dynamic>)
        .cast<String>();

    // Load each template file listed in the manifest
    for (String filename in templateFileNames) {
      final templatePath = '$ccrDefaultTemplatesDirectory/$filename';
      final String jsonString = await rootBundle.loadString(templatePath);
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      final Template newTemplate = Template.fromJson(jsonMap);

      final newTemplateFile = TemplateFile(
        path: templatePath,
        rebreatherManufacturer: newTemplate.rebreatherManufacturer,
        rebreatherModel: newTemplate.rebreatherModel,
        title: newTemplate.title,
        description: newTemplate.description,
        isAsset: true,
      );

      _defaultTemplatesList.add(newTemplateFile);
      _manufacturers.add(newTemplate.rebreatherManufacturer);
      _models.add(newTemplate.rebreatherModel);
      _assetTemplateCount++;
    }
  }

  @action
  Future<void> _getSharedTemplates(List<SharedMediaFile> sharedList) async {
    for (SharedMediaFile share in sharedList) {
      final fileEntity = File(share.path);
      await _getSavedTemplate(fileEntity);
    }
  }

  Future<void> _getSavedTemplates() async {
    final templateDirectory = await CCRDirectory.templates();

    // List all files in the template directory
    List<FileSystemEntity> fileList = templateDirectory.listSync();

    for (FileSystemEntity fileEntity in fileList) {
      await _getSavedTemplate(fileEntity);
    }
  }

  Future<void> _getSavedTemplate(FileSystemEntity aFile) async {
    if ((aFile is! File) || !aFile.path.endsWith('.$ccrTemplateExtension')) {
      return;
    }

    final String jsonString = await aFile.readAsString();
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    final newTemplate = Template.fromJson(jsonMap);

    final newTemplateFile = TemplateFile(
      path: aFile.path,
      rebreatherManufacturer: newTemplate.rebreatherManufacturer,
      rebreatherModel: newTemplate.rebreatherModel,
      title: newTemplate.title,
      description: newTemplate.description,
      isAsset: false,
    );

    _defaultTemplatesList.add(newTemplateFile);
    _manufacturers.add(newTemplate.rebreatherManufacturer);
    _models.add(newTemplate.rebreatherModel);
    _savedTemplateCount++;
  }

  @action
  int addNewTemplate({
    required String path,
    required String title,
    required String rebreatherManufacturer,
    required String rebreatherModel,
    required String description,
  }) {
    final newTemplate = TemplateFile(
      rebreatherManufacturer: rebreatherManufacturer,
      rebreatherModel: rebreatherModel,
      title: title,
      description: description,
      path: path,
      isAsset: false,
    );

    _defaultTemplatesList.add(newTemplate);
    _defaultTemplatesList.sort(_compareTemplateFile);

    final templateIndex = _defaultTemplatesList.indexOf(newTemplate);

    _defaultTemplates = ObservableList.of(_defaultTemplatesList);

    return templateIndex;
  }

  @action
  void updateTemplate({
    required int templateIndex,
    required String rebreatherManufacturer,
    required String rebreatherModel,
    required String title,
    required String description,
  }) {
    if (templateIndex < 0 || templateIndex >= _defaultTemplatesList.length) {
      throw Exception('Invalid template index');
    }

    _defaultTemplatesList[templateIndex] =
        _defaultTemplatesList[templateIndex].copyWith(
      rebreatherManufacturer: rebreatherManufacturer,
      rebreatherModel: rebreatherModel,
      title: title,
      description: description,
    );
    _defaultTemplatesList.sort(_compareTemplateFile);

    _defaultTemplates = ObservableList.of(_defaultTemplatesList);
  }

  int _compareTemplateFile(TemplateFile a, TemplateFile b) {
    final manufacturerCompare =
        a.rebreatherManufacturer.compareTo(b.rebreatherManufacturer);
    if (manufacturerCompare != 0) {
      return manufacturerCompare;
    }

    final modelCompare = a.rebreatherModel.compareTo(b.rebreatherModel);
    if (modelCompare != 0) {
      return modelCompare;
    }

    final titleCompare = a.title.compareTo(b.title);
    if (titleCompare != 0) {
      return titleCompare;
    }

    final descriptionCompare = a.description.compareTo(b.description);
    if (descriptionCompare != 0) {
      return descriptionCompare;
    }

    return a.path.compareTo(b.path);
  }
}
