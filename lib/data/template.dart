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

import 'package:ccrchecklist/data/template_section.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template.freezed.dart';
part 'template.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Template with _$Template {
  @JsonSerializable(explicitToJson: true)
  factory Template({
    required String rebreatherManufacturer,
    required String rebreatherModel,
    required String title,
    required String description,
    required List<TemplateSection> sections,
    @Default('') String path,
    @Default(false) bool isAsset,
  }) = _Template;

  factory Template.empty() {
    return Template(
      rebreatherManufacturer: '',
      rebreatherModel: '',
      title: '',
      description: '',
      sections: [],
    );
  }

  factory Template.fromJson(Map<String, dynamic> json) =>
      _$TemplateFromJson(json);
}
