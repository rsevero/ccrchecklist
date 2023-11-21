// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateSectionImpl _$$TemplateSectionImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateSectionImpl(
      title: json['title'] as String,
      checks: (json['checks'] as List<dynamic>)
          .map((e) => TemplateCheck.fromJson(e as Map<String, dynamic>))
          .toList(),
      parent: Template.fromJson(json['parent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TemplateSectionImplToJson(
        _$TemplateSectionImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'checks': instance.checks,
      'parent': instance.parent,
    };
