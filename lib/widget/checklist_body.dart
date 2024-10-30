import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/misc/flutter_extension_methods.dart';
import 'package:ccr_checklist/misc/hover_text.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/store/config_store.dart';
import 'package:ccr_checklist/widget/checklist_checklist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChecklistBody extends StatelessWidget {
  final int sectionIndex;
  final String title;
  final String description;
  final String rebreatherManufacturer;
  final String rebreatherModel;

  const ChecklistBody({
    super.key,
    required this.sectionIndex,
    required this.title,
    required this.description,
    required this.rebreatherManufacturer,
    required this.rebreatherModel,
  });

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final ConfigStore configStore = Provider.of<ConfigStore>(context);
    final section = checklistEditorStore.sections[sectionIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          color: context.colorScheme.primaryContainer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              HoverText(text: title, style: context.textTheme.titleLarge),
              HoverText(
                  text: description, style: context.textTheme.titleMedium),
              HoverText(
                  text: '$rebreatherManufacturer $rebreatherModel',
                  style: context.textTheme.titleMedium),
              HoverText(
                  text: 'Diver: ${configStore.diverName}',
                  style: context.textTheme.titleSmall),
              HoverText(
                  text:
                      'Date: ${DateFormat('yyyy-MM-dd – kk:mm').format(checklistEditorStore.date)}',
                  style: context.textTheme.titleSmall),
            ],
          ),
        ),
        if (checklistEditorStore.sections.length > 1) ...[
          Observer(
            builder: (_) => Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: checklistEditorStore.sectionsOk[sectionIndex]
                  ? ccrSectionOkColor
                  : context.colorScheme.error,
              child: Text(
                "${section.title} - ${sectionIndex + 1}/${checklistEditorStore.sections.length}",
                style: context.textTheme.titleLarge,
              ),
            ),
          ),
        ],
        CheckListCheckList(sectionIndex: sectionIndex),
      ],
    );
  }
}
