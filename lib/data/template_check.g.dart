// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateRegularCheckImpl _$$TemplateRegularCheckImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateRegularCheckImpl(
      description: json['description'] as String,
      secondsTimer: (json['secondsTimer'] as num).toInt(),
      observation: json['observation'] as String,
      references: (json['references'] as List<dynamic>)
          .map((e) => RegularCheckReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TemplateRegularCheckImplToJson(
        _$TemplateRegularCheckImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'secondsTimer': instance.secondsTimer,
      'observation': instance.observation,
      'references': instance.references,
      'runtimeType': instance.$type,
    };

_$TemplateLinearityStep1CheckImpl _$$TemplateLinearityStep1CheckImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateLinearityStep1CheckImpl(
      measurement: json['measurement'] as String,
      description: json['description'] as String,
      referenceCount: (json['referenceCount'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TemplateLinearityStep1CheckImplToJson(
        _$TemplateLinearityStep1CheckImpl instance) =>
    <String, dynamic>{
      'measurement': instance.measurement,
      'description': instance.description,
      'referenceCount': instance.referenceCount,
      'runtimeType': instance.$type,
    };

_$TemplateLinearityStep2CheckImpl _$$TemplateLinearityStep2CheckImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateLinearityStep2CheckImpl(
      description: json['description'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TemplateLinearityStep2CheckImplToJson(
        _$TemplateLinearityStep2CheckImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'runtimeType': instance.$type,
    };

_$TemplateCompleteLinearityCheckImpl
    _$$TemplateCompleteLinearityCheckImplFromJson(Map<String, dynamic> json) =>
        _$TemplateCompleteLinearityCheckImpl(
          measurement: json['measurement'] as String,
          description: json['description'] as String,
          referenceCount: (json['referenceCount'] as num).toInt(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$TemplateCompleteLinearityCheckImplToJson(
        _$TemplateCompleteLinearityCheckImpl instance) =>
    <String, dynamic>{
      'measurement': instance.measurement,
      'description': instance.description,
      'referenceCount': instance.referenceCount,
      'runtimeType': instance.$type,
    };
