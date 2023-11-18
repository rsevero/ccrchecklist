// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check.dart';

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

_$WithReferenceCheckImpl _$$WithReferenceCheckImplFromJson(
        Map<String, dynamic> json) =>
    _$WithReferenceCheckImpl(
      description: json['description'] as String,
      checked: json['checked'] as bool,
      referenceDescription: json['referenceDescription'] as String,
      reference1: (json['reference1'] as num).toDouble(),
      reference2: (json['reference2'] as num).toDouble(),
      reference3: (json['reference3'] as num).toDouble(),
    );

Map<String, dynamic> _$$WithReferenceCheckImplToJson(
        _$WithReferenceCheckImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'checked': instance.checked,
      'referenceDescription': instance.referenceDescription,
      'reference1': instance.reference1,
      'reference2': instance.reference2,
      'reference3': instance.reference3,
    };

_$LinearityCheckStep1CheckImpl _$$LinearityCheckStep1CheckImplFromJson(
        Map<String, dynamic> json) =>
    _$LinearityCheckStep1CheckImpl(
      reference1: (json['reference1'] as num).toDouble(),
      reference2: (json['reference2'] as num).toDouble(),
      reference3: (json['reference3'] as num).toDouble(),
    );

Map<String, dynamic> _$$LinearityCheckStep1CheckImplToJson(
        _$LinearityCheckStep1CheckImpl instance) =>
    <String, dynamic>{
      'reference1': instance.reference1,
      'reference2': instance.reference2,
      'reference3': instance.reference3,
    };

_$LinearityCheckStep2CheckImpl _$$LinearityCheckStep2CheckImplFromJson(
        Map<String, dynamic> json) =>
    _$LinearityCheckStep2CheckImpl(
      reference1: (json['reference1'] as num).toDouble(),
      reference2: (json['reference2'] as num).toDouble(),
      reference3: (json['reference3'] as num).toDouble(),
    );

Map<String, dynamic> _$$LinearityCheckStep2CheckImplToJson(
        _$LinearityCheckStep2CheckImpl instance) =>
    <String, dynamic>{
      'reference1': instance.reference1,
      'reference2': instance.reference2,
      'reference3': instance.reference3,
    };
