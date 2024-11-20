// CCR Checklist - a checklist app for rebreather users
// Copyright (C) 2024  Rodrigo Severo
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:ccrchecklist/misc/about_dialog_helper.dart';
import 'package:ccrchecklist/misc/flutter_extension_methods.dart';
import 'package:ccrchecklist/misc/help_dialog_helper.dart';
import 'package:ccrchecklist/misc/helper_functions.dart';
import 'package:ccrchecklist/page/checklist_complete_page.dart';
import 'package:ccrchecklist/store/checklist_editor_store.dart';
import 'package:ccrchecklist/store/config_store.dart';
import 'package:ccrchecklist/widget/checklist_body.dart';
import 'package:ccrchecklist/widget/tool_bar.dart';
import 'package:flutter/material.dart'; // For date formatting
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChecklistPage extends StatelessWidget {
  final int sectionIndex;

  const ChecklistPage({super.key, required this.sectionIndex});

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final ConfigStore configStore = Provider.of<ConfigStore>(context);
    final totalSections = checklistEditorStore.sections.length;
    final theme = context.ccrThemeExtension;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        final NavigatorState navigator = Navigator.of(context);
        final bool shouldPop = await _onBackPress(context);
        if (shouldPop) {
          navigator.pop();
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Checklist'),
            // title: checklistEditorStore.title,
            // description: checklistEditorStore.description,
            // rebreatherManufacturer: checklistEditorStore.rebreatherManufacturer,
            // rebreatherModel: checklistEditorStore.rebreatherModel,
          ),
          body: ToolBar(
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
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedZoomInArea,
                  color: Colors.black,
                  size: 24.0,
                ),
                tooltip: 'Info',
                onPressed: () {
                  _showInfoDialog(
                    context,
                    checklistEditorStore.title,
                    checklistEditorStore.description,
                    checklistEditorStore.rebreatherManufacturer,
                    checklistEditorStore.rebreatherModel,
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
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {
                  showCCRAboutDialog(context);
                },
                tooltip: 'About',
              ),
            ],
            content: ChecklistBody(sectionIndex: sectionIndex),
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: BottomAppBar(
              color: theme.inversePrimary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (_) {
                      final buttonEnabled = sectionIndex > 0;
                      Color? buttonColor;
                      Color? iconColor;

                      if (buttonEnabled) {
                        buttonColor = checklistEditorStore
                                .previousSectionsOk[sectionIndex]
                            ? theme.primary
                            : theme.error;
                        iconColor = checklistEditorStore
                                .previousSectionsOk[sectionIndex]
                            ? theme.onPrimary
                            : theme.onError;
                      }

                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.navigate_before),
                          color: iconColor,
                          disabledColor: theme.inversePrimary,
                          onPressed: buttonEnabled
                              ? () => _onTapPreviousSection(context)
                              : null,
                        ),
                      );
                    },
                  ),
                  Observer(
                    builder: (_) {
                      final buttonEnabled = sectionIndex < totalSections;
                      Color? buttonColor;
                      Color? iconColor;

                      if (buttonEnabled) {
                        buttonColor =
                            checklistEditorStore.sectionsOk[sectionIndex]
                                ? theme.primary
                                : theme.error;
                        iconColor =
                            checklistEditorStore.sectionsOk[sectionIndex]
                                ? theme.onPrimary
                                : theme.onError;
                      }

                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.navigate_next),
                          color: iconColor,
                          onPressed: buttonEnabled
                              ? () => _onTapNextSection(context, totalSections)
                              : null,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPress(BuildContext context) async {
    final checklistEditorStore =
        Provider.of<ChecklistEditorStore>(context, listen: false);
    if (!checklistEditorStore.checklistChanged) {
      return true;
    }

    return await ccrConfirmActionDialog(
      context,
      'Confirm losing modifications',
      'You have a partial checklist. Do you want to loose it?',
    );
  }

  void _onTapPreviousSection(BuildContext context) {
    navigateToSection(context, sectionIndex - 1);
  }

  void _onTapNextSection(BuildContext context, int totalSections) {
    if (sectionIndex < (totalSections - 1)) {
      navigateToSection(context, sectionIndex + 1);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ChecklistCompletePage(),
        ),
      );
    }
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
                'Manufacturer',
                style: context.textTheme.bodyMedium,
              ),
              Text(
                rebreatherManufacturer,
                style: context.textTheme.titleMedium,
              ),
              SizedBox(height: context.textTheme.bodySmall?.fontSize ?? 8),
              Text(
                'Model',
                style: context.textTheme.bodyMedium,
              ),
              Text(
                rebreatherModel,
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
}
