import 'dart:ui';

import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/data/template_section.dart';
import 'package:ccr_checklist/page/template_section_editor.dart';
import 'package:ccr_checklist/store/template_editor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TemplateEditorPage extends StatelessWidget {
  const TemplateEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final templateEditorStore = Provider.of<TemplateEditorStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Editing ${templateEditorStore.template.rebreatherModel} - ${templateEditorStore.template.title}"),
        elevation: 4,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              templateEditorStore.template
                  .description, // Assuming this is where the description is stored.
              style: const TextStyle(
                fontSize: 18.0, // Larger font size
                fontWeight: FontWeight.w700, // Make it bold
                color: Colors.blueGrey, // Optional: Change the color
              ),
              textAlign: TextAlign.left,
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
            child: ListView.builder(
              itemCount: templateEditorStore.template.sections.length,
              itemBuilder: (context, index) {
                final section = templateEditorStore.template.sections[index];
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewSection(context),
        tooltip: 'Create New Section',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addNewSection(BuildContext context) async {
    final TextEditingController titleController = TextEditingController();

    // Show a dialog to enter the section title
    bool confirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('New Section Title'),
              content: TextField(
                controller: titleController,
                decoration: const InputDecoration(hintText: 'Enter title here'),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    if (!context.mounted) return;
                    Navigator.of(context)
                        .pop(false); // Dismiss and return false
                  },
                ),
                TextButton(
                  child: const Text('Create'),
                  onPressed: () {
                    if (!context.mounted) return;
                    Navigator.of(context).pop(true); // Dismiss and return true
                  },
                ),
              ],
            );
          },
        ) ??
        false; // Handle null (dialog dismissed)

    if (confirmed) {
      TemplateEditorStore templateEditorStore =
          Provider.of<TemplateEditorStore>(context, listen: false);
      templateEditorStore
          .addNewSection(title: titleController.text, checks: []);
      if (!context.mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TemplateSectionEditorPage(),
        ),
      );
    }
  }

  void _editSection(BuildContext context, TemplateSection section) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TemplateSectionEditorPage(),
      ),
    );
  }

  void _editCheck(BuildContext context, TemplateCheck check) {
    // Navigation logic for editing checks
  }
}
