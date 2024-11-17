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

import 'package:ccrchecklist/data/template.dart';
import 'package:ccrchecklist/data/template_file.dart';
import 'package:ccrchecklist/store/template_list_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TemplateLoadHelper {
  static Future<Template> loadTemplate(BuildContext context, int index) async {
    final templateListStore =
        Provider.of<TemplateListStore>(context, listen: false);
    final TemplateFile templateFile = templateListStore.defaultTemplates[index];
    final Template template = await templateListStore.getTemplate(
        templateFile.path, templateFile.isAsset);

    return template;
  }
}
