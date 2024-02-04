import 'dart:io';
import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/misc/ccr_directory_helper.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<CCRFileExistsAction?> ccrShowFileExistsDialog(
    BuildContext context, String filepath) async {
  return await showDialog<CCRFileExistsAction>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('File "$filepath" already exists'),
        content: const Text(
            'Do you want to replace it, choose another name, or cancel?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Replace'),
            onPressed: () =>
                Navigator.of(context).pop(CCRFileExistsAction.replace),
          ),
          TextButton(
            child: const Text('Choose another'),
            onPressed: () =>
                Navigator.of(context).pop(CCRFileExistsAction.chooseAnother),
          ),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () =>
                Navigator.of(context).pop(CCRFileExistsAction.cancel),
          ),
        ],
      );
    },
  );
}

Future<String?> ccrPromptFileName(BuildContext context) async {
  return await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      final TextEditingController fileNameController = TextEditingController();
      return AlertDialog(
        title: const Text('Enter File Name'),
        content: TextField(
          controller: fileNameController,
          decoration: const InputDecoration(hintText: 'File name'),
          autofocus: true,
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Save'),
            onPressed: () =>
                Navigator.of(context).pop(fileNameController.text.trim()),
          ),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}

Future<String> ccrFilePathFromFileName(String fileName) async {
  if (fileName.endsWith('.$ccrTemplateExtension')) {
    fileName = fileName.substring(
        0, fileName.length - (ccrTemplateExtension.length + 1));
  }
  final directory = await CCRDirectory.templates();
  final filePath = '${directory.path}/$fileName.$ccrTemplateExtension';

  return filePath;
}

Future<void> ccrSaveAsTemplate(BuildContext context, Template template,
    [String? fileName = '']) async {
  if ((fileName == null) || (fileName == '')) {
    fileName = await ccrPromptFileName(context);
  }

  if ((fileName == null) || (fileName == '')) {
    return;
  }

  String filePath = await ccrFilePathFromFileName(fileName);
  File file = File(filePath);

  fileExistsLoop:
  while (await file.exists()) {
    if (!context.mounted) return;
    final action = await ccrShowFileExistsDialog(context, fileName!);
    switch (action) {
      case CCRFileExistsAction.replace:
        break fileExistsLoop;
      case CCRFileExistsAction.chooseAnother:
        if (!context.mounted) return;
        fileName = await ccrPromptFileName(context);
        if ((fileName == null) || (fileName == '')) {
          return;
        }
        filePath = await ccrFilePathFromFileName(fileName);
        file = File(filePath);
        break;
      case CCRFileExistsAction.cancel:
      default:
        return;
    }
  }

  if (!context.mounted) return;
  final templateEditorStore =
      Provider.of<TemplateEditorStore>(context, listen: false);
  templateEditorStore.saveTemplate(context, template, filePath);
}
