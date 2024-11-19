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

import 'package:ccrchecklist/data/template.dart';
import 'package:ccrchecklist/misc/about_dialog_helper.dart';
import 'package:ccrchecklist/misc/constants.dart';
import 'package:ccrchecklist/misc/help_dialog_helper.dart';
import 'package:ccrchecklist/misc/helper_functions.dart';
import 'package:ccrchecklist/misc/save_template_helper.dart';
import 'package:ccrchecklist/store/template_editor_store.dart';
import 'package:ccrchecklist/store/template_list_store.dart';
import 'package:ccrchecklist/widget/template_editor_page_actions_widget.dart';
import 'package:ccrchecklist/widget/template_editor_page_body.dart';
import 'package:ccrchecklist/widget/tool_bar.dart';
import 'package:ccrchecklist/widget/undo_redo_buttons_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class TemplateEditorPage extends StatelessWidget {
  const TemplateEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TemplateEditorStore templateEditorStore =
        Provider.of<TemplateEditorStore>(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        final NavigatorState navigator = Navigator.of(context);
        final bool shouldPop = await _onBackPress(context);
        if (shouldPop) {
          if (!context.mounted) return;
          final TemplateListStore templateListStore =
              Provider.of<TemplateListStore>(context, listen: false);
          templateListStore.invalidate();
          navigator.pop();
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Template Editor'),
          ),
          body: ToolBar(
            actions: [
              Observer(
                builder: (_) {
                  return UndoRedoButtonsWidget(
                    canRedo: templateEditorStore.canRedo,
                    canUndo: templateEditorStore.canUndo,
                    redo: templateEditorStore.redo,
                    undo: templateEditorStore.undo,
                    redoDescription: templateEditorStore.redoDescription,
                    undoDescription: templateEditorStore.undoDescription,
                  );
                },
              ),
              if (defaultTargetPlatform != TargetPlatform.linux) ...[
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () => _onPressedShare(context),
                )
              ],
              Observer(
                builder: (_) => IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: (!templateEditorStore.currentTemplate.isAsset &&
                          templateEditorStore.currentTemplate.path.isNotEmpty &&
                          templateEditorStore.currentTemplateIsModified)
                      ? () => _onPressedSaveTemplate(context)
                      : null,
                  tooltip: 'Save Template',
                ),
              ),
              IconButton(
                icon: const Icon(Icons.save_as),
                onPressed: () => _onPressedSaveAsTemplate(
                    context, templateEditorStore.currentTemplate),
                tooltip: 'Save As Template',
              ),
              IconButton(
                icon: const Icon(Icons.help_outline),
                onPressed: () =>
                    ccrOpenHelpDialog(context, 'TemplateEditorPage'),
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
            content: const TemplateEditorPageBody(),
          ),
          floatingActionButton: const TemplateEditorPageActionsWidget(),
        ),
      ),
    );
  }

  Future<void> _onPressedSaveTemplate(BuildContext context) async {
    final TemplateEditorStore templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    await templateEditorStore.saveTemplate(
        context, templateEditorStore.currentTemplate);
  }

  Future<void> _onPressedSaveAsTemplate(
      BuildContext context, Template template) async {
    await ccrSaveAsTemplate(context, template);
  }

  Future<bool> _onBackPress(BuildContext context) async {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    if (!templateEditorStore.currentTemplateIsModified) {
      return true;
    }

    return await ccrConfirmActionDialog(
      context,
      'Confirm losing modifications',
      'You have unsaved modifications to the template. Do you want to proceed without saving them?',
    );
  }

  Future<void> _onPressedShare(BuildContext context) async {
    final TemplateEditorStore templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    final String file = await templateEditorStore.createShareableFile();

    Share.shareXFiles([XFile(file, mimeType: ccrTemplateMimeType)],
        text: 'Check out this template!');
  }
}
