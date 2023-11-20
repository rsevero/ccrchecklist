import 'package:ccr_checklist/data/template_check.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_section.freezed.dart';
part 'template_section.g.dart';

@unfreezed
sealed class TemplateSection with _$TemplateSection {
  factory TemplateSection({
    required String title,
    required List<TemplateCheck> checks,
  }) = _TemplateSection;

  TemplateSection._();

  factory TemplateSection.empty() => TemplateSection(title: '', checks: []);

  factory TemplateSection.fromJson(Map<String, dynamic> json) =>
      _$TemplateSectionFromJson(json);
}
