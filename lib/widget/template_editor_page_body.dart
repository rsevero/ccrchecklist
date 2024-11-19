// CCR Checklist - a checklist app for rebreather users
// Copyright (C) 2024  Rodrigo Severo
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:ccrchecklist/misc/constants.dart';
import 'package:ccrchecklist/misc/flutter_extension_methods.dart';
import 'package:ccrchecklist/store/template_editor_store.dart';
import 'package:ccrchecklist/widget/template_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TemplateEditorPageBody extends StatelessWidget {
  const TemplateEditorPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final templateEditorStore = Provider.of<TemplateEditorStore>(context);
    final theme = context.ccrThemeExtension;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(
            builder: (_) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.inverseSurface,
                        borderRadius: ccrTemplateListTileBorderRadius,
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            templateEditorStore
                                .currentTemplate.rebreatherManufacturer,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w300,
                              color: theme.onInverseSurface,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            templateEditorStore.currentTemplate.rebreatherModel,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                              color: theme.onInverseSurface,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            templateEditorStore.currentTemplate.title,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                              color: theme.onInverseSurface,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            templateEditorStore.currentTemplate.description,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                              color: theme.onInverseSurface,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Center(
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
      ),
    );
  }
}
