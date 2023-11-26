import 'dart:convert';
import 'dart:io';
import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/data/template_section.dart';
import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/store/template_editor.dart';
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
            "Editing ${templateEditorStore.currentTemplate.rebreatherModel} - ${templateEditorStore.currentTemplate.title}"),
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
                templateEditorStore.currentTemplate
                    .description, // Assuming this is where the description is stored.
                style: const TextStyle(
                  fontSize: 18.0, // Larger font size
                  fontWeight: FontWeight.w700, // Make it bold
                  color: Colors.blueGrey, // Optional: Change the color
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
              builder: (_) => ListView.builder(
                itemCount: templateEditorStore.currentTemplate.sections.length,
                itemBuilder: (context, index) {
                  final section =
                      templateEditorStore.currentTemplate.sections[index];
                  return ListTile(
                    title: Text(section.title),
                    onTap: () => _editSection(context, section),
                    subtitle: Column(
                      children: section.checks.map((check) {
                        return ListTile(
                          title: Text(check.type),
                          onTap: () => _editCheck(context, check),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        tooltip: 'Add Options',
        children: [
          SpeedDialChild(
            child: const Icon(Icons.add),
            label: 'Add New Section',
            onTap: () => _addNewSection(context),
          ),
          SpeedDialChild(
            child: const Icon(Icons.check),
            label: 'Add Regular Check',
            onTap: () {
              // Implement action
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.check_circle),
            label: 'Add "With Reference" Check',
            onTap: () {
              // Implement action
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.linear_scale_rounded),
            label: 'Add Linearity Step 1 Check',
            onTap: () {
              // Implement action
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.linear_scale),
            label: 'Add Linearity Step 2 Check',
            onTap: () {
              // Implement action
            },
          ),
        ],
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

  void _addNewSection(BuildContext context) async {
    final TextEditingController titleController = TextEditingController();

    // Show a dialog to enter the section title
    bool confirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('New Section'),
              content: TextField(
                controller: titleController,
                decoration: const InputDecoration(hintText: 'Enter title here'),
                autofocus: true,
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
      templateEditorStore
          .addNewSection(title: titleController.text, checks: []);
    }
  }

  void _editSection(BuildContext context, TemplateSection section) {}

  void _editCheck(BuildContext context, TemplateCheck check) {
    // Navigation logic for editing checks
  }
}
