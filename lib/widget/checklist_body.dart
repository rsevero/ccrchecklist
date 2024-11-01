import 'package:ccr_checklist/misc/flutter_extension_methods.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/widget/checklist_checklist.dart';
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
                    ? context.colorScheme.primary
                    : context.colorScheme.error,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Text(
                "${section.title} - ${sectionIndex + 1}/${checklistEditorStore.sections.length}",
                style: context.textTheme.titleLarge?.copyWith(
                  color: checklistEditorStore.sectionsOk[sectionIndex]
                      ? context.colorScheme.onPrimary
                      : context.colorScheme.onError,
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
