import 'package:ccr_checklist/misc/flutter_extension_methods.dart';
import 'package:ccr_checklist/misc/help_dialog_helper.dart';
import 'package:ccr_checklist/misc/helper_functions.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/store/config_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
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
    final ConfigStore configStore = Provider.of<ConfigStore>(context);

    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Checklist'),
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
                : null,
          ),
        ),
        IconButton(
          icon: Icon(Icons.info_outline),
          tooltip: 'Info',
          onPressed: () {
            _showInfoDialog(
              context,
              title,
              description,
              rebreatherManufacturer,
              rebreatherModel,
              configStore.diverName,
              checklistEditorStore.date,
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.help_outline),
          onPressed: () => ccrOpenHelpDialog(context, 'ChecklistPage'),
          tooltip: 'Help',
        ),
      ],
    );
  }

  void _showInfoDialog(
    BuildContext context,
    String title,
    String description,
    String rebreatherManufacturer,
    String rebreatherModel,
    String diverName,
    DateTime date,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Checklist Info',
            style: context.textTheme.headlineMedium,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Title',
                style: context.textTheme.bodyMedium,
              ),
              Text(
                title,
                style: context.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: context.textTheme.bodySmall?.fontSize ?? 8),
              Text(
                'Description',
                style: context.textTheme.bodyMedium,
              ),
              Text(
                description,
                style: context.textTheme.titleMedium,
              ),
              SizedBox(height: context.textTheme.bodySmall?.fontSize ?? 8),
              Text(
                'Manufacturer/Model',
                style: context.textTheme.bodyMedium,
              ),
              Text(
                '$rebreatherManufacturer $rebreatherModel',
                style: context.textTheme.titleMedium,
              ),
              SizedBox(height: context.textTheme.bodySmall?.fontSize ?? 8),
              Text(
                'Diver',
                style: context.textTheme.bodyMedium,
              ),
              Text(
                diverName,
                style: context.textTheme.titleSmall,
              ),
              SizedBox(height: context.textTheme.bodySmall?.fontSize ?? 8),
              Text(
                'Creation date',
                style: context.textTheme.bodyMedium,
              ),
              Text(
                DateFormat('yyyy-MM-dd – kk:mm').format(date),
                style: context.textTheme.titleSmall,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void onPressedResetChecklist(BuildContext context) async {
    final checklistEditorStore =
        Provider.of<ChecklistEditorStore>(context, listen: false);

    bool confirm = await ccrConfirmActionDialog(context, "Reset Checklist",
        "Are you sure you want to reset the checklist and lose all changes?");

    if (confirm) {
      if (!context.mounted) return;
      final result = await checklistEditorStore.resetChecklist(context);

      if (!result) {
        return;
      }
      if (!context.mounted) return;
      navigateToSection(context, 0);
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
