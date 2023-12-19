import 'dart:io';
import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
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

Future<bool> ccrSaveTemplate(
    {required BuildContext context,
    required Template template,
    required String? fileName,
    required Function(BuildContext, Template) onChooseAnother}) async {
  // If fileName is null, user cancelled the dialog
  if (fileName == null || fileName.isEmpty) return false;

  final directory = await ccrGetTemplatesDirectory();

  // Remove default extension if present
  if (fileName.endsWith('.$ccrTemplateExtension')) {
    fileName = fileName.substring(
        0, fileName.length - (ccrTemplateExtension.length + 1));
  }

  final filePath = '${directory.path}/$fileName.$ccrTemplateExtension';

  File file = File(filePath);
  if (await file.exists()) {
    if (!context.mounted) return false;
    final action = await ccrShowFileExistsDialog(context, fileName);
    switch (action) {
      case CCRFileExistsAction.replace:
        if (!context.mounted) return false;
        await ccrSaveFile(context, template, file);
        break;
      case CCRFileExistsAction.chooseAnother:
        if (!context.mounted) return false;
        onChooseAnother(context, template);
        break;
      case CCRFileExistsAction.cancel:
      default:
        return false;
    }
  } else {
    if (!context.mounted) return false;
    await ccrSaveFile(context, template, file);
  }

  return true;
}

Future<bool> ccrSaveFile(
    BuildContext context, Template template, File file) async {
  try {
    template = template.copyWith(filename: file.path);
    String jsonTemplate = template.toJson().toString();
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

Future<CCRFileExistsAction?> ccrShowFileExistsDialog(
    BuildContext context, String fileName) async {
  return await showDialog<CCRFileExistsAction>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('File "$fileName" already exists'),
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

Future<bool> ccrSaveAsTemplate(BuildContext context, Template template) async {
  // Prompt user for file name
  final String? fileName = await ccrPromptFileName(context);

  if (!context.mounted) return false;
  return await ccrSaveTemplate(
    context: context,
    fileName: fileName,
    onChooseAnother: ccrSaveAsTemplate,
    template: template,
  );
}
