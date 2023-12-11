// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChecklistRegularCheckImpl _$$ChecklistRegularCheckImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecklistRegularCheckImpl(
      isChecked: json['isChecked'] as bool,
      lastChange: DateTime.parse(json['lastChange'] as String),
      description: json['description'] as String,
      secondsTimer: json['secondsTimer'] as int,
      referenceCount: json['referenceCount'] as int,
      references: (json['references'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), (e as num).toDouble()),
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChecklistRegularCheckImplToJson(
        _$ChecklistRegularCheckImpl instance) =>
    <String, dynamic>{
      'isChecked': instance.isChecked,
      'lastChange': instance.lastChange.toIso8601String(),
      'description': instance.description,
      'secondsTimer': instance.secondsTimer,
      'referenceCount': instance.referenceCount,
      'references':
          instance.references.map((k, e) => MapEntry(k.toString(), e)),
      'runtimeType': instance.$type,
    };

_$ChecklistLinearityStep1CheckImpl _$$ChecklistLinearityStep1CheckImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecklistLinearityStep1CheckImpl(
      isChecked: json['isChecked'] as bool,
      lastChange: DateTime.parse(json['lastChange'] as String),
      referenceCount: json['referenceCount'] as int,
      references: (json['references'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), (e as num).toDouble()),
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChecklistLinearityStep1CheckImplToJson(
        _$ChecklistLinearityStep1CheckImpl instance) =>
    <String, dynamic>{
      'isChecked': instance.isChecked,
      'lastChange': instance.lastChange.toIso8601String(),
      'referenceCount': instance.referenceCount,
      'references':
          instance.references.map((k, e) => MapEntry(k.toString(), e)),
      'runtimeType': instance.$type,
    };

_$ChecklistLinearityStep2CheckImpl _$$ChecklistLinearityStep2CheckImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecklistLinearityStep2CheckImpl(
      isChecked: json['isChecked'] as bool,
      lastChange: DateTime.parse(json['lastChange'] as String),
      referenceCount: json['referenceCount'] as int,
      references: (json['references'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), (e as num).toDouble()),
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChecklistLinearityStep2CheckImplToJson(
        _$ChecklistLinearityStep2CheckImpl instance) =>
    <String, dynamic>{
      'isChecked': instance.isChecked,
      'lastChange': instance.lastChange.toIso8601String(),
      'referenceCount': instance.referenceCount,
      'references':
          instance.references.map((k, e) => MapEntry(k.toString(), e)),
      'runtimeType': instance.$type,
    };
