import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/widget/checklist_checklist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChecklistBody extends StatelessWidget {
  final int sectionIndex;

  const ChecklistBody({super.key, required this.sectionIndex});

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final section = checklistEditorStore.sections[sectionIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          color: Theme.of(context)
              .colorScheme
              .primaryContainer, // Highlight for the diver row
          child: Text(
            'Diver: ${checklistEditorStore.diverName} - Date: ${DateFormat('yyyy-MM-dd – kk:mm').format(checklistEditorStore.date)}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Observer(
          builder: (_) => Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: checklistEditorStore.sectionsOk[sectionIndex]
                ? ccrSectionOkColor
                : Theme.of(context).colorScheme.error,
            child: Text(
              section.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        CheckListCheckList(sectionIndex: sectionIndex),
      ],
    );
  }
}
