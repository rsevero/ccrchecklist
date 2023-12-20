import 'dart:convert';
import 'dart:io';
import 'package:ccr_checklist/data/template_file.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/misc/helper_functions.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobx/mobx.dart';

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

  @readonly
  TemplateListStoreState _state = TemplateListStoreState.outdated;

  Future<Template> getTemplate(TemplateFile templateFile) async {
    if (templateFile.isAsset) {
      final String jsonString = await rootBundle.loadString(templateFile.path);
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      return Template.fromJson(jsonMap);
    } else {
      final File templateFileHandle = File(templateFile.path);
      final String jsonString = await templateFileHandle.readAsString();
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      return Template.fromJson(jsonMap);
    }
  }

  void update() {
    if (_state != TemplateListStoreState.outdated) {
      return;
    }
    _state = TemplateListStoreState.updating;
    _actuallyUpdate();
  }

  @action
  Future<void> _actuallyUpdate() async {
    await _getAssetTemplates();
    await _getSavedTemplates();
    _defaultTemplates.sort(_compareTemplateFile);
    _state = TemplateListStoreState.uptodate;
  }

  @action
  void invalidate() {
    _state = TemplateListStoreState.outdated;
  }

  @action
  Future<void> removeTemplate(int index) async {
    final templateFile = _defaultTemplates[index];
    if (templateFile.isAsset) {
      throw Exception('Cannot remove asset template');
    }

    final templateFileHandle = File(templateFile.path);
    await templateFileHandle.delete();

    _defaultTemplates.removeAt(index);
  }

  Future<void> _getAssetTemplates() async {
    String manifestJson =
        await rootBundle.loadString(ccrDefaultTemplatesManifestPath);
    List<String> templateFileNames = ((json.decode(manifestJson)
            as Map<String, dynamic>)['templates'] as List<dynamic>)
        .cast<String>();

    // Load each template file listed in the manifest
    for (String filename in templateFileNames) {
      final templatePath = '$ccrDefaultTemplatesPath/$filename';
      final String jsonString = await rootBundle.loadString(templatePath);
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      final newTemplate = Template.fromJson(jsonMap);

      final newTemplateFile = TemplateFile(
        path: templatePath,
        rebreatherManufacturer: newTemplate.rebreatherManufacturer,
        rebreatherModel: newTemplate.rebreatherModel,
        title: newTemplate.title,
        description: newTemplate.description,
        isAsset: true,
      );

      _defaultTemplates.add(newTemplateFile);
    }
  }

  Future<void> _getSavedTemplates() async {
    final templateDirectory = await ccrGetTemplatesDirectory();

    // List all files in the template directory
    List<FileSystemEntity> fileList = templateDirectory.listSync();

    for (FileSystemEntity fileEntity in fileList) {
      if ((fileEntity is! File) ||
          !fileEntity.path.endsWith('.$ccrTemplateExtension')) {
        continue;
      }

      final String jsonString = await fileEntity.readAsString();
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      final newTemplate = Template.fromJson(jsonMap);

      final newTemplateFile = TemplateFile(
        path: fileEntity.path,
        rebreatherManufacturer: newTemplate.rebreatherManufacturer,
        rebreatherModel: newTemplate.rebreatherModel,
        title: newTemplate.title,
        description: newTemplate.description,
        isAsset: false,
      );

      _defaultTemplates.add(newTemplateFile);
    }
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

    _defaultTemplates.add(newTemplate);
    _defaultTemplates.sort(_compareTemplateFile);

    final templateIndex = _defaultTemplates.indexOf(newTemplate);

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
    if (templateIndex < 0 || templateIndex >= _defaultTemplates.length) {
      throw Exception('Invalid template index');
    }

    _defaultTemplates[templateIndex] =
        _defaultTemplates[templateIndex].copyWith(
      rebreatherManufacturer: rebreatherManufacturer,
      rebreatherModel: rebreatherModel,
      title: title,
      description: description,
    );
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
