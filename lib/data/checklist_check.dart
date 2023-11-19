import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_check.freezed.dart';
part 'checklist_check.g.dart';

sealed class ChecklistCheck {
  ChecklistCheck._();
  factory ChecklistCheck.fromJson(Map<String, dynamic> json) {
    switch (json['type'] as String) {
      case 'regular':
        return ChecklistRegularCheck.fromJson(json);
      case 'withReference':
        return ChecklistWithReferenceCheck.fromJson(json);
      case 'linearityCheckStep1':
        return ChecklistLinearityCheckStep1Check.fromJson(json);
      case 'linearityCheckStep2':
        return ChecklistLinearityCheckStep2Check.fromJson(json);
      default:
        throw UnsupportedError("Unknown check type ${json['type']}");
    }
  }

  Map<String, dynamic> toJson() {
    switch (runtimeType) {
      case ChecklistRegularCheck:
        return (this as ChecklistRegularCheck).toJson();
      case ChecklistWithReferenceCheck:
        return (this as ChecklistWithReferenceCheck).toJson();
      case ChecklistLinearityCheckStep1Check:
        return (this as ChecklistLinearityCheckStep1Check).toJson();
      case ChecklistLinearityCheckStep2Check:
        return (this as ChecklistLinearityCheckStep2Check).toJson();
      default:
        throw UnsupportedError("Unknown check type $runtimeType");
    }
  }
}

@unfreezed
sealed class ChecklistRegularCheck extends ChecklistCheck
    with _$ChecklistRegularCheck {
  factory ChecklistRegularCheck(
      {required final String description,
      required bool checked}) = _ChecklistRegularCheck;

  factory ChecklistRegularCheck.fromJson(Map<String, dynamic> json) =>
      _$ChecklistRegularCheckFromJson(json);
}

@unfreezed
sealed class ChecklistWithReferenceCheck extends ChecklistCheck
    with _$ChecklistWithReferenceCheck {
  factory ChecklistWithReferenceCheck({
    required final String description,
    required bool checked,
    required final String referenceDescription,
    required double reference1,
    required double reference2,
    required double reference3,
  }) = _ChecklistWithReferenceCheck;

  factory ChecklistWithReferenceCheck.fromJson(Map<String, dynamic> json) =>
      _$ChecklistWithReferenceCheckFromJson(json);
}

@unfreezed
sealed class ChecklistLinearityCheckStep1Check extends ChecklistCheck
    with _$ChecklistLinearityCheckStep1Check {
  factory ChecklistLinearityCheckStep1Check({
    required double reference1,
    required double reference2,
    required double reference3,
  }) = _ChecklistLinearityCheckStep1Check;

  factory ChecklistLinearityCheckStep1Check.fromJson(
          Map<String, dynamic> json) =>
      _$ChecklistLinearityCheckStep1CheckFromJson(json);
}

@unfreezed
sealed class ChecklistLinearityCheckStep2Check extends ChecklistCheck
    with _$ChecklistLinearityCheckStep2Check {
  factory ChecklistLinearityCheckStep2Check({
    required double reference1,
    required double reference2,
    required double reference3,
  }) = _ChecklistLinearityCheckStep2Check;

  factory ChecklistLinearityCheckStep2Check.fromJson(
          Map<String, dynamic> json) =>
      _$ChecklistLinearityCheckStep2CheckFromJson(json);
}
