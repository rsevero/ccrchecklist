import 'package:ccr_checklist/data/template_section.dart';
import 'package:morphy_annotation/morphy_annotation.dart';

part 'template.morphy.dart';
part 'template.g.dart';

@Morphy(generateJson: true)
abstract class $Template {
  String get rebreatherModel;
  String get title;
  String get description;
  List<$TemplateSection> get sections;

  static Template empty() => Template(
        rebreatherModel: '',
        title: '',
        description: '',
        sections: [],
      );
}
