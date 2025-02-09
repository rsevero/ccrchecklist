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
import 'package:ccrchecklist/misc/template_load_helper.dart';
import 'package:ccrchecklist/page/checklist_page.dart';
import 'package:ccrchecklist/page/settings_page.dart';
import 'package:ccrchecklist/page/template_editor_list_page.dart';
import 'package:ccrchecklist/store/checklist_editor_store.dart';
import 'package:ccrchecklist/store/config_store.dart';
import 'package:ccrchecklist/store/template_list_store.dart';
import 'package:ccrchecklist/widget/missing_diver_name_dialog.dart';
import 'package:ccrchecklist/widget/template_list.dart';
import 'package:ccrchecklist/widget/tool_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class TemplateListPage extends StatefulWidget {
  const TemplateListPage({super.key});

  @override
  State<TemplateListPage> createState() => _TemplateListPageState();
}

class _TemplateListPageState extends State<TemplateListPage> {
  late TemplateListStore templateListStore;

  @override
  void initState() {
    super.initState();

    templateListStore = Provider.of<TemplateListStore>(context, listen: false);

    _waitForTemplateLoad();
  }

  void _waitForTemplateLoad() async {
    await asyncWhen((_) => ((!templateListStore.showedTemplateStats) &&
        (templateListStore.state == TemplateListStoreState.uptodate)));

    _showTemplatesStats();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final configStore = Provider.of<ConfigStore>(context);

        if ((configStore.configLoadStatus == ConfigLoadStatusEnum.loaded) &&
            (configStore.configData['DiverName'] == null ||
                configStore.configData['DiverName']
                    .toString()
                    .trim()
                    .isEmpty)) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              showDialog(
                context: context,
                builder: (context) => MissingDiverNameDialog(
                  onDiverNameSubmitted: (name) {
                    configStore.setDiverName(name);
                    configStore.saveConfig();
                  },
                ),
              );
            },
          );
        }

        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('CCR Checklist'),
              elevation: 4,
            ),
            body: ToolBar(
              actions: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _openTemplateEditor(context),
                  tooltip: 'Template Editor',
                ),
                IconButton(
                  icon: const Icon(Icons.settings_outlined),
                  onPressed: () => _openSettingsEditor(context),
                  tooltip: 'Settings',
                ),
                IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () =>
                      ccrOpenHelpDialog(context, 'TemplateListPage'),
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
              content: TemplateList(
                isEditor: false,
                onTapTemplateFile: _onTapTemplateFile,
              ),
            ),
          ),
        );
      },
    );
  }

  void _showTemplatesStats() {
    final String templatesStats =
        "Loaded ${templateListStore.assetTemplateCount} asset templates and ${templateListStore.savedTemplateCount} saved templates for ${templateListStore.modelCount} rebreather models from ${templateListStore.manufacturerCount} manufacturers.";

    final snackBar = SnackBar(
      content: Text(templatesStats),
      duration: Duration(seconds: 5),
      margin: EdgeInsets.all(16),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: ccrTemplateListTileBorderRadius,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    templateListStore.setShowedTemplateStats();
  }

  void _openSettingsEditor(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SettingsPage(),
      ),
    );
  }

  void _openTemplateEditor(BuildContext context) {
    final templateListStore =
        Provider.of<TemplateListStore>(context, listen: false);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TemplateEditorListPage(),
      ),
    );

    templateListStore.invalidate();
  }

  void _onTapTemplateFile(BuildContext context, int index) async {
    final Template template =
        await TemplateLoadHelper.loadTemplate(context, index);

    if (!context.mounted) return;
    final checklistEditorStore =
        Provider.of<ChecklistEditorStore>(context, listen: false);
    final result =
        await checklistEditorStore.loadFromTemplate(context, template);

    if (!result) {
      return;
    }

    if (!context.mounted) return;
    final templateListStore =
        Provider.of<TemplateListStore>(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ChecklistPage(
          sectionIndex: 0,
        ),
      ),
    );

    templateListStore.invalidate();
  }
}
