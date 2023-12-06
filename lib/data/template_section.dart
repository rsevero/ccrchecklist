import 'package:ccr_checklist/data/template_check.dart';
import 'package:morphy_annotation/morphy_annotation.dart';

part 'template_section.morphy.dart';
part 'template_section.g.dart';

@Morphy(generateJson: true)
abstract class $TemplateSection {
  String get title;
  List<$TemplateCheck> get checks;

  static TemplateSection empty() => TemplateSection(
        title: '',
        checks: [],
      );
}
