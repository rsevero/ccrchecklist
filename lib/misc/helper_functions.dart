import 'dart:io';
import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/page/checklist_page.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
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
  final directory = await ccrGetTemplatesDirectory();
  final filePath = '${directory.path}/$fileName.$ccrTemplateExtension';

  return filePath;
}

Future<Directory> ccrGetTemplatesDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  final templateDirectory =
      Directory('${directory.path}/$ccrDirectory/$ccrTemplatesDirectory');

  // Ensure the directory exists
  templateDirectory.createSync(recursive: true);

  return templateDirectory;
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

void navigateToSection(BuildContext context, int newSectionIndex) {
  final checklistEditorStore =
      Provider.of<ChecklistEditorStore>(context, listen: false);
  final totalSections = checklistEditorStore.sections.length;

  if ((newSectionIndex >= 0) && (newSectionIndex < totalSections)) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ChecklistPage(sectionIndex: newSectionIndex),
      ),
    );
  }
}
