// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateRegularCheckImpl _$$TemplateRegularCheckImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateRegularCheckImpl(
      description: json['description'] as String,
      secondsTimer: json['secondsTimer'] as int,
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
      referenceCount: json['referenceCount'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TemplateLinearityStep1CheckImplToJson(
        _$TemplateLinearityStep1CheckImpl instance) =>
    <String, dynamic>{
      'referenceCount': instance.referenceCount,
      'runtimeType': instance.$type,
    };

_$TemplateLinearityStep2CheckImpl _$$TemplateLinearityStep2CheckImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateLinearityStep2CheckImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TemplateLinearityStep2CheckImplToJson(
        _$TemplateLinearityStep2CheckImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
