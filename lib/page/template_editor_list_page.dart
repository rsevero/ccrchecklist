import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/misc/helper_functions.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
import 'package:ccr_checklist/widget/template_list.dart';
import 'package:flutter/material.dart';
import 'package:ccr_checklist/page/template_editor_page.dart';
import 'package:provider/provider.dart';

class TemplateEditorListPage extends StatelessWidget {
  const TemplateEditorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist Templates'),
        elevation: 4,
      ),
      body: TemplateList(
        isEditor: true,
        onTapTemplateFile: _onTapTemplateFile,
        onRemoveTemplateFile: _onRemoveTemplateFile,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewTemplate(context),
        tooltip: 'Create New Template',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _onRemoveTemplateFile(BuildContext context, int index) async {
    final templateListStore =
        Provider.of<TemplateListStore>(context, listen: false);

    // Show confirmation dialog
    final bool confirm = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm Removal'),
              content:
                  const Text('Are you sure you want to remove this template?'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Remove'),
                  onPressed: () => Navigator.of(context)
                      .pop(true), // Dismiss dialog and return true
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context)
                      .pop(false), // Dismiss dialog and return false
                ),
              ],
            );
          },
        ) ??
        false; // If dialog is dismissed without any action, consider as false (do not remove)

    // If confirmation received, remove the template
    if (confirm) {
      await templateListStore.removeTemplate(index);
    }
  }

  Future<void> _onTapTemplateFile(BuildContext context, int index) async {
    final templateListStore =
        Provider.of<TemplateListStore>(context, listen: false);
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    final template = await templateListStore
        .getTemplate(templateListStore.defaultTemplates[index]);

    templateEditorStore.setCurrentTemplate(
        template, templateListStore.defaultTemplates[index].isAsset);

    if (!context.mounted) return;
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TemplateEditorPage(),
      ),
    );

    templateListStore.update();
  }

  void _addNewTemplate(BuildContext context) async {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController rebreatherManufacturerController =
        TextEditingController();
    final TextEditingController rebreatherModelController =
        TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController fileNameController = TextEditingController();

    bool confirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('New Template'),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: fileNameController,
                      decoration: const InputDecoration(hintText: 'File name'),
                      autofocus: true,
                    ),
                    TextField(
                      controller: rebreatherManufacturerController,
                      decoration: const InputDecoration(
                          hintText: 'Rebreather manufacturer'),
                      textInputAction: TextInputAction
                          .next, // Move focus to next input on "Enter"
                      onSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(FocusNode()), // Optional
                    ),
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
      final fileName = fileNameController.text.trim();
      final rebreatherManufacturer =
          rebreatherManufacturerController.text.trim();
      final rebreatherModel = rebreatherModelController.text.trim();
      final title = titleController.text.trim();
      final description = descriptionController.text.trim();
      if (fileName.isNotEmpty &&
          rebreatherManufacturer.isNotEmpty &&
          rebreatherModel.isNotEmpty &&
          title.isNotEmpty) {
        var newTemplate = Template(
          rebreatherManufacturer: rebreatherManufacturer,
          rebreatherModel: rebreatherModel,
          title: title,
          description: description,
          sections: [],
        );
        if (!context.mounted) return;
        await ccrSaveAsTemplate(
            context, newTemplate, fileNameController.text.trim());

        if (!context.mounted) return;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TemplateEditorPage(),
          ),
        );
      }
    }
  }
}
