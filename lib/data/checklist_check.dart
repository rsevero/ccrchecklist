import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_check.freezed.dart';
part 'checklist_check.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
sealed class ChecklistCheck with _$ChecklistCheck {
  ChecklistCheck._();

  factory ChecklistCheck.regular(
      {required bool isChecked,
      required String description}) = ChecklistRegularCheck;
  factory ChecklistCheck.withReference({
    required bool isChecked,
    required String description,
    required int referenceCount,
    required Map<int, double> references,
  }) = ChecklistWithReferenceCheck;
  factory ChecklistCheck.linearityStep1({
    required bool isChecked,
    required int referenceCount,
    required Map<int, double> references,
  }) = ChecklistLinearityCheckStep1Check;
  factory ChecklistCheck.linearityStep2({
    required bool isChecked,
    required int referenceCount,
    required Map<int, double> references,
  }) = ChecklistLinearityCheckStep2Check;

  String get description {
    if (this is ChecklistRegularCheck) {
      return (this as ChecklistRegularCheck).description;
    } else if (this is ChecklistWithReferenceCheck) {
      return (this as ChecklistWithReferenceCheck).description;
    } else if (this is ChecklistLinearityCheckStep1Check) {
      return 'Linearity Step 1';
    } else if (this is ChecklistLinearityCheckStep2Check) {
      return 'Linearity Step 2';
    } else {
      throw Exception('Unknown ChecklistCheck type');
    }
  }

  factory ChecklistCheck.fromJson(Map<String, Object?> json) =>
      _$ChecklistCheckFromJson(json);
}
