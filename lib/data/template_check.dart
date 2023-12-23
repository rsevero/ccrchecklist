import 'package:ccr_checklist/data/regular_check_reference.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_check.freezed.dart';
part 'template_check.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
sealed class TemplateCheck with _$TemplateCheck {
  TemplateCheck._();

  factory TemplateCheck.regular({
    required String description,
    required int secondsTimer,
    required String observation,
    required List<RegularCheckReference> references,
  }) = TemplateRegularCheck;

  factory TemplateCheck.linearityStep1({
    required String description,
    required int referenceCount,
  }) = TemplateLinearityStep1Check;

  factory TemplateCheck.linearityStep2({
    required String description,
  }) = TemplateLinearityStep2Check;

  factory TemplateCheck.fromJson(Map<String, Object?> json) =>
      _$TemplateCheckFromJson(json);
}
