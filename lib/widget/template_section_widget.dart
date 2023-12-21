import 'package:ccr_checklist/data/template_section.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/theme/main_theme.dart';
import 'package:ccr_checklist/widget/template_check_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TemplateSectionWidget extends StatelessWidget {
  final TemplateSection section;
  final int sectionIndex;

  const TemplateSectionWidget({
    super.key,
    required this.section,
    required this.sectionIndex,
  });

  @override
  Widget build(BuildContext context) {
    final templateEditorStore = Provider.of<TemplateEditorStore>(context);

    return Observer(
      key: ValueKey(sectionIndex),
      builder: (_) {
        final isSelected =
            (sectionIndex == templateEditorStore.selectedSectionIndex);
        final isExpanded =
            (sectionIndex == templateEditorStore.sections.length - 1);
        templateEditorStore.setExpandedSectionIfUnset(sectionIndex, isExpanded);

        return Container(
          color: isSelected
              ? mainColorScheme.primaryContainer
              : Colors.transparent,
          child: Row(
            children: [
              Expanded(
                // Wrap ExpansionTile in an Expanded widget
                child: ExpansionTile(
                  title: Text(section.title),
                  onExpansionChanged: (expanded) {
                    templateEditorStore.setExpandedSection(
                        sectionIndex, expanded);
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  trailing: Builder(
                    builder: (context) {
                      return PopupMenuButton<String>(
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
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
                              _editTemplateSection(
                                  context, templateEditorStore, sectionIndex);
                              break;
                            case 'Delete':
                              templateEditorStore.deleteSection(sectionIndex);
                              break;
                          }
                        },
                      );
                    },
                  ),
                  initiallyExpanded: isExpanded,
                  children: [
                    TemplateCheckListWidget(
                      sectionIndex: sectionIndex,
                    ),
                  ],
                ),
              ),
              Observer(
                builder: (_) {
                  if ((templateEditorStore.sections.length == 1) ||
                      templateEditorStore.isSectionExpanded[sectionIndex]!) {
                    // SizedBox.shrink() is a "nothing" widget
                    return const SizedBox.shrink();
                  } else {
                    return ReorderableDragStartListener(
                      index: sectionIndex,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(Icons.drag_handle),
                      ),
                    );
                  }
                },
              ),
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
}
