import 'dart:convert';
import 'package:ccr_checklist/constants.dart';
import 'package:ccr_checklist/data/template.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mobx/mobx.dart';

part 'template_list_store.g.dart';

class TemplateListStore = TemplateListStoreBase with _$TemplateListStore;

abstract class TemplateListStoreBase with Store {
  @observable
  var _templates = ObservableList<Template>();

  @computed
  ObservableList<Template> get templates {
    _templates.sort(_compareTemplates);
    return _templates;
  }

  TemplateListStoreBase() {
    _getDefaultTemplates();
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
    _templates.sort(_compareTemplates);
  }

  @action
  Template addNewTemplate(
      {required String title,
      required String description,
      required String rebreatherModel}) {
    final newTemplate = Template(
        rebreatherModel: rebreatherModel,
        title: title,
        description: description,
        sections: []);

    _templates.add(newTemplate);
    _templates.sort(_compareTemplates);

    return newTemplate;
  }

  int _compareTemplates(Template a, Template b) {
    final modelCompare = a.rebreatherModel.compareTo(b.rebreatherModel);

    if (modelCompare != 0) {
      return modelCompare;
    } else {
      return a.title.compareTo(b.title);
    }
  }
}
