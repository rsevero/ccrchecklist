// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateSection _$TemplateSectionFromJson(Map<String, dynamic> json) =>
    TemplateSection(
      title: json['title'] as String,
      checks: (json['checks'] as List<dynamic>)
          .map((e) => TemplateCheck.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TemplateSectionToJson(TemplateSection instance) =>
    <String, dynamic>{
      'title': instance.title,
      'checks': instance.checks.map((e) => e.toJson()).toList(),
    };
