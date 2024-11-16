import 'package:ccrchecklist/data/checklist_section.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist.freezed.dart';
part 'checklist.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Checklist with _$Checklist {
  @JsonSerializable(explicitToJson: true)
  factory Checklist({
    required String rebreatherManufacturer,
    required String rebreatherModel,
    required String title,
    required String description,
    required String diverName,
    required DateTime date,
    required List<ChecklistSection> sections,
  }) = _Checklist;

  factory Checklist.fromJson(Map<String, dynamic> json) =>
      _$ChecklistFromJson(json);
}
