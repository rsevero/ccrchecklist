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

import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_file.freezed.dart';
part 'template_file.g.dart';

@freezed
class TemplateFile with _$TemplateFile {
  @JsonSerializable(explicitToJson: true)
  factory TemplateFile({
    required String path,
    required String rebreatherManufacturer,
    required String rebreatherModel,
    required String title,
    required String description,
    required bool isAsset,
  }) = _TemplateFile;

  factory TemplateFile.fromJson(Map<String, dynamic> json) =>
      _$TemplateFileFromJson(json);
}
