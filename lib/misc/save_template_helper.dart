import 'dart:io';
import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/misc/ccr_directory_helper.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
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
