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
import 'package:ccrchecklist/misc/save_template_helper.dart';
import 'package:ccrchecklist/store/template_editor_store.dart';
import 'package:ccrchecklist/widget/undo_redo_buttons_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:share_plus/share_plus.dart';

class TemplateEditorPageAppBar extends AppBar {
  final TemplateEditorStore templateEditorStore;
  final BuildContext context;

  TemplateEditorPageAppBar(this.context, this.templateEditorStore, {super.key});

  @override
  Widget? get title => Observer(
        builder: (_) => Text(
            "${templateEditorStore.currentTemplate.rebreatherManufacturer} - ${templateEditorStore.currentTemplate.rebreatherModel}"),
      );

  @override
  double? get elevation => 4;

  @override
  List<Widget>? get actions => [
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
          onPressed: () => ccrOpenHelpDialog(context, 'TemplateEditorPage'),
          tooltip: 'Help',
        ),
        IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () {
            showCCRAboutDialog(context);
          },
          tooltip: 'About',
        ),
      ];

  Future<void> _onPressedShare(BuildContext context) async {
    final String file = await templateEditorStore.createShareableFile();

    Share.shareXFiles([XFile(file, mimeType: ccrTemplateMimeType)],
        text: 'Check out this template!');
  }

  Future<void> _onPressedSaveTemplate(BuildContext context) async {
    await templateEditorStore.saveTemplate(
        context, templateEditorStore.currentTemplate);
  }

  Future<void> _onPressedSaveAsTemplate(
      BuildContext context, Template template) async {
    await ccrSaveAsTemplate(context, template);
  }
}
