import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/data/template_section.dart';
import 'package:ccr_checklist/data/template.dart';
import 'package:mobx/mobx.dart';

part 'template_editor_store.g.dart';

class TemplateEditorStore = TemplateEditorStoreBase with _$TemplateEditorStore;

abstract class TemplateEditorStoreBase with Store {
  @readonly
  Template _currentTemplate = Template.empty();

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

  @action
  void addNewSection(
      {required String title, required List<TemplateCheck> checks}) {
    _currentSection =
        TemplateSection(title: title, checks: checks, parent: _currentTemplate);
    _currentTemplate.sections.add(_currentSection!);
  }

  @action
  void editTemplateRebreatherModel(String rebreatherModel) {
    _currentTemplate.rebreatherModel = rebreatherModel;
  }

  @action
  void editTemplateTitle(String title) {
    _currentTemplate.title = title;
  }

  @action
  void editTemplateDescription(String description) {
    _currentTemplate.description = description;
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
