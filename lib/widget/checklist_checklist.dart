import 'package:ccr_checklist/store/checklist_editor_store.dart';
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
        builder: (_) => ListView.builder(
          itemCount: checklistEditorStore.checks[sectionIndex].length,
          itemBuilder: (context, index) {
            var check = checklistEditorStore.checks[sectionIndex][index];
            return CheckboxListTile(
              title: Text(check.description),
              value: check.isChecked,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? value) {
                if (value != null) {
                  checklistEditorStore.setCheckIsChecked(
                      sectionIndex, index, value);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
