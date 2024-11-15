import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/misc/help_dialog_helper.dart';
import 'package:ccr_checklist/misc/template_load_helper.dart';
import 'package:ccr_checklist/page/checklist_page.dart';
import 'package:ccr_checklist/page/settings_page.dart';
import 'package:ccr_checklist/page/template_editor_list_page.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/store/config_store.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
import 'package:ccr_checklist/widget/missing_diver_name_dialog.dart';
import 'package:ccr_checklist/widget/template_list.dart';
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
              actions: <Widget>[
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
              ],
            ),
            body: TemplateList(
              isEditor: false,
              onTapTemplateFile: _onTapTemplateFile,
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
