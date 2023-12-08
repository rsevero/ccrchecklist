import 'package:ccr_checklist/data/template_section.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template.freezed.dart';
part 'template.g.dart';

@freezed
class Template with _$Template {
  const factory Template(
      {required String rebreatherModel,
      required String title,
      required String description,
      required List<TemplateSection> sections}) = _Template;

  factory Template.empty() {
    return const Template(
      rebreatherModel: '',
      title: '',
      description: '',
      sections: [],
    );
  }

  factory Template.fromJson(Map<String, Object?> json) =>
      _$TemplateFromJson(json);
}
