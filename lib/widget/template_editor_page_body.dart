import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/widget/template_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TemplateEditorPageBody extends StatelessWidget {
  const TemplateEditorPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final templateEditorStore = Provider.of<TemplateEditorStore>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Observer(
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      templateEditorStore.currentTemplate.title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Center(
                    child: Text(
                      templateEditorStore.currentTemplate.description,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
          child: Text(
            'Pages',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Observer(
            builder: (_) => ReorderableListView.builder(
              buildDefaultDragHandles: false,
              shrinkWrap: true,
              itemCount: templateEditorStore.sections.length,
              itemBuilder: (context, index) {
                return Observer(
                  key: ObjectKey(templateEditorStore.sections[index]),
                  builder: (_) {
                    final section = templateEditorStore.sections[index];

                    return TemplateSectionWidget(
                      section: section,
                      sectionIndex: index,
                    );
                  },
                );
              },
              onReorder: (oldSectionIndex, newSectionIndex) =>
                  templateEditorStore.moveSection(
                      oldSectionIndex, newSectionIndex),
            ),
          ),
        ),
      ],
    );
  }
}
