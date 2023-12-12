import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChecklistPage extends StatelessWidget {
  final int sectionIndex;

  const ChecklistPage({super.key, required this.sectionIndex});

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(checklistEditorStore.sections[sectionIndex].title),
      ),
      body: Observer(
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
