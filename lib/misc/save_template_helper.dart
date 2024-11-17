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

import 'dart:io';
import 'package:ccrchecklist/data/template.dart';
import 'package:ccrchecklist/misc/constants.dart';
import 'package:ccrchecklist/misc/ccr_directory_helper.dart';
import 'package:ccrchecklist/store/template_editor_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slugify/slugify.dart';
import 'package:uuid/uuid.dart';

Future<bool> fileExists(String filepath) async {
  final file = File(filepath);
  return await file.exists();
}

Future<String> ccrFileNameFromTemplate(Template template) async {
  String filename = '';
  String filepath = '';

  const uuidGenerator = Uuid();
  do {
    filename = uuidGenerator.v7();
    filename = slugify(filename, delimiter: '_');
    filepath = await ccrFilePathFromFileName(filename);
  } while (await fileExists(filepath));

  return filename;
}

Future<String> ccrFilePathFromFileName(String filename) async {
  if (filename.endsWith('.$ccrTemplateExtension')) {
    filename = filename.substring(
        0, filename.length - (ccrTemplateExtension.length + 1));
  }
  final directory = await CCRDirectory.templates();
  final filepath = '${directory.path}/$filename.$ccrTemplateExtension';

  return filepath;
}

Future<void> ccrSaveAsTemplate(BuildContext context, Template template,
    [String? filename = '']) async {
  if ((filename == null) || (filename == '')) {
    filename = await ccrFileNameFromTemplate(template);
  }

  final String filepath = await ccrFilePathFromFileName(filename);

  if (!context.mounted) return;
  final templateEditorStore =
      Provider.of<TemplateEditorStore>(context, listen: false);
  templateEditorStore.saveTemplate(context, template, filepath);
}
