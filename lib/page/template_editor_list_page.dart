import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
import 'package:flutter/material.dart';
import 'package:ccr_checklist/page/template_editor_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TemplateEditorListPage extends StatelessWidget {
  const TemplateEditorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final templateListStore = Provider.of<TemplateListStore>(context);
    final templateEditorStore = Provider.of<TemplateEditorStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CCR Checklist Templates'),
        elevation: 4,
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: templateListStore.templates.length,
          itemBuilder: (context, index) {
            return Observer(
              builder: (_) => ListTile(
                title: Text(
                    "${templateListStore.templates[index].rebreatherModel} - ${templateListStore.templates[index].title}"),
                subtitle: Text(templateListStore.templates[index].description),
                onTap: () {
                  templateEditorStore
                      .setCurrentTemplate(templateListStore.templates[index]);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TemplateEditorPage(),
                    ),
                  );
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
    final templateListStore =
        Provider.of<TemplateListStore>(context, listen: false);
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
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: rebreatherModelController,
                      decoration:
                          const InputDecoration(hintText: 'Rebreather model'),
                      autofocus: true,
                      textInputAction: TextInputAction
                          .next, // Move focus to next input on "Enter"
                      onSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(FocusNode()), // Optional
                    ),
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(hintText: 'Title'),
                      textInputAction: TextInputAction
                          .next, // Move focus to next input on "Enter"
                      onSubmitted: (_) => FocusScope.of(context)
                          .nextFocus(), // Move focus to next input
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration:
                          const InputDecoration(hintText: 'Description'),
                      textInputAction:
                          TextInputAction.done, // Done action for last input
                      onSubmitted: (_) => Navigator.of(context)
                          .pop(true), // Activate "Create" method on "Enter"
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Create'),
                  onPressed: () => Navigator.of(context)
                      .pop(true), // Dismiss and return true
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context)
                      .pop(false), // Dismiss and return false
                ),
              ],
            );
          },
        ) ??
        false; // Handle null (dialog dismissed)

    if (confirmed) {
      final newTemplate = templateListStore.addNewTemplate(
          rebreatherModel: rebreatherModelController.text,
          title: titleController.text,
          description: descriptionController.text);
      templateEditorStore.setCurrentTemplate(newTemplate);
      if (!context.mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const TemplateEditorPage(),
        ),
      );
    }

    // if (!context.mounted) return;
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const TemplateEditorPage(),
    //   ),
    // );
  }
}
