import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/widget/checklist_appbar.dart';
import 'package:ccr_checklist/widget/checklist_body.dart';
import 'package:flutter/material.dart'; // For date formatting
import 'package:provider/provider.dart';

class ChecklistPage extends StatelessWidget {
  final int sectionIndex;

  const ChecklistPage({super.key, required this.sectionIndex});

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);

    return Scaffold(
      appBar: CheckListAppBar(
          title: checklistEditorStore.title,
          description: checklistEditorStore.description,
          rebreatherManufacturer: checklistEditorStore.rebreatherManufacturer,
          rebreatherModel: checklistEditorStore.rebreatherModel),
      body: ChecklistBody(sectionIndex: sectionIndex),
    );
  }
}
