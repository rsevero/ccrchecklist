import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_check.freezed.dart';
part 'template_check.g.dart';

sealed class TemplateCheck {
  TemplateCheck._();
  factory TemplateCheck.fromJson(Map<String, dynamic> json) {
    switch (json['type'] as String) {
      case 'regular':
        return TemplateRegularCheck.fromJson(json);
      case 'withReference':
        return TemplateWithReferenceCheck.fromJson(json);
      case 'linearityCheckStep1':
        return TemplateLinearityCheckStep1Check.fromJson(json);
      case 'linearityCheckStep2':
        return TemplateLinearityCheckStep2Check.fromJson(json);
      default:
        throw UnsupportedError("Unknown check type ${json['type']}");
    }
  }

  Map<String, dynamic> toJson() {
    switch (runtimeType) {
      case TemplateRegularCheck:
        return (this as TemplateRegularCheck).toJson();
      case TemplateWithReferenceCheck:
        return (this as TemplateWithReferenceCheck).toJson();
      case TemplateLinearityCheckStep1Check:
        return (this as TemplateLinearityCheckStep1Check).toJson();
      case TemplateLinearityCheckStep2Check:
        return (this as TemplateLinearityCheckStep2Check).toJson();
      default:
        throw UnsupportedError("Unknown check type $runtimeType");
    }
  }
}

@unfreezed
sealed class TemplateRegularCheck extends TemplateCheck
    with _$TemplateRegularCheck {
  factory TemplateRegularCheck(
      {required String description, required bool checked}) = _RegularCheck;

  factory TemplateRegularCheck.fromJson(Map<String, dynamic> json) =>
      _$TemplateRegularCheckFromJson(json);
}

@unfreezed
sealed class TemplateWithReferenceCheck extends TemplateCheck
    with _$TemplateWithReferenceCheck {
  factory TemplateWithReferenceCheck({
    required String description,
    required bool checked,
    required String referenceDescription,
    required double reference1,
    required double reference2,
    required double reference3,
  }) = _TemplateWithReferenceCheck;

  factory TemplateWithReferenceCheck.fromJson(Map<String, dynamic> json) =>
      _$TemplateWithReferenceCheckFromJson(json);
}

@unfreezed
sealed class TemplateLinearityCheckStep1Check extends TemplateCheck
    with _$TemplateLinearityCheckStep1Check {
  factory TemplateLinearityCheckStep1Check({
    required double reference1,
    required double reference2,
    required double reference3,
  }) = _TemplateLinearityCheckStep1Check;

  factory TemplateLinearityCheckStep1Check.fromJson(
          Map<String, dynamic> json) =>
      _$TemplateLinearityCheckStep1CheckFromJson(json);
}

@unfreezed
sealed class TemplateLinearityCheckStep2Check extends TemplateCheck
    with _$TemplateLinearityCheckStep2Check {
  factory TemplateLinearityCheckStep2Check({
    required double reference1,
    required double reference2,
    required double reference3,
  }) = _TemplateLinearityCheckStep2Check;

  factory TemplateLinearityCheckStep2Check.fromJson(
          Map<String, dynamic> json) =>
      _$TemplateLinearityCheckStep2CheckFromJson(json);
}
