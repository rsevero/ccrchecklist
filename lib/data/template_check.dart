import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_check.freezed.dart';
part 'template_check.g.dart';

@freezed
sealed class TemplateCheck with _$TemplateCheck {
  const TemplateCheck._();

  factory TemplateCheck.regular({required String description}) =
      TemplateRegularCheck;
  factory TemplateCheck.withReference(
      {required String description,
      required int referenceCount}) = TemplateWithReferenceCheck;
  factory TemplateCheck.linearityStep1({required int referenceCount}) =
      TemplateLinearityStep1Check;
  factory TemplateCheck.linearityStep2(
          {required TemplateLinearityStep1Check step1}) =
      TemplateLinearityStep2Check;

  String get description {
    if (this is TemplateRegularCheck) {
      return (this as TemplateRegularCheck).description;
    } else if (this is TemplateWithReferenceCheck) {
      return (this as TemplateWithReferenceCheck).description;
    } else if (this is TemplateLinearityStep1Check) {
      return 'Linearity Step 1';
    } else if (this is TemplateLinearityStep2Check) {
      return 'Linearity Step 2';
    } else {
      throw Exception('Unknown TemplateCheck type');
    }
  }

  factory TemplateCheck.fromJson(Map<String, Object?> json) =>
      _$TemplateCheckFromJson(json);
}
