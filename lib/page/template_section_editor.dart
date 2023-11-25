import 'package:ccr_checklist/data/template_section.dart';
import 'package:ccr_checklist/store/template_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TemplateSectionEditorPage extends StatelessWidget {
  const TemplateSectionEditorPage({super.key});

  void _addSection(BuildContext context, TemplateSection newSection) {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    // templateEditorStore
    //     .addNewSection(title: _titleController.text, checks: []);

    Navigator.pop(context);
  }

  void _cancelEditing(BuildContext context) {
    // Just pop the page without saving
    Navigator.pop(context);
  }

  void _deleteSection(BuildContext context) {
    // Implement delete logic
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final templateEditorStore = Provider.of<TemplateEditorStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sections'),
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                  itemCount: templateEditorStore.sections.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(templateEditorStore.sections[index].title),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _showEditDialog(
                            context, templateEditorStore, index),
                      ),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => templateEditorStore
                  .addNewSection(title: 'New Section', checks: []),
              child: const Text('Add Section'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context,
      TemplateEditorStore templateEditorStore, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTitle = templateEditorStore.sections[index].title;
        return AlertDialog(
          title: const Text('Edit Section Title'),
          content: TextField(
            onChanged: (value) => newTitle = value,
            controller: TextEditingController(
                text: templateEditorStore.sections[index].title),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                templateEditorStore.updateSectionTitle(index, newTitle);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
