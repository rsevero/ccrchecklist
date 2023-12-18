import 'package:ccr_checklist/page/checklist_page.dart';
import 'package:ccr_checklist/page/template_editor_list_page.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
import 'package:ccr_checklist/widget/template_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TemplateListPage extends StatelessWidget {
  const TemplateListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CCR Checklist'),
        elevation: 4,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _openTemplateEditor(context),
            tooltip: 'Open Template Editor',
          ),
        ],
      ),
      body: TemplateList(
        onTapTemplate: _onTapTemplate,
        onTapTemplateFile: _onTapTemplateFile,
      ),
    );
  }

  void _openTemplateEditor(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TemplateEditorListPage(),
      ),
    );
  }

  void _onTapTemplate(BuildContext context, int index) async {
    final templateListStore =
        Provider.of<TemplateListStore>(context, listen: false);
    final checklistEditorStore =
        Provider.of<ChecklistEditorStore>(context, listen: false);

    checklistEditorStore
        .loadFromTemplate(templateListStore.unsavedTemplates[index]);

    if (!context.mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ChecklistPage(
          sectionIndex: 0,
        ),
      ),
    );
  }

  void _onTapTemplateFile(BuildContext context, int index) async {
    final templateListStore =
        Provider.of<TemplateListStore>(context, listen: false);
    final checklistEditorStore =
        Provider.of<ChecklistEditorStore>(context, listen: false);
    final template = await templateListStore
        .getTemplate(templateListStore.defaultTemplates[index]);

    checklistEditorStore.loadFromTemplate(template);

    if (!context.mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ChecklistPage(
          sectionIndex: 0,
        ),
      ),
    );
  }
}
