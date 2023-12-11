import 'package:ccr_checklist/data/template_check.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_section.freezed.dart';
part 'template_section.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TemplateSection with _$TemplateSection {
  @JsonSerializable(explicitToJson: true)
  factory TemplateSection(
      {required String title,
      required List<TemplateCheck> checks}) = _TemplateSection;

  factory TemplateSection.empty() {
    return TemplateSection(
      title: '',
      checks: [],
    );
  }

  factory TemplateSection.fromJson(Map<String, Object?> json) =>
      _$TemplateSectionFromJson(json);
}
