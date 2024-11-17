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

import 'package:ccrchecklist/store/template_editor_store.dart';
import 'package:ccrchecklist/widget/template_check_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TemplateCheckListWidget extends StatelessWidget {
  final int sectionIndex;

  const TemplateCheckListWidget({
    super.key,
    required this.sectionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final templateEditorStore = Provider.of<TemplateEditorStore>(context);

        final checks = templateEditorStore.checks[sectionIndex];
        return ReorderableListView.builder(
          buildDefaultDragHandles: false,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: checks.length,
          itemBuilder: (context, index) {
            return TemplateCheckWidget(
              key: ValueKey(index),
              sectionIndex: sectionIndex,
              index: index,
            );
          },
          onReorder: (int oldCheckIndex, int newCheckIndex) {
            templateEditorStore.moveCheck(
                sectionIndex, oldCheckIndex, newCheckIndex);
          },
        );
      },
    );
  }
}
