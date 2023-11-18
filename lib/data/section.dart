import 'package:ccr_checklist/data/check.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'section.freezed.dart';
part 'section.g.dart';

@unfreezed
sealed class Section with _$Section {
  factory Section({
    required String title,
    required List<Check> checks,
  }) = _Section;

  Section._();

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);
}
