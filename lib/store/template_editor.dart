import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/data/template_section.dart';
import 'package:mobx/mobx.dart';

part 'template_editor.g.dart';

class TemplateEditorStore = TemplateEditorStoreBase with _$TemplateEditorStore;

abstract class TemplateEditorStoreBase with Store {
  @readonly.shallow
  Template _template = Template.empty();

  @computed
  List<TemplateSection> get sections => _template.sections;

  @readonly
  TemplateSection? _selectedSection;

  @computed
  List<TemplateCheck> get checks => _selectedSection?.checks ?? [];

  @readonly
  TemplateCheck? _selectedCheck;

  @action
  void addNewSection(
      {required String title, required List<TemplateCheck> checks}) {
    _template.sections
        .add(TemplateSection(title: title, checks: checks, parent: _template));
  }

  @action
  void deleteSection(TemplateSection section) {
    _template.sections.remove(section);
  }

  @action
  void setTemplate(Template template) {
    _template = template;
  }

  @action
  void editSection(TemplateSection section) {
    _selectedSection = section;
  }

  @action
  void editCheck(TemplateCheck check) {
    _selectedCheck = check;
  }

  @action
  void moveCheckAnotherSection(TemplateCheck check, TemplateSection section) {
    if (section.checks.contains(check)) {
      return;
    }

    _selectedCheck = check;
    _selectedSection = section;
  }
}
