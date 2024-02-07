// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateImpl _$$TemplateImplFromJson(Map<String, dynamic> json) =>
    _$TemplateImpl(
      rebreatherManufacturer: json['rebreatherManufacturer'] as String,
      rebreatherModel: json['rebreatherModel'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => TemplateSection.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String? ?? '',
      isAsset: json['isAsset'] as bool? ?? false,
    );

Map<String, dynamic> _$$TemplateImplToJson(_$TemplateImpl instance) =>
    <String, dynamic>{
      'rebreatherManufacturer': instance.rebreatherManufacturer,
      'rebreatherModel': instance.rebreatherModel,
      'title': instance.title,
      'description': instance.description,
      'sections': instance.sections.map((e) => e.toJson()).toList(),
      'path': instance.path,
      'isAsset': instance.isAsset,
    };
