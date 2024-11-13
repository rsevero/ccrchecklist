import 'package:ccr_checklist/data/regular_check_reference.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_check.freezed.dart';
part 'checklist_check.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
sealed class ChecklistCheck with _$ChecklistCheck {
  ChecklistCheck._();

  factory ChecklistCheck.regular({
    required String description,
    required String observation,
    required bool isChecked,
    required DateTime lastChange,
    required int secondsTimer,
    required List<RegularCheckReference> references,
  }) = ChecklistRegularCheck;

  factory ChecklistCheck.linearityStep1({
    required String description,
    required bool isChecked,
    required DateTime lastChange,
    required int referenceCount,
  }) = ChecklistLinearityStep1Check;

  factory ChecklistCheck.linearityStep2({
    required String description,
    required bool isChecked,
    required DateTime lastChange,
  }) = ChecklistLinearityStep2Check;

  factory ChecklistCheck.completeLinearity({
    required String description,
    required bool isChecked,
    required DateTime lastChange,
    required int referenceCount,
  }) = ChecklistCompleteLinearityCheck;

  factory ChecklistCheck.fromJson(Map<String, Object?> json) =>
      _$ChecklistCheckFromJson(json);
}
