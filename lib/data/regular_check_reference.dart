import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'regular_check_reference.freezed.dart';
part 'regular_check_reference.g.dart';

@freezed
class RegularCheckReference with _$RegularCheckReference {
  factory RegularCheckReference({
    double? value,
    String? prefix,
    String? suffix,
  }) = _RegularCheckReference;

  factory RegularCheckReference.fromJson(Map<String, Object?> json) =>
      _$RegularCheckReferenceFromJson(json);
}
