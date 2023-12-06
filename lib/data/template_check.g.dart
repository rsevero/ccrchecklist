// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateCheck _$TemplateCheckFromJson(Map<String, dynamic> json) =>
    TemplateCheck(
      type: json['type'] as String,
    );

Map<String, dynamic> _$TemplateCheckToJson(TemplateCheck instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

TemplateRegularCheck _$TemplateRegularCheckFromJson(
        Map<String, dynamic> json) =>
    TemplateRegularCheck(
      description: json['description'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$TemplateRegularCheckToJson(
        TemplateRegularCheck instance) =>
    <String, dynamic>{
      'description': instance.description,
      'type': instance.type,
    };

TemplateWithReferenceCheck _$TemplateWithReferenceCheckFromJson(
        Map<String, dynamic> json) =>
    TemplateWithReferenceCheck(
      description: json['description'] as String,
      referenceDescription: json['referenceDescription'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$TemplateWithReferenceCheckToJson(
        TemplateWithReferenceCheck instance) =>
    <String, dynamic>{
      'description': instance.description,
      'referenceDescription': instance.referenceDescription,
      'type': instance.type,
    };

TemplateLinearityCheckStep1Check _$TemplateLinearityCheckStep1CheckFromJson(
        Map<String, dynamic> json) =>
    TemplateLinearityCheckStep1Check(
      type: json['type'] as String,
    );

Map<String, dynamic> _$TemplateLinearityCheckStep1CheckToJson(
        TemplateLinearityCheckStep1Check instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

TemplateLinearityCheckStep2Check _$TemplateLinearityCheckStep2CheckFromJson(
        Map<String, dynamic> json) =>
    TemplateLinearityCheckStep2Check(
      type: json['type'] as String,
    );

Map<String, dynamic> _$TemplateLinearityCheckStep2CheckToJson(
        TemplateLinearityCheckStep2Check instance) =>
    <String, dynamic>{
      'type': instance.type,
    };
