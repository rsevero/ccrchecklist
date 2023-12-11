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
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChecklistRegularCheckImplToJson(
        _$ChecklistRegularCheckImpl instance) =>
    <String, dynamic>{
      'isChecked': instance.isChecked,
      'lastChange': instance.lastChange.toIso8601String(),
      'description': instance.description,
      'runtimeType': instance.$type,
    };

_$ChecklistWithReferenceCheckImpl _$$ChecklistWithReferenceCheckImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecklistWithReferenceCheckImpl(
      isChecked: json['isChecked'] as bool,
      lastChange: DateTime.parse(json['lastChange'] as String),
      description: json['description'] as String,
      referenceCount: json['referenceCount'] as int,
      references: (json['references'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), (e as num).toDouble()),
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ChecklistWithReferenceCheckImplToJson(
        _$ChecklistWithReferenceCheckImpl instance) =>
    <String, dynamic>{
      'isChecked': instance.isChecked,
      'lastChange': instance.lastChange.toIso8601String(),
      'description': instance.description,
      'referenceCount': instance.referenceCount,
      'references':
          instance.references.map((k, e) => MapEntry(k.toString(), e)),
      'runtimeType': instance.$type,
    };

_$ChecklistLinearityCheckStep1CheckImpl
    _$$ChecklistLinearityCheckStep1CheckImplFromJson(
            Map<String, dynamic> json) =>
        _$ChecklistLinearityCheckStep1CheckImpl(
          isChecked: json['isChecked'] as bool,
          lastChange: DateTime.parse(json['lastChange'] as String),
          referenceCount: json['referenceCount'] as int,
          references: (json['references'] as Map<String, dynamic>).map(
            (k, e) => MapEntry(int.parse(k), (e as num).toDouble()),
          ),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$ChecklistLinearityCheckStep1CheckImplToJson(
        _$ChecklistLinearityCheckStep1CheckImpl instance) =>
    <String, dynamic>{
      'isChecked': instance.isChecked,
      'lastChange': instance.lastChange.toIso8601String(),
      'referenceCount': instance.referenceCount,
      'references':
          instance.references.map((k, e) => MapEntry(k.toString(), e)),
      'runtimeType': instance.$type,
    };

_$ChecklistLinearityCheckStep2CheckImpl
    _$$ChecklistLinearityCheckStep2CheckImplFromJson(
            Map<String, dynamic> json) =>
        _$ChecklistLinearityCheckStep2CheckImpl(
          isChecked: json['isChecked'] as bool,
          lastChange: DateTime.parse(json['lastChange'] as String),
          referenceCount: json['referenceCount'] as int,
          references: (json['references'] as Map<String, dynamic>).map(
            (k, e) => MapEntry(int.parse(k), (e as num).toDouble()),
          ),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$ChecklistLinearityCheckStep2CheckImplToJson(
        _$ChecklistLinearityCheckStep2CheckImpl instance) =>
    <String, dynamic>{
      'isChecked': instance.isChecked,
      'lastChange': instance.lastChange.toIso8601String(),
      'referenceCount': instance.referenceCount,
      'references':
          instance.references.map((k, e) => MapEntry(k.toString(), e)),
      'runtimeType': instance.$type,
    };
