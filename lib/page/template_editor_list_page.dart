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
import 'package:ccrchecklist/misc/flutter_extension_methods.dart';
import 'package:ccrchecklist/misc/help_dialog_helper.dart';
import 'package:ccrchecklist/misc/save_template_helper.dart';
import 'package:ccrchecklist/misc/template_load_helper.dart';
import 'package:ccrchecklist/store/template_editor_store.dart';
import 'package:ccrchecklist/store/template_list_store.dart';
import 'package:ccrchecklist/widget/template_list.dart';
import 'package:flutter/material.dart';
import 'package:ccrchecklist/page/template_editor_page.dart';
import 'package:provider/provider.dart';

class TemplateEditorListPage extends StatelessWidget {
  const TemplateEditorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Checklist Templates'),
          elevation: 4,
          actions: [
            IconButton(
              icon: const Icon(Icons.help_outline),
              onPressed: () =>
                  ccrOpenHelpDialog(context, 'TemplateEditorListPage'),
              tooltip: 'Help',
            ),
          ],
        ),
        body: TemplateList(
          isEditor: true,
          onTapTemplateFile: _onTapTemplateFile,
          onRemoveTemplateFile: _onRemoveTemplateFile,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addNewTemplate(context),
          tooltip: 'Create New Template',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<void> _onRemoveTemplateFile(BuildContext context, int index) async {
    final templateListStore =
        Provider.of<TemplateListStore>(context, listen: false);

    // Show confirmation dialog
    final bool confirm = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm Removal'),
              content:
                  const Text('Are you sure you want to remove this template?'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Remove'),
                  onPressed: () => Navigator.of(context)
                      .pop(true), // Dismiss dialog and return true
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context)
                      .pop(false), // Dismiss dialog and return false
                ),
              ],
            );
          },
        ) ??
        false; // If dialog is dismissed without any action, consider as false (do not remove)

    // If confirmation received, remove the template
    if (confirm) {
      await templateListStore.removeTemplate(index);
    }
  }

  Future<void> _onTapTemplateFile(BuildContext context, int index) async {
    final Template template =
        await TemplateLoadHelper.loadTemplate(context, index);

    if (!context.mounted) return;
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);

    templateEditorStore.setCurrentTemplate(template);

    final templateListStore =
        Provider.of<TemplateListStore>(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TemplateEditorPage(),
      ),
    );

    templateListStore.invalidate();
  }

  void _addNewTemplate(BuildContext context) async {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController rebreatherManufacturerController =
        TextEditingController();
    final TextEditingController rebreatherModelController =
        TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    bool confirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'New Template',
                style: context.ccrThemeExtension.dialogTitleTextTheme,
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: rebreatherManufacturerController,
                      decoration: InputDecoration(
                        hintStyle:
                            context.ccrThemeExtension.dialogHintTextTheme,
                        hintText: 'Rebreather manufacturer',
                      ),
                      textInputAction: TextInputAction
                          .next, // Move focus to next input on "Enter"
                      onSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(FocusNode()),
                      autofocus: true,
                    ),
                    TextField(
                      controller: rebreatherModelController,
                      decoration: InputDecoration(
                          hintStyle:
                              context.ccrThemeExtension.dialogHintTextTheme,
                          hintText: 'Rebreather model'),
                      autofocus: true,
                      textInputAction: TextInputAction
                          .next, // Move focus to next input on "Enter"
                      onSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(FocusNode()), // Optional
                    ),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          hintStyle:
                              context.ccrThemeExtension.dialogHintTextTheme,
                          hintText: 'Title'),
                      textInputAction: TextInputAction
                          .next, // Move focus to next input on "Enter"
                      onSubmitted: (_) => FocusScope.of(context)
                          .nextFocus(), // Move focus to next input
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                          hintStyle:
                              context.ccrThemeExtension.dialogHintTextTheme,
                          hintText: 'Description'),
                      textInputAction:
                          TextInputAction.done, // Done action for last input
                      onSubmitted: (_) => Navigator.of(context)
                          .pop(true), // Activate "Create" method on "Enter"
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Create'),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ],
            );
          },
        ) ??
        false;

    if (confirmed) {
      final String rebreatherManufacturer =
          rebreatherManufacturerController.text.trim();
      final String rebreatherModel = rebreatherModelController.text.trim();
      final String title = titleController.text.trim();
      final String description = descriptionController.text.trim();
      if (rebreatherManufacturer.isNotEmpty &&
          rebreatherModel.isNotEmpty &&
          title.isNotEmpty) {
        Template newTemplate = Template(
          rebreatherManufacturer: rebreatherManufacturer,
          rebreatherModel: rebreatherModel,
          title: title,
          description: description,
          sections: [],
        );
        final String filename = await ccrFileNameFromTemplate(newTemplate);
        if (!context.mounted) return;
        await ccrSaveAsTemplate(context, newTemplate, filename);

        if (!context.mounted) return;
        final TemplateListStore templateListStore =
            Provider.of<TemplateListStore>(context, listen: false);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TemplateEditorPage(),
          ),
        );

        templateListStore.invalidate();
      }
    }
  }
}
