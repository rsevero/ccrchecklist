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

import 'package:ccrchecklist/data/checklist_section.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist.freezed.dart';
part 'checklist.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Checklist with _$Checklist {
  @JsonSerializable(explicitToJson: true)
  factory Checklist({
    required String rebreatherManufacturer,
    required String rebreatherModel,
    required String title,
    required String description,
    required String diverName,
    required DateTime date,
    required List<ChecklistSection> sections,
  }) = _Checklist;

  factory Checklist.fromJson(Map<String, dynamic> json) =>
      _$ChecklistFromJson(json);
}
