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

import 'package:ccrchecklist/misc/flutter_extension_methods.dart';
import 'package:ccrchecklist/misc/helper_functions.dart';
import 'package:ccrchecklist/page/checklist_complete_page.dart';
import 'package:ccrchecklist/store/checklist_editor_store.dart';
import 'package:ccrchecklist/widget/checklist_appbar.dart';
import 'package:ccrchecklist/widget/checklist_body.dart';
import 'package:ccrchecklist/widget/tool_bar.dart';
import 'package:flutter/material.dart'; // For date formatting
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ChecklistPage extends StatelessWidget {
  final int sectionIndex;

  const ChecklistPage({super.key, required this.sectionIndex});

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
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
          appBar: CheckListAppBar(
            title: checklistEditorStore.title,
            description: checklistEditorStore.description,
            rebreatherManufacturer: checklistEditorStore.rebreatherManufacturer,
            rebreatherModel: checklistEditorStore.rebreatherModel,
          ),
          body: ToolBar(
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
}
