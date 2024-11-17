// CCR Checklist - a checklist app for rebreather users
// Copyright (C) 2024  Rodrigo Severo
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:ccrchecklist/data/regular_check_reference.dart';
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
    required String measurement,
    required String description,
    required int referenceCount,
  }) = TemplateLinearityStep1Check;

  factory TemplateCheck.linearityStep2({
    required String description,
  }) = TemplateLinearityStep2Check;

  factory TemplateCheck.completeLinearity({
    required String measurement,
    required String description,
    required int referenceCount,
  }) = TemplateCompleteLinearityCheck;

  factory TemplateCheck.fromJson(Map<String, Object?> json) =>
      _$TemplateCheckFromJson(json);
}
