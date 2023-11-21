import 'package:ccr_checklist/data/template_section.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_check.freezed.dart';
part 'template_check.g.dart';

class TemplateCheck {
  final TemplateSection parent;

  TemplateCheck(this.parent);

  factory TemplateCheck.fromJson(Map<String, dynamic> json) {
    return TemplateCheck(json['parent']);
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

  String get type => 'abstract check';
}

@unfreezed
class TemplateRegularCheck with _$TemplateRegularCheck {
  TemplateRegularCheck._();

  @Implements<TemplateCheck>()
  factory TemplateRegularCheck(
      {required TemplateSection parent,
      required String description}) = _TemplateRegularCheck;

  factory TemplateRegularCheck.fromJson(Map<String, dynamic> json) =>
      _$TemplateRegularCheckFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get type => 'regular';
}

@unfreezed
class TemplateWithReferenceCheck with _$TemplateWithReferenceCheck {
  TemplateWithReferenceCheck._();

  @Implements<TemplateCheck>()
  factory TemplateWithReferenceCheck({
    required TemplateSection parent,
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
class TemplateLinearityCheckStep1Check with _$TemplateLinearityCheckStep1Check {
  TemplateLinearityCheckStep1Check._();

  @Implements<TemplateCheck>()
  factory TemplateLinearityCheckStep1Check({required TemplateSection parent}) =
      _TemplateLinearityCheckStep1Check;

  factory TemplateLinearityCheckStep1Check.fromJson(
          Map<String, dynamic> json) =>
      _$TemplateLinearityCheckStep1CheckFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get type => 'linearity check initial step';
}

@unfreezed
class TemplateLinearityCheckStep2Check with _$TemplateLinearityCheckStep2Check {
  TemplateLinearityCheckStep2Check._();

  @Implements<TemplateCheck>()
  factory TemplateLinearityCheckStep2Check({required TemplateSection parent}) =
      _TemplateLinearityCheckStep2Check;

  factory TemplateLinearityCheckStep2Check.fromJson(
          Map<String, dynamic> json) =>
      _$TemplateLinearityCheckStep2CheckFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get type => 'linearity check final step';
}
