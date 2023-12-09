import 'dart:convert';
import 'dart:io';
import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/widget/greyable_speed_dial_child_widget.dart';
import 'package:ccr_checklist/widget/template_section_widget.dart';
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
            "${templateEditorStore.currentTemplate.rebreatherModel} - ${templateEditorStore.currentTemplate.title}"),
        elevation: 4,
        actions: [
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
              builder: (_) => Text(
                templateEditorStore.currentTemplate.description,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
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
                    templateEditorStore.moveTemplateSection(oldIndex, newIndex),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Observer(
        builder: (_) {
          return SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            tooltip: 'Add Options',
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
                child: const Icon(Icons.check_circle),
                text: 'Add "With Reference" Check',
                isEnabled: templateEditorStore.enableCheckCreation,
                onTap: () =>
                    _onTapAddWithReferenceCheck(context, templateEditorStore),
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
                onTap: () => _onTapAddNewSection(context),
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

  void _onTapAddNewSection(BuildContext context) async {
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
      if (!context.mounted) return;
      TemplateEditorStore templateEditorStore =
          Provider.of<TemplateEditorStore>(context, listen: false);
      templateEditorStore.addSection(title: titleController.text);
    }
  }

  void _onTapAddRegularCheck(
      BuildContext context, TemplateEditorStore templateEditorStore) async {
    final TextEditingController descriptionController = TextEditingController();

    bool confirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Add Regular Check'),
              content: TextFormField(
                controller: descriptionController,
                decoration:
                    const InputDecoration(hintText: 'Enter check description'),
                autofocus: true,
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Create'),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ],
            );
          },
        ) ??
        false;

    if (confirmed) {
      templateEditorStore.addRegularCheck(
          description: descriptionController.text);
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
                    5,
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
                templateEditorStore.addLinearityStep1Check(numberOfReferences);
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

  void _onTapAddWithReferenceCheck(
      BuildContext context, TemplateEditorStore templateEditorStore) {
    final TextEditingController descriptionController = TextEditingController();
    int numberOfReferences = 1; // Default value

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
                    5,
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
                // Validate inputs and create check
                final description = descriptionController.text;
                if (description.isNotEmpty) {
                  templateEditorStore.addWithReferenceCheck(
                      description, numberOfReferences);
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
