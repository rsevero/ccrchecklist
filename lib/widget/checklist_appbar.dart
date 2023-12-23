import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CheckListAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String description;
  final String rebreatherManufacturer;
  final String rebreatherModel;

  const CheckListAppBar({
    super.key,
    required this.title,
    required this.description,
    required this.rebreatherManufacturer,
    required this.rebreatherModel,
  });

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);

    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$title - $description'),
          Text(
            '$rebreatherManufacturer $rebreatherModel',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      elevation: 1,
      actions: [
        Observer(
          builder: (_) => IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset Checklist',
            onPressed: checklistEditorStore.checklistChanged
                ? () => onPressedResetChecklist(context)
                : null, // Call the reset function on press
          ),
        ),
      ],
    );
  }

  void onPressedResetChecklist(BuildContext context) {
    final checklistEditorStore =
        Provider.of<ChecklistEditorStore>(context, listen: false);
    checklistEditorStore.resetChecklist();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
