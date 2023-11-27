import 'package:ccr_checklist/store/template_editor.dart';
import 'package:flutter/material.dart';
import 'package:ccr_checklist/page/template_editor.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TemplateEditorListPage extends StatelessWidget {
  const TemplateEditorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final templateEditorStore = Provider.of<TemplateEditorStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CCR Checklist Templates'),
        elevation: 4,
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: templateEditorStore.templates.length,
          itemBuilder: (context, index) {
            return Observer(
              builder: (_) => ListTile(
                title: Text(templateEditorStore.templates[index].title),
                subtitle:
                    Text(templateEditorStore.templates[index].description),
                onTap: () {
                  // Handle template selection, if necessary
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewTemplate(context),
        tooltip: 'Create New Template',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addNewTemplate(BuildContext context) async {
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
                      decoration:
                          const InputDecoration(hintText: 'Rebreather model'),
                      autofocus: true,
                    ),
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(hintText: 'Title'),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration:
                          const InputDecoration(hintText: 'Description'),
                    ),
                  ],
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
