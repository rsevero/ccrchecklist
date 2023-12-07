import 'package:ccr_checklist/data/template_section.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/theme/main_theme.dart';
import 'package:flutter/material.dart';

class TemplateSectionWidget extends StatelessWidget {
  final TemplateSection section;
  final int index;
  final TemplateEditorStore templateEditorStore;
  final bool isExpanded;
  final bool isSelected;
  final Function(bool)? onExpansionChanged;

  const TemplateSectionWidget({
    super.key,
    required this.section,
    required this.index,
    required this.templateEditorStore,
    this.isExpanded = false,
    this.isSelected = false,
    this.onExpansionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor:
          isSelected ? mainColorScheme.primaryContainer : Colors.transparent,
      title: Text(section.title),
      controlAffinity: ListTileControlAffinity.leading,
      trailing: PopupMenuButton<String>(
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
      onExpansionChanged: onExpansionChanged,
      initiallyExpanded: isExpanded,
      children: [
        Text("Checks of section ${section.title}"),
      ],
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


// InkWell(
//                             onTap: () {
//                               templateEditorStore.onTapTemplateSection(index);
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 16.0),
//                                     child: Text(section.title),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 32,
//                                   child: PopupMenuButton<String>(
//                                     onSelected: (value) {
//                                       switch (value) {
//                                         case 'Edit':
//                                           _editTemplateSection(context,
//                                               templateEditorStore, index);
//                                           break;
//                                         case 'Delete':
//                                           templateEditorStore
//                                               .deleteTemplateSection(index);
//                                           break;
//                                       }
//                                     },
//                                     itemBuilder: (BuildContext context) =>
//                                         <PopupMenuEntry<String>>[
//                                       const PopupMenuItem<String>(
//                                         value: 'Edit',
//                                         child: Text('Edit'),
//                                       ),
//                                       const PopupMenuItem<String>(
//                                         value: 'Delete',
//                                         child: Text('Delete'),
//                                       ),
//                                       // Add menu item for 'Drag' if needed
//                                     ],
//                                   ),
//                                 ),
//                                 ReorderableDragStartListener(
//                                   index: index,
//                                   child: const Padding(
//                                     padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
//                                     child: Icon(
//                                         Icons.drag_handle), // Drag handle icon
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
