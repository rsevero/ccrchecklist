// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateRegularCheckImpl _$$TemplateRegularCheckImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateRegularCheckImpl(
      parent: TemplateSection.fromJson(json['parent'] as Map<String, dynamic>),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$TemplateRegularCheckImplToJson(
        _$TemplateRegularCheckImpl instance) =>
    <String, dynamic>{
      'parent': instance.parent,
      'description': instance.description,
    };

_$TemplateWithReferenceCheckImpl _$$TemplateWithReferenceCheckImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateWithReferenceCheckImpl(
      parent: TemplateSection.fromJson(json['parent'] as Map<String, dynamic>),
      description: json['description'] as String,
      referenceDescription: json['referenceDescription'] as String,
    );

Map<String, dynamic> _$$TemplateWithReferenceCheckImplToJson(
        _$TemplateWithReferenceCheckImpl instance) =>
    <String, dynamic>{
      'parent': instance.parent,
      'description': instance.description,
      'referenceDescription': instance.referenceDescription,
    };

_$TemplateLinearityCheckStep1CheckImpl
    _$$TemplateLinearityCheckStep1CheckImplFromJson(
            Map<String, dynamic> json) =>
        _$TemplateLinearityCheckStep1CheckImpl(
          parent:
              TemplateSection.fromJson(json['parent'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$TemplateLinearityCheckStep1CheckImplToJson(
        _$TemplateLinearityCheckStep1CheckImpl instance) =>
    <String, dynamic>{
      'parent': instance.parent,
    };

_$TemplateLinearityCheckStep2CheckImpl
    _$$TemplateLinearityCheckStep2CheckImplFromJson(
            Map<String, dynamic> json) =>
        _$TemplateLinearityCheckStep2CheckImpl(
          parent:
              TemplateSection.fromJson(json['parent'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$TemplateLinearityCheckStep2CheckImplToJson(
        _$TemplateLinearityCheckStep2CheckImpl instance) =>
    <String, dynamic>{
      'parent': instance.parent,
    };
