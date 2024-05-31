// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChecklistRegularCheckImpl _$$ChecklistRegularCheckImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecklistRegularCheckImpl(
      description: json['description'] as String,
      observation: json['observation'] as String,
      isChecked: json['isChecked'] as bool,
      lastChange: DateTime.parse(json['lastChange'] as String),
      secondsTimer: (json['secondsTimer'] as num).toInt(),
      references: (json['references'] as List<dynamic>)
          .map((e) => RegularCheckReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChecklistRegularCheckImplToJson(
        _$ChecklistRegularCheckImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'observation': instance.observation,
      'isChecked': instance.isChecked,
      'lastChange': instance.lastChange.toIso8601String(),
      'secondsTimer': instance.secondsTimer,
      'references': instance.references,
      'runtimeType': instance.$type,
    };

_$ChecklistLinearityStep1CheckImpl _$$ChecklistLinearityStep1CheckImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecklistLinearityStep1CheckImpl(
      description: json['description'] as String,
      isChecked: json['isChecked'] as bool,
      lastChange: DateTime.parse(json['lastChange'] as String),
      referenceCount: (json['referenceCount'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChecklistLinearityStep1CheckImplToJson(
        _$ChecklistLinearityStep1CheckImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'isChecked': instance.isChecked,
      'lastChange': instance.lastChange.toIso8601String(),
      'referenceCount': instance.referenceCount,
      'runtimeType': instance.$type,
    };

_$ChecklistLinearityStep2CheckImpl _$$ChecklistLinearityStep2CheckImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecklistLinearityStep2CheckImpl(
      description: json['description'] as String,
      isChecked: json['isChecked'] as bool,
      lastChange: DateTime.parse(json['lastChange'] as String),
      referenceCount: (json['referenceCount'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChecklistLinearityStep2CheckImplToJson(
        _$ChecklistLinearityStep2CheckImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'isChecked': instance.isChecked,
      'lastChange': instance.lastChange.toIso8601String(),
      'referenceCount': instance.referenceCount,
      'runtimeType': instance.$type,
    };
