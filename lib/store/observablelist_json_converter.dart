import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/data/template_section.dart';
import 'package:mobx/mobx.dart';

class ObservableListJsonConverter {
  const ObservableListJsonConverter();

  static ObservableList<TemplateSection> oblstOfTemplateSectionFromJson(
      List<TemplateSection> json) {
    return ObservableList<TemplateSection>.of(json);
  }

  static List<TemplateSection> oblstOfTemplateSectionToJson(
      ObservableList<TemplateSection> object) {
    return object.toList();
  }

  static ObservableList<ObservableList<TemplateCheck>>
      oblstOfObLstOfTemplateCheckFromJson(List<List<TemplateCheck>> json) {
    final oblst = ObservableList<ObservableList<TemplateCheck>>();
    for (final lst in json) {
      oblst.add(ObservableList<TemplateCheck>.of(lst));
    }
    return oblst;
  }

  static List<List<TemplateCheck>> oblstOfObLstOfTemplateCheckToJson(
      ObservableList<ObservableList<TemplateCheck>> object) {
    final List<List<TemplateCheck>> lst = [];
    for (final oblst in object) {
      lst.add(oblst.toList());
    }
    return lst;
  }
}
