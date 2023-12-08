// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateRegularCheckImpl _$$TemplateRegularCheckImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateRegularCheckImpl(
      description: json['description'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TemplateRegularCheckImplToJson(
        _$TemplateRegularCheckImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'runtimeType': instance.$type,
    };

_$TemplateWithReferenceCheckImpl _$$TemplateWithReferenceCheckImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateWithReferenceCheckImpl(
      description: json['description'] as String,
      referenceCount: json['referenceCount'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TemplateWithReferenceCheckImplToJson(
        _$TemplateWithReferenceCheckImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'referenceCount': instance.referenceCount,
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
      step1: TemplateLinearityStep1Check.fromJson(
          json['step1'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TemplateLinearityStep2CheckImplToJson(
        _$TemplateLinearityStep2CheckImpl instance) =>
    <String, dynamic>{
      'step1': instance.step1,
      'runtimeType': instance.$type,
    };
