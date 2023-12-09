import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TemplateCheckWidget extends StatelessWidget {
  final TemplateCheck check;
  final int index;

  final TemplateEditorStore templateEditorStore;

  const TemplateCheckWidget({
    super.key,
    required this.check,
    required this.index,
    required this.templateEditorStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        String title = check.description;
        if ((check is TemplateWithReferenceCheck) ||
            (check is TemplateLinearityStep1Check)) {
          int referenceCount;
          if (check is TemplateWithReferenceCheck) {
            referenceCount =
                (check as TemplateWithReferenceCheck).referenceCount;
          } else {
            referenceCount =
                (check as TemplateLinearityStep1Check).referenceCount;
          }
          title = '$title (Ref count: $referenceCount)';
        }
        return ListTile(
          key: ValueKey(index),
          title: Text(title),
          trailing: PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'Edit':
                  _editTemplateCheck(context, templateEditorStore, index);
                  break;
                case 'Delete':
                  templateEditorStore.deleteCheck(check);
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Edit',
                child: Text('Edit'),
              ),
              const PopupMenuItem<String>(
                value: 'Delete',
                child: Text('Delete'),
              ),
              // Add menu item for 'Drag' if needed
            ],
          ),
        );
      },
    );
  }

  void _editTemplateCheck(BuildContext context,
      TemplateEditorStore templateEditorStore, int index) {
    final TextEditingController titleController = TextEditingController();
    final check = templateEditorStore.checks[index];
    titleController.text = check.description;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Section'),
          content: TextFormField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Enter section title'),
            autofocus: true,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                final String newTitle = titleController.text;
                if (newTitle.isNotEmpty) {
                  templateEditorStore.updateSectionTitle(index, newTitle);
                  Navigator.of(context).pop();
                }
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
}
