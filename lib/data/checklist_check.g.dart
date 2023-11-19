// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChecklistRegularCheckImpl _$$ChecklistRegularCheckImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecklistRegularCheckImpl(
      description: json['description'] as String,
      checked: json['checked'] as bool,
    );

Map<String, dynamic> _$$ChecklistRegularCheckImplToJson(
        _$ChecklistRegularCheckImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'checked': instance.checked,
    };

_$ChecklistWithReferenceCheckImpl _$$ChecklistWithReferenceCheckImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecklistWithReferenceCheckImpl(
      description: json['description'] as String,
      checked: json['checked'] as bool,
      referenceDescription: json['referenceDescription'] as String,
      reference1: (json['reference1'] as num).toDouble(),
      reference2: (json['reference2'] as num).toDouble(),
      reference3: (json['reference3'] as num).toDouble(),
    );

Map<String, dynamic> _$$ChecklistWithReferenceCheckImplToJson(
        _$ChecklistWithReferenceCheckImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'checked': instance.checked,
      'referenceDescription': instance.referenceDescription,
      'reference1': instance.reference1,
      'reference2': instance.reference2,
      'reference3': instance.reference3,
    };

_$ChecklistLinearityCheckStep1CheckImpl
    _$$ChecklistLinearityCheckStep1CheckImplFromJson(
            Map<String, dynamic> json) =>
        _$ChecklistLinearityCheckStep1CheckImpl(
          reference1: (json['reference1'] as num).toDouble(),
          reference2: (json['reference2'] as num).toDouble(),
          reference3: (json['reference3'] as num).toDouble(),
        );

Map<String, dynamic> _$$ChecklistLinearityCheckStep1CheckImplToJson(
        _$ChecklistLinearityCheckStep1CheckImpl instance) =>
    <String, dynamic>{
      'reference1': instance.reference1,
      'reference2': instance.reference2,
      'reference3': instance.reference3,
    };

_$ChecklistLinearityCheckStep2CheckImpl
    _$$ChecklistLinearityCheckStep2CheckImplFromJson(
            Map<String, dynamic> json) =>
        _$ChecklistLinearityCheckStep2CheckImpl(
          reference1: (json['reference1'] as num).toDouble(),
          reference2: (json['reference2'] as num).toDouble(),
          reference3: (json['reference3'] as num).toDouble(),
        );

Map<String, dynamic> _$$ChecklistLinearityCheckStep2CheckImplToJson(
        _$ChecklistLinearityCheckStep2CheckImpl instance) =>
    <String, dynamic>{
      'reference1': instance.reference1,
      'reference2': instance.reference2,
      'reference3': instance.reference3,
    };
