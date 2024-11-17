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

import 'package:ccrchecklist/data/template_check.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_section.freezed.dart';
part 'template_section.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TemplateSection with _$TemplateSection {
  @JsonSerializable(explicitToJson: true)
  factory TemplateSection(
      {required String title,
      required List<TemplateCheck> checks}) = _TemplateSection;

  factory TemplateSection.empty() {
    return TemplateSection(
      title: '',
      checks: [],
    );
  }

  factory TemplateSection.fromJson(Map<String, dynamic> json) =>
      _$TemplateSectionFromJson(json);
}
