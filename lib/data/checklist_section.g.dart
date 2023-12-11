// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChecklistSectionImpl _$$ChecklistSectionImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecklistSectionImpl(
      title: json['title'] as String,
      checks: (json['checks'] as List<dynamic>)
          .map((e) => ChecklistCheck.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChecklistSectionImplToJson(
        _$ChecklistSectionImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'checks': instance.checks.map((e) => e.toJson()).toList(),
    };
