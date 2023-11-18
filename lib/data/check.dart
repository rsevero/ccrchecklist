import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check.freezed.dart';
part 'check.g.dart';

sealed class Check {
  Check._();
  factory Check.fromJson(Map<String, dynamic> json) {
    switch (json['type'] as String) {
      case 'regular':
        return RegularCheck.fromJson(json);
      case 'withReference':
        return WithReferenceCheck.fromJson(json);
      case 'linearityCheckStep1':
        return LinearityCheckStep1Check.fromJson(json);
      case 'linearityCheckStep2':
        return LinearityCheckStep2Check.fromJson(json);
      default:
        throw UnsupportedError("Unknown check type ${json['type']}");
    }
  }

  Map<String, dynamic> toJson() {
    switch (runtimeType) {
      case RegularCheck:
        return (this as RegularCheck).toJson();
      case WithReferenceCheck:
        return (this as WithReferenceCheck).toJson();
      case LinearityCheckStep1Check:
        return (this as LinearityCheckStep1Check).toJson();
      case LinearityCheckStep2Check:
        return (this as LinearityCheckStep2Check).toJson();
      default:
        throw UnsupportedError("Unknown check type $runtimeType");
    }
  }
}

@unfreezed
sealed class RegularCheck extends Check with _$RegularCheck {
  factory RegularCheck({required String description, required bool checked}) =
      _RegularCheck;

  factory RegularCheck.fromJson(Map<String, dynamic> json) =>
      _$RegularCheckFromJson(json);
}

@unfreezed
sealed class WithReferenceCheck extends Check with _$WithReferenceCheck {
  factory WithReferenceCheck({
    required String description,
    required bool checked,
    required String referenceDescription,
    required double reference1,
    required double reference2,
    required double reference3,
  }) = _WithReferenceCheck;

  factory WithReferenceCheck.fromJson(Map<String, dynamic> json) =>
      _$WithReferenceCheckFromJson(json);
}

@unfreezed
sealed class LinearityCheckStep1Check extends Check
    with _$LinearityCheckStep1Check {
  factory LinearityCheckStep1Check({
    required double reference1,
    required double reference2,
    required double reference3,
  }) = _LinearityCheckStep1Check;

  factory LinearityCheckStep1Check.fromJson(Map<String, dynamic> json) =>
      _$LinearityCheckStep1CheckFromJson(json);
}

@unfreezed
sealed class LinearityCheckStep2Check extends Check
    with _$LinearityCheckStep2Check {
  factory LinearityCheckStep2Check({
    required double reference1,
    required double reference2,
    required double reference3,
  }) = _LinearityCheckStep2Check;

  factory LinearityCheckStep2Check.fromJson(Map<String, dynamic> json) =>
      _$LinearityCheckStep2CheckFromJson(json);
}
