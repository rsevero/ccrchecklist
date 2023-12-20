import 'package:ccr_checklist/data/regular_check_reference.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_check.freezed.dart';
part 'checklist_check.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
sealed class ChecklistCheck with _$ChecklistCheck {
  @override
  final bool isChecked = false;

  ChecklistCheck._();

  factory ChecklistCheck.regular({
    required bool isChecked,
    required DateTime lastChange,
    required String description,
    required int secondsTimer,
    required List<RegularCheckReference> references,
  }) = ChecklistRegularCheck;
  factory ChecklistCheck.linearityStep1({
    required bool isChecked,
    required DateTime lastChange,
    required int referenceCount,
  }) = ChecklistLinearityStep1Check;
  factory ChecklistCheck.linearityStep2({
    required bool isChecked,
    required DateTime lastChange,
    required int referenceCount,
  }) = ChecklistLinearityStep2Check;

  String get description {
    if (this is ChecklistRegularCheck) {
      return (this as ChecklistRegularCheck).description;
    } else if (this is ChecklistLinearityStep1Check) {
      return 'Linearity Step 1';
    } else if (this is ChecklistLinearityStep2Check) {
      return 'Linearity Step 2';
    } else {
      throw Exception('Unknown ChecklistCheck type');
    }
  }

  factory ChecklistCheck.fromJson(Map<String, Object?> json) =>
      _$ChecklistCheckFromJson(json);
}
