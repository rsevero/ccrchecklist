import 'dart:convert';
import 'package:ccr_checklist/constants.dart';
import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/data/template_section.dart';
import 'package:ccr_checklist/data/template.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobx/mobx.dart';

part 'template_editor.g.dart';

class TemplateEditorStore = TemplateEditorStoreBase with _$TemplateEditorStore;

abstract class TemplateEditorStoreBase with Store {
  @readonly
  Template _currentTemplate = Template.empty();

  @readonly
  var _templates = ObservableList<Template>();

  @computed
  ObservableList<TemplateSection> get sections =>
      ObservableList<TemplateSection>.of(_currentTemplate.sections);

  @readonly
  TemplateSection? _currentSection;

  @computed
  ObservableList<TemplateCheck> get checks =>
      ObservableList<TemplateCheck>.of(_currentSection?.checks ?? []);

  @readonly
  TemplateCheck? _currentCheck;

  TemplateEditorStoreBase() {
    _getDefaultTemplates();

    _currentTemplate = _templates.isEmpty ? Template.empty() : _templates.first;
  }

  @action
  Future<void> _getDefaultTemplates() async {
    String manifestJson =
        await rootBundle.loadString(ccrDefaultTemplatesManifestPath);
    List<String> templateFileNames = ((json.decode(manifestJson)
            as Map<String, dynamic>)['templates'] as List<dynamic>)
        .cast<String>();

    // Load each template file listed in the manifest
    for (String fileName in templateFileNames) {
      final String jsonString =
          await rootBundle.loadString('assets/templates/$fileName');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      final newTemplate = Template.fromJson(jsonMap);

      _templates.add(newTemplate);
    }
  }

  @action
  void addNewSection(
      {required String title, required List<TemplateCheck> checks}) {
    _currentSection =
        TemplateSection(title: title, checks: checks, parent: _currentTemplate);
    _currentTemplate.sections.add(_currentSection!);
  }

  @action
  void addNewTemplate(
      {required String title,
      required String description,
      required String rebreatherModel}) {
    _currentTemplate = Template(
        rebreatherModel: rebreatherModel,
        title: title,
        description: description,
        sections: []);
    _templates.add(_currentTemplate);
    _templates.sort(_compareTemplates);
  }

  @action
  void editTemplateRebreatherModel(String rebreatherModel) {
    _currentTemplate.rebreatherModel = rebreatherModel;
    _templates.sort(_compareTemplates);
  }

  @action
  void editTemplateTitle(String title) {
    _currentTemplate.title = title;
    _templates.sort(_compareTemplates);
  }

  @action
  void editTemplateDescription(String description) {
    _currentTemplate.description = description;
  }

  int _compareTemplates(Template a, Template b) {
    final modelCompare = a.rebreatherModel.compareTo(b.rebreatherModel);

    if (modelCompare != 0) {
      return modelCompare;
    } else {
      return a.title.compareTo(b.title);
    }
  }

  @action
  void deleteSection(TemplateSection section) {
    _currentTemplate.sections.remove(section);
  }

  @action
  void setTemplate(Template template) {
    _currentTemplate = template;
  }

  @action
  void updateSectionTitle(int index, String title) {
    _currentTemplate.sections[index].title = title;
  }

  @action
  void editCheck(TemplateCheck check) {
    _currentCheck = check;
  }

  @action
  void moveCheckAnotherSection(TemplateCheck check, TemplateSection section) {
    if (section.checks.contains(check)) {
      return;
    }

    _currentCheck = check;
    _currentSection = section;
  }
}
