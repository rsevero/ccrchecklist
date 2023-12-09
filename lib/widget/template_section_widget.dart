import 'package:ccr_checklist/data/template_section.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/theme/main_theme.dart';
import 'package:ccr_checklist/widget/template_check_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TemplateSectionWidget extends StatelessWidget {
  final TemplateSection section;
  final int index;
  final TemplateEditorStore templateEditorStore;

  const TemplateSectionWidget({
    super.key,
    required this.section,
    required this.index,
    required this.templateEditorStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final isSelected = (index == templateEditorStore.selectedSectionIndex);
        return Container(
          color: isSelected
              ? mainColorScheme.primaryContainer
              : Colors.transparent,
          child: ExpansionTile(
            title: Text(section.title),
            // controller: expansionTileController,
            controlAffinity: ListTileControlAffinity.leading,
            trailing: Builder(builder: (context) {
              templateEditorStore.setSectionExpansionTileController(
                  index, ExpansionTileController.of(context));
              return PopupMenuButton<String>(
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Edit',
                    child: Text('Edit'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Delete',
                    child: Text('Delete'),
                  ),
                ],
                onSelected: (value) {
                  switch (value) {
                    case 'Edit':
                      _editTemplateSection(context, templateEditorStore, index);
                      break;
                    case 'Delete':
                      templateEditorStore.deleteSection(index);
                      break;
                  }
                },
              );
            }),
            onExpansionChanged: (value) => onExpansionChangedSection(value),
            initiallyExpanded: templateEditorStore.sectionsIsExpanded[index],
            children: [
              TemplateCheckListWidget(
                  sectionIndex: index,
                  templateEditorStore: templateEditorStore),
            ],
          ),
        );
      },
    );
  }

  void _editTemplateSection(BuildContext context,
      TemplateEditorStore templateEditorStore, int index) {
    final TextEditingController titleController = TextEditingController();
    final section = templateEditorStore.sections[index];
    titleController.text = section.title;

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

  void onExpansionChangedSection(bool value) {
    print("-> onExpansionChangedSection index $index: $value\n");
    templateEditorStore.setSectionIsExpansion(index, value);
  }
}
