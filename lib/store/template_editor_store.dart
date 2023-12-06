import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/data/template_section.dart';
import 'package:ccr_checklist/data/template.dart';
import 'package:mobx/mobx.dart';
import 'package:morphy_annotation/morphy_annotation.dart';

part 'template_editor_store.g.dart';

class TemplateEditorStore = TemplateEditorStoreBase with _$TemplateEditorStore;

abstract class TemplateEditorStoreBase with Store {
  @readonly
  Template _currentTemplate = $Template.empty();

  @readonly
  ObservableList<TemplateSection> _sections = ObservableList<TemplateSection>();

  @computed
  int get sectionsCount => _sections.length;

  @readonly
  TemplateSection _currentSection = $TemplateSection.empty();

  @readonly
  ObservableList<TemplateCheck> _checks = ObservableList<TemplateCheck>();

  @readonly
  TemplateCheck? _currentCheck;

  @action
  void addNewSection(
      {required String title, required List<TemplateCheck> checks}) {
    _currentSection = TemplateSection(title: title, checks: checks);
    _currentTemplate.sections.add(_currentSection);
    _sections.add(_currentSection);
  }

  @action
  void editTemplateRebreatherModel(String rebreatherModel) {
    _currentTemplate = _currentTemplate.copyWith_Template(
        rebreatherModel: Opt(rebreatherModel));
  }

  @action
  void editTemplateTitle(String title) {
    _currentTemplate = _currentTemplate.copyWith_Template(title: Opt(title));
  }

  @action
  void editTemplateDescription(String description) {
    _currentTemplate =
        _currentTemplate.copyWith_Template(description: Opt(description));
  }

  @action
  void deleteSection(TemplateSection section) {
    _currentTemplate.sections.remove(section);
    _sections.remove(section);
  }

  @action
  void setCurrentTemplate(Template template) {
    _currentTemplate = template;
    _sections = ObservableList.of(template.sections);
  }

  @action
  void updateSectionTitle(int index, String title) {
    final updatedTemplateSection = _currentTemplate.sections[index]
        .copyWith_TemplateSection(title: Opt(title));
    _currentTemplate.sections[index] = updatedTemplateSection;
    _sections[index] = updatedTemplateSection;
  }

  @action
  void setCurrentCheck(TemplateCheck check) {
    _currentCheck = check;
  }

  @action
  void setCurrentSection(TemplateSection section) {
    _currentSection = section;
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
