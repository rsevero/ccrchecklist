import 'package:ccr_checklist/data/checklist_section.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist.freezed.dart';
part 'checklist.g.dart';

@unfreezed
class Checklist with _$Checklist {
  factory Checklist({
    required String title,
    required String description,
    required String diverName,
    required DateTime date,
    required List<ChecklistSection> sections,
  }) = _Checklist;

  Checklist._();

  factory Checklist.fromJson(Map<String, dynamic> json) =>
      _$ChecklistFromJson(json);
}
