import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/data/template_section.dart';
import 'package:mobx/mobx.dart';

part 'template_editor.g.dart';

class TemplateEditorStore = TemplateEditorStoreBase with _$TemplateEditorStore;

abstract class TemplateEditorStoreBase with Store {
  @readonly
  Template _currentTemplate = Template.empty();

  @readonly
  List<Template> _templates = [];

  @computed
  List<TemplateSection> get sections => _currentTemplate.sections;

  @readonly
  TemplateSection? _currentSection;

  @computed
  List<TemplateCheck> get checks => _currentSection?.checks ?? [];

  @readonly
  TemplateCheck? _currentCheck;

  TemplateEditorStoreBase() {
    _templates = [];

    _currentTemplate = _templates.isEmpty ? Template.empty() : _templates.first;
  }

  @action
  void addNewSection(
      {required String title, required List<TemplateCheck> checks}) {
    _currentSection =
        TemplateSection(title: title, checks: checks, parent: _currentTemplate);
    _currentTemplate.sections.add(_currentSection!);
  }

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
