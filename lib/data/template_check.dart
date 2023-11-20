import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_check.freezed.dart';
part 'template_check.g.dart';

sealed class TemplateCheck {
  final type = 'abstract check';

  TemplateCheck();
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
class TemplateRegularCheck extends TemplateCheck with _$TemplateRegularCheck {
  TemplateRegularCheck._();

  factory TemplateRegularCheck({required String description}) =
      _TemplateRegularCheck;

  factory TemplateRegularCheck.fromJson(Map<String, dynamic> json) =>
      _$TemplateRegularCheckFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get type => 'regular';
}

@unfreezed
class TemplateWithReferenceCheck extends TemplateCheck
    with _$TemplateWithReferenceCheck {
  TemplateWithReferenceCheck._();

  factory TemplateWithReferenceCheck({
    required String description,
    required String referenceDescription,
  }) = _TemplateWithReferenceCheck;

  factory TemplateWithReferenceCheck.fromJson(Map<String, dynamic> json) =>
      _$TemplateWithReferenceCheckFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get type => 'with reference';
}

@unfreezed
class TemplateLinearityCheckStep1Check extends TemplateCheck
    with _$TemplateLinearityCheckStep1Check {
  TemplateLinearityCheckStep1Check._();

  factory TemplateLinearityCheckStep1Check({required String title}) =
      _TemplateLinearityCheckStep1Check;

  factory TemplateLinearityCheckStep1Check.fromJson(
          Map<String, dynamic> json) =>
      _$TemplateLinearityCheckStep1CheckFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get type => 'linearity check initial step';
}

@unfreezed
class TemplateLinearityCheckStep2Check extends TemplateCheck
    with _$TemplateLinearityCheckStep2Check {
  TemplateLinearityCheckStep2Check._();

  factory TemplateLinearityCheckStep2Check({required String title}) =
      _TemplateLinearityCheckStep2Check;

  factory TemplateLinearityCheckStep2Check.fromJson(
          Map<String, dynamic> json) =>
      _$TemplateLinearityCheckStep2CheckFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get type => 'linearity check final step';
}
