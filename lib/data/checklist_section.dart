import 'package:ccr_checklist/data/checklist_check.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_section.freezed.dart';
part 'checklist_section.g.dart';

@freezed
sealed class ChecklistSection with _$ChecklistSection {
  factory ChecklistSection({
    required String title,
    required List<ChecklistCheck> checks,
  }) = _ChecklistSection;

  ChecklistSection._();

  factory ChecklistSection.fromJson(Map<String, dynamic> json) =>
      _$ChecklistSectionFromJson(json);
}
