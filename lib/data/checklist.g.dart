// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChecklistImpl _$$ChecklistImplFromJson(Map<String, dynamic> json) =>
    _$ChecklistImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      diverName: json['diverName'] as String,
      date: DateTime.parse(json['date'] as String),
      sections: (json['sections'] as List<dynamic>)
          .map((e) => ChecklistSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChecklistImplToJson(_$ChecklistImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'diverName': instance.diverName,
      'date': instance.date.toIso8601String(),
      'sections': instance.sections,
    };
