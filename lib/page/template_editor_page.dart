import 'dart:convert';
import 'dart:io';
import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/misc/helper_functions.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/widget/greyable_speed_dial_child_widget.dart';
import 'package:ccr_checklist/widget/template_section_widget.dart';
import 'package:ccr_checklist/widget/undo_redo_buttons_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class TemplateEditorPage extends StatelessWidget {
  const TemplateEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final templateEditorStore = Provider.of<TemplateEditorStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${templateEditorStore.currentTemplate.rebreatherManufacturer} - ${templateEditorStore.currentTemplate.rebreatherModel}"),
        elevation: 4,
        actions: [
          Observer(
            builder: (_) {
              return UndoRedoButtonsWidget(
                canRedo: templateEditorStore.canRedo,
                canUndo: templateEditorStore.canUndo,
                redo: templateEditorStore.redo,
                undo: templateEditorStore.undo,
                redoDescription: templateEditorStore.redoDescription,
                undoDescription: templateEditorStore.undoDescription,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () =>
                _saveTemplate(context, templateEditorStore.currentTemplate),
            tooltip: 'Save Template',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Observer(
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        templateEditorStore.currentTemplate.title,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Center(
                      child: Text(
                        templateEditorStore.currentTemplate.description,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              'Sections',
              style: TextStyle(
                fontSize: 20.0, // Font size for the title
                fontWeight: FontWeight.bold, // Bold title
              ),
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) => ReorderableListView.builder(
                shrinkWrap: true,
                itemCount: templateEditorStore.sections.length,
                itemBuilder: (context, index) {
                  return Observer(
                    key: ValueKey(index),
                    builder: (_) {
                      final section = templateEditorStore.sections[index];
                      return TemplateSectionWidget(
                          section: section,
                          index: index,
                          templateEditorStore: templateEditorStore);
                    },
                  );
                },
                onReorder: (oldIndex, newIndex) =>
                    templateEditorStore.moveSection(oldIndex, newIndex),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Observer(
        builder: (_) {
          return SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            tooltip: 'Options',
            children: [
              GreyableSpeedDialChild(
                child: const Icon(Icons.linear_scale),
                text: 'Add Linearity Step 2 Check',
                isEnabled: templateEditorStore.enableLinearityStep2Creation,
                onTap: () =>
                    _onTapAddLinearityStep2Check(context, templateEditorStore),
              ),
              GreyableSpeedDialChild(
                child: const Icon(Icons.linear_scale_rounded),
                text: 'Add Linearity Step 1 Check',
                isEnabled: templateEditorStore.enableLinearityStep1Creation,
                onTap: () =>
                    _onTapAddLinearityStep1Check(context, templateEditorStore),
              ),
              GreyableSpeedDialChild(
                child: const Icon(Icons.check),
                text: 'Add Regular Check',
                isEnabled: templateEditorStore.enableCheckCreation,
                onTap: () =>
                    _onTapAddRegularCheck(context, templateEditorStore),
              ),
              GreyableSpeedDialChild(
                child: const Icon(Icons.add),
                text: 'Add New Section',
                isEnabled: true,
                onTap: () => _onTapAddNewSection(context, templateEditorStore),
              ),
              GreyableSpeedDialChild(
                child: const Icon(Icons.edit_attributes),
                text: 'Edit Template',
                isEnabled: true,
                onTap: () => _onTapEditTemplate(context, templateEditorStore),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _saveTemplate(BuildContext context, Template template) async {
    final directory = await getApplicationDocumentsDirectory();
    String fileName = "${template.rebreatherModel}_${template.title}.json";
    String filePath = '${directory.path}/$fileName';
    File file = File(filePath);

    try {
      String jsonTemplate = jsonEncode(template
          .toJson()); // Assuming your Template class has a toJson method
      await file.writeAsString(jsonTemplate);

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Template "$fileName" saved successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Handle exceptions, e.g., show an error message
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save template: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _onTapEditTemplate(
      BuildContext context, TemplateEditorStore templateEditorStore) {
    final TextEditingController rebreatherModelController =
        TextEditingController(
            text: templateEditorStore.currentTemplate.rebreatherModel);
    final TextEditingController titleController =
        TextEditingController(text: templateEditorStore.currentTemplate.title);
    final TextEditingController descriptionController = TextEditingController(
        text: templateEditorStore.currentTemplate.description);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Template'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: rebreatherModelController,
                  decoration:
                      const InputDecoration(labelText: 'Rebreather Model'),
                  autofocus: true,
                ),
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                templateEditorStore.updateTemplate(
                  rebreatherModelController.text,
                  titleController.text,
                  descriptionController.text,
                );
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onTapAddNewSection(
      BuildContext context, TemplateEditorStore templateEditorStore) async {
    final TextEditingController titleController = TextEditingController();
    final GlobalKey<FormState> formKey =
        GlobalKey<FormState>(); // Add a GlobalKey for the Form

    // Show a dialog to enter the section title
    bool confirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('New Section'),
              content: Form(
                key: formKey,
                child: TextFormField(
                  controller: titleController,
                  decoration:
                      const InputDecoration(hintText: 'Enter title here'),
                  autofocus: true,
                  onFieldSubmitted: (value) {
                    Navigator.of(context)
                        .pop(true); // Trigger when Enter is pressed
                  },
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Create'),
                  onPressed: () {
                    Navigator.of(context).pop(true); // Dismiss and return true
                  },
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    if (!context.mounted) return;
                    Navigator.of(context)
                        .pop(false); // Dismiss and return false
                  },
                ),
              ],
            );
          },
        ) ??
        false; // Handle null (dialog dismissed)

    if (confirmed) {
      templateEditorStore.addSection(title: titleController.text);
    }
  }

  void _onTapAddLinearityStep2Check(
      BuildContext context, TemplateEditorStore templateEditorStore) {
    templateEditorStore.addLinearityStep2Check();
  }

  void _onTapAddLinearityStep1Check(
      BuildContext context, TemplateEditorStore templateEditorStore) {
    int numberOfReferences = 1; // Default value

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add step 1 of Linearity Check'),
          content: StatefulBuilder(
            // Use StatefulBuilder to update the dialog's state
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                        'Amount of references'), // Label for the radio buttons
                  ),
                  ...List.generate(
                    ccrMaxReferences,
                    (index) => RadioListTile<int>(
                      title: Text('${index + 1}'),
                      value: index + 1,
                      groupValue: numberOfReferences,
                      onChanged: (int? value) {
                        if (value != null) {
                          setState(() => numberOfReferences = value);
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Create'),
              onPressed: () {
                templateEditorStore.addLinearityStep1Check(
                    referenceCount: numberOfReferences);
                Navigator.of(context).pop();
              },
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

  void _onTapAddRegularCheck(
      BuildContext context, TemplateEditorStore templateEditorStore) {
    final TextEditingController descriptionController = TextEditingController();
    int numberOfReferences = 0;
    Duration timerDuration = Duration.zero; // Default values

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Check with References'),
          content: StatefulBuilder(
            // Use StatefulBuilder to update the dialog's state
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                        hintText: 'Enter check description'),
                    autofocus: true,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                        'Amount of references'), // Label for the radio buttons
                  ),
                  ...List.generate(
                    ccrMaxReferences + 1,
                    (index) => RadioListTile<int>(
                      title: Text('$index'),
                      value: index,
                      groupValue: numberOfReferences,
                      onChanged: (int? value) {
                        if (value != null) {
                          setState(() => numberOfReferences = value);
                        }
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Set Timer Duration'),
                    subtitle: Text(formatSecondsToMinutesSecondsTimer(
                        timerDuration.inSeconds)),
                    onTap: () async {
                      final TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(
                            hour: timerDuration.inMinutes,
                            minute: timerDuration.inSeconds % 60),
                      );
                      if (pickedTime != null) {
                        setState(
                          () {
                            timerDuration = Duration(
                                minutes: pickedTime.hour,
                                seconds: pickedTime.minute);
                          },
                        );
                      }
                    },
                  ),
                ],
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Create'),
              onPressed: () {
                // Validate inputs and create check
                final description = descriptionController.text;
                if (description.isNotEmpty) {
                  templateEditorStore.addRegularCheck(
                      description: description,
                      referenceCount: numberOfReferences,
                      secondsTimer: timerDuration.inSeconds);
                  Navigator.of(context).pop();
                }
              },
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
}
