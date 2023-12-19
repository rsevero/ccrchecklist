import 'dart:convert';
import 'dart:io';
import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/misc/ccr_file_for_save_template.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

String ccrFormatSecondsToMinutesSecondsTimer(int totalSeconds) {
  if (totalSeconds < 0) {
    return "Invalid Input"; // Handle negative input
  }

  if (totalSeconds == 0) {
    return ccrNoTimer; // Handle 0 input
  }

  // Formatting the output, e.g., "2:30"
  final String formattedTime =
      "${ccrFormatSecondsToMinutesSeconds(totalSeconds)}s";

  return formattedTime;
}

String ccrFormatSecondsToMinutesSeconds(int totalSeconds) {
  if (totalSeconds < 0) {
    return "Invalid Input"; // Handle negative input
  }

  if (totalSeconds == 0) {
    return ccrNoTimer; // Handle 0 input
  }

  int minutes = totalSeconds ~/ 60; // Integer division to get minutes
  int seconds = totalSeconds % 60; // Remainder to get seconds

  // Formatting the output, e.g., "2:30"
  String formattedTime =
      "${minutes.toString().padLeft(1, '0')}:${seconds.toString().padLeft(2, '0')}";

  return formattedTime;
}

Map<int, double> ccrCreateAndInitializeReferencesMap(int numberOfEntries) {
  Map<int, double> myMap = {};

  for (int i = 0; i < numberOfEntries; i++) {
    myMap[i] = 0.0;
  }

  return myMap;
}

Future<Directory> ccrGetTemplatesDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  final templateDirectory =
      Directory('${directory.path}/$ccrDirectory/$ccrTemplatesDirectory');

  // Ensure the directory exists
  templateDirectory.createSync(recursive: true);

  return templateDirectory;
}

Future<Directory> ccrGetSharedDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  final sharedDirectory =
      Directory('${directory.path}/$ccrDirectory/$ccrShareDirectory');

  // Ensure the directory exists
  sharedDirectory.createSync(recursive: true);

  return sharedDirectory;
}

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
            onPressed: () => Navigator.of(context).pop(fileNameController.text),
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

Future<bool> ccrSaveTemplateFile(
    BuildContext context, Template template, File file) async {
  try {
    template = template.copyWith(path: file.path);
    String jsonTemplate = jsonEncode(template.toJson());
    await file.writeAsString(jsonTemplate);

    if (!context.mounted) return false;
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    templateEditorStore.setCurrentTemplate(template);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Template "${file.path}" saved successfully!'),
        backgroundColor: Colors.green,
      ),
    );
    return true;
  } catch (e) {
    if (!context.mounted) return false;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Failed to save template: $e'),
        backgroundColor: Colors.red,
      ),
    );
    return false;
  }
}

Future<CCRFileForSaveTemplate> ccrFileFromFilename(String? fileName) async {
  if (fileName == null || fileName.isEmpty) {
    return CCRFileForSaveTemplate(File(''), '');
  }

  // Remove default extension if present
  if (fileName.endsWith('.$ccrTemplateExtension')) {
    fileName = fileName.substring(
        0, fileName.length - (ccrTemplateExtension.length + 1));
  }

  final directory = await ccrGetTemplatesDirectory();
  final filePath = '${directory.path}/$fileName.$ccrTemplateExtension';

  File file = File(filePath);

  CCRFileForSaveTemplate result = CCRFileForSaveTemplate(file, fileName);

  return result;
}

Future<CCRFileForSaveTemplate> ccrGetFileForSaveAsTemplate(
    BuildContext context, String? fileName) async {
  if ((fileName == null) || fileName.isEmpty) {
    fileName = await ccrPromptFileName(context);
  }

  return await ccrFileFromFilename(fileName);
}

Future<bool> ccrSaveAsTemplate({
  required BuildContext context,
  required Template template,
  String fileName = '',
}) async {
  var result = await ccrGetFileForSaveAsTemplate(context, fileName);
  if (result.file.path == '') {
    return false;
  }

  fileExistsLoop:
  while (await result.file.exists()) {
    if (!context.mounted) return false;
    final action = await ccrShowFileExistsDialog(context, result.filename);
    switch (action) {
      case CCRFileExistsAction.replace:
        break fileExistsLoop;
      case CCRFileExistsAction.chooseAnother:
        if (!context.mounted) return false;
        result = await ccrGetFileForSaveAsTemplate(context, '');
        if (result.file.path == '') {
          return false;
        }
        break;
      case CCRFileExistsAction.cancel:
      default:
        return false;
    }
  }

  if (!context.mounted) return false;
  await ccrSaveTemplateFile(context, template, result.file);

  if (!context.mounted) return false;
  final templateListStore =
      Provider.of<TemplateListStore>(context, listen: false);
  final templateEditorStore =
      Provider.of<TemplateEditorStore>(context, listen: false);
  final currentTemplate = templateEditorStore.currentTemplate;

  final templateIndex = templateListStore.addNewTemplate(
    path: currentTemplate.path,
    title: currentTemplate.title,
    rebreatherManufacturer: currentTemplate.rebreatherManufacturer,
    rebreatherModel: currentTemplate.rebreatherModel,
    description: currentTemplate.description,
  );
  templateEditorStore.setCurrentTemplateIndex(templateIndex);

  return true;
}

Future<bool> ccrSaveTemplate({
  required BuildContext context,
  required Template template,
  required String? filePath,
}) async {
  if (filePath == null || filePath.isEmpty) {
    return false;
  }

  // Remove default extension if present
  if (filePath.endsWith('.$ccrTemplateExtension')) {
    filePath = filePath.substring(
        0, filePath.length - (ccrTemplateExtension.length + 1));
  }
  filePath = '$filePath.$ccrTemplateExtension';

  File file = File(filePath);

  if (!context.mounted) return false;
  await ccrSaveTemplateFile(context, template, file);

  if (!context.mounted) return false;
  final templateListStore =
      Provider.of<TemplateListStore>(context, listen: false);
  final templateEditorStore =
      Provider.of<TemplateEditorStore>(context, listen: false);
  final currentTemplate = templateEditorStore.currentTemplate;
  templateListStore.updateTemplate(
      templateIndex: templateEditorStore.currentTemplateIndex,
      rebreatherManufacturer: currentTemplate.rebreatherManufacturer,
      rebreatherModel: currentTemplate.rebreatherModel,
      title: currentTemplate.title,
      description: currentTemplate.description);

  return true;
}
