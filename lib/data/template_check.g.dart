// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegularCheckImpl _$$RegularCheckImplFromJson(Map<String, dynamic> json) =>
    _$RegularCheckImpl(
      description: json['description'] as String,
      checked: json['checked'] as bool,
    );

Map<String, dynamic> _$$RegularCheckImplToJson(_$RegularCheckImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'checked': instance.checked,
    };

_$TemplateWithReferenceCheckImpl _$$TemplateWithReferenceCheckImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateWithReferenceCheckImpl(
      description: json['description'] as String,
      checked: json['checked'] as bool,
      referenceDescription: json['referenceDescription'] as String,
      reference1: (json['reference1'] as num).toDouble(),
      reference2: (json['reference2'] as num).toDouble(),
      reference3: (json['reference3'] as num).toDouble(),
    );

Map<String, dynamic> _$$TemplateWithReferenceCheckImplToJson(
        _$TemplateWithReferenceCheckImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'checked': instance.checked,
      'referenceDescription': instance.referenceDescription,
      'reference1': instance.reference1,
      'reference2': instance.reference2,
      'reference3': instance.reference3,
    };

_$TemplateLinearityCheckStep1CheckImpl
    _$$TemplateLinearityCheckStep1CheckImplFromJson(
            Map<String, dynamic> json) =>
        _$TemplateLinearityCheckStep1CheckImpl(
          reference1: (json['reference1'] as num).toDouble(),
          reference2: (json['reference2'] as num).toDouble(),
          reference3: (json['reference3'] as num).toDouble(),
        );

Map<String, dynamic> _$$TemplateLinearityCheckStep1CheckImplToJson(
        _$TemplateLinearityCheckStep1CheckImpl instance) =>
    <String, dynamic>{
      'reference1': instance.reference1,
      'reference2': instance.reference2,
      'reference3': instance.reference3,
    };

_$TemplateLinearityCheckStep2CheckImpl
    _$$TemplateLinearityCheckStep2CheckImplFromJson(
            Map<String, dynamic> json) =>
        _$TemplateLinearityCheckStep2CheckImpl(
          reference1: (json['reference1'] as num).toDouble(),
          reference2: (json['reference2'] as num).toDouble(),
          reference3: (json['reference3'] as num).toDouble(),
        );

Map<String, dynamic> _$$TemplateLinearityCheckStep2CheckImplToJson(
        _$TemplateLinearityCheckStep2CheckImpl instance) =>
    <String, dynamic>{
      'reference1': instance.reference1,
      'reference2': instance.reference2,
      'reference3': instance.reference3,
    };
