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

import 'package:ccrchecklist/data/checklist_check.dart';
import 'package:ccrchecklist/store/checklist_editor_store.dart';
import 'package:ccrchecklist/widget/checklist_complete_linearity_check_widget.dart';
import 'package:ccrchecklist/widget/checklist_linearity_step1_check_widget.dart';
import 'package:ccrchecklist/widget/checklist_linearity_step2_check_widget.dart';
import 'package:ccrchecklist/widget/checklist_regular_check_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CheckListCheckList extends StatelessWidget {
  final int sectionIndex;

  const CheckListCheckList({super.key, required this.sectionIndex});

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);

    return Expanded(
      child: Observer(
        builder: (_) => ListView.separated(
          itemCount: checklistEditorStore.checks[sectionIndex].length,
          itemBuilder: (context, index) {
            var check = checklistEditorStore.checks[sectionIndex][index];
            if (check is ChecklistRegularCheck) {
              return ChecklistRegularCheckWidget(
                  sectionIndex: sectionIndex, checkIndex: index);
            } else if (check is ChecklistCompleteLinearityCheck) {
              return ChecklistCompleteLinearityCheckWidget(
                  sectionIndex: sectionIndex, checkIndex: index);
            } else if (check is ChecklistLinearityStep1Check) {
              return ChecklistLinearityStep1CheckWidget(
                  sectionIndex: sectionIndex, checkIndex: index);
            } else if (check is ChecklistLinearityStep2Check) {
              return ChecklistLinearityStep2CheckWidget(
                  sectionIndex: sectionIndex, checkIndex: index);
            } else {
              throw Exception('Unknown check type');
            }
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
