import 'package:ccr_checklist/data/checklist_check.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChecklistRegularCheckWidget extends StatelessWidget {
  final int sectionIndex;
  final int checkIndex;
  final BuildContext context;

  const ChecklistRegularCheckWidget(
      {super.key,
      required this.context,
      required this.sectionIndex,
      required this.checkIndex});

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final check = checklistEditorStore.checks[sectionIndex][checkIndex]
        as ChecklistRegularCheck;

    return CheckboxListTile(
      title: Text(check.description),
      value: check.isChecked,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool? value) {
        if (value != null) {
          checklistEditorStore.setCheckIsChecked(
              sectionIndex, checkIndex, value);
        }
      },
    );
  }
}
