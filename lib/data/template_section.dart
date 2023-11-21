import 'package:ccr_checklist/data/template.dart';
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
    required Template parent,
  }) = _TemplateSection;

  TemplateSection._();

  factory TemplateSection.empty({required Template parent}) =>
      TemplateSection(title: '', checks: [], parent: parent);

  factory TemplateSection.fromJson(Map<String, dynamic> json) =>
      _$TemplateSectionFromJson(json);
}
