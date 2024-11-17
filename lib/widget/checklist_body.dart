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

import 'package:ccrchecklist/misc/flutter_extension_methods.dart';
import 'package:ccrchecklist/store/checklist_editor_store.dart';
import 'package:ccrchecklist/widget/checklist_checklist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ChecklistBody extends StatelessWidget {
  final int sectionIndex;

  const ChecklistBody({
    super.key,
    required this.sectionIndex,
  });

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final section = checklistEditorStore.sections[sectionIndex];
    final paddingSize = (context.textTheme.titleLarge?.fontSize ?? 22.0) * 0.75;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (checklistEditorStore.sections.length > 1) ...[
          Observer(
            builder: (_) => Container(
              width: double.infinity,
              padding: EdgeInsets.all(paddingSize),
              decoration: BoxDecoration(
                color: checklistEditorStore.sectionsOk[sectionIndex]
                    ? context.ccrThemeExtension.primary
                    : context.ccrThemeExtension.error,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Text(
                "${section.title} - ${sectionIndex + 1}/${checklistEditorStore.sections.length}",
                style: context.textTheme.titleLarge?.copyWith(
                  color: checklistEditorStore.sectionsOk[sectionIndex]
                      ? context.ccrThemeExtension.onPrimary
                      : context.ccrThemeExtension.onError,
                ),
              ),
            ),
          ),
        ],
        CheckListCheckList(sectionIndex: sectionIndex),
      ],
    );
  }
}
