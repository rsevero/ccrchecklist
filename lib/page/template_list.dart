import 'package:ccr_checklist/store/template_editor.dart';
import 'package:flutter/material.dart';
import 'package:ccr_checklist/page/template_editor.dart';
import 'package:provider/provider.dart';

class TemplateListPage extends StatelessWidget {
  const TemplateListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final templateEditorStore = Provider.of<TemplateEditorStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CCR Checklist Templates'),
        elevation: 4,
      ),
      body: ListView.builder(
        itemCount: templateEditorStore.templates.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(templateEditorStore.templates[index].title),
            subtitle: Text(templateEditorStore.templates[index].description),
            onTap: () {
              // Handle template selection, if necessary
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createNewTemplate(context),
        tooltip: 'Create new template',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _createNewTemplate(BuildContext context) async {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);

    final TextEditingController rebreatherModelController =
        TextEditingController();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    bool confirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('New Template'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    TextField(
                      controller: rebreatherModelController,
                      decoration: const InputDecoration(
                          hintText: 'Template Rebreather model'),
                    ),
                    TextField(
                      controller: titleController,
                      decoration:
                          const InputDecoration(hintText: 'Template Title'),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                          hintText: 'Template Description'),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context)
                        .pop(false); // Dismiss and return false
                  },
                ),
                TextButton(
                  child: const Text('Create'),
                  onPressed: () {
                    Navigator.of(context).pop(true); // Dismiss and return true
                  },
                ),
              ],
            );
          },
        ) ??
        false; // Handle null (dialog dismissed)

    if (confirmed) {
      templateEditorStore.addNewTemplate(
          rebreatherModel: rebreatherModelController.text,
          title: titleController.text,
          description: descriptionController.text);
      if (!context.mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const TemplateEditorPage(),
        ),
      );
    }

    if (!context.mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TemplateEditorPage(),
      ),
    );
  }
}
