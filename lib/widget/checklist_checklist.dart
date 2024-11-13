import 'package:ccr_checklist/data/checklist_check.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/widget/checklist_complete_linearity_check_widget.dart';
import 'package:ccr_checklist/widget/checklist_linearity_step1_check_widget.dart';
import 'package:ccr_checklist/widget/checklist_linearity_step2_check_widget.dart';
import 'package:ccr_checklist/widget/checklist_regular_check_widget.dart';
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
