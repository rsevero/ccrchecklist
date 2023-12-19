// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateFileImpl _$$TemplateFileImplFromJson(Map<String, dynamic> json) =>
    _$TemplateFileImpl(
      path: json['path'] as String,
      rebreatherManufacturer: json['rebreatherManufacturer'] as String,
      rebreatherModel: json['rebreatherModel'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      isAsset: json['isAsset'] as bool,
    );

Map<String, dynamic> _$$TemplateFileImplToJson(_$TemplateFileImpl instance) =>
    <String, dynamic>{
      'path': instance.path,
      'rebreatherManufacturer': instance.rebreatherManufacturer,
      'rebreatherModel': instance.rebreatherModel,
      'title': instance.title,
      'description': instance.description,
      'isAsset': instance.isAsset,
    };
