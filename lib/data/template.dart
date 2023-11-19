import 'package:ccr_checklist/data/template_section.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template.freezed.dart';
part 'template.g.dart';

@unfreezed
class Template with _$Template {
  factory Template({
    required String title,
    required String description,
    required List<TemplateSection> sections,
  }) = _Template;

  Template._();

  factory Template.fromJson(Map<String, dynamic> json) =>
      _$TemplateFromJson(json);
}
