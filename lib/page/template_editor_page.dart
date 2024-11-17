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

import 'package:ccrchecklist/misc/helper_functions.dart';
import 'package:ccrchecklist/store/template_editor_store.dart';
import 'package:ccrchecklist/store/template_list_store.dart';
import 'package:ccrchecklist/widget/template_editor_page_actions_widget.dart';
import 'package:ccrchecklist/widget/template_editor_page_app_bar.dart';
import 'package:ccrchecklist/widget/template_editor_page_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TemplateEditorPage extends StatelessWidget {
  const TemplateEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final templateEditorStore = Provider.of<TemplateEditorStore>(context);

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
          appBar: TemplateEditorPageAppBar(context, templateEditorStore),
          body: const TemplateEditorPageBody(),
          floatingActionButton: const TemplateEditorPageActionsWidget(),
        ),
      ),
    );
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
}
