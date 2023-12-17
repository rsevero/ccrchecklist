import 'package:ccr_checklist/page/checklist_page.dart';
import 'package:ccr_checklist/page/template_editor_list_page.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
import 'package:ccr_checklist/widget/template_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TemplateListPage extends StatelessWidget {
  const TemplateListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final templateListStore = Provider.of<TemplateListStore>(context);
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
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: templateListStore.templates.length,
          itemBuilder: (context, index) {
            return TemplateListTileWidget(
              rebreatherManufacturer:
                  templateListStore.templates[index].rebreatherManufacturer,
              rebreatherModel:
                  templateListStore.templates[index].rebreatherModel,
              title: templateListStore.templates[index].title,
              description: templateListStore.templates[index].description,
              onTap: () {
                _onTapTemplate(context, index);
              },
            );
          },
        ),
        warnWhenNoObservables: true,
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

  void _onTapTemplate(BuildContext context, int index) {
    final templateListStore =
        Provider.of<TemplateListStore>(context, listen: false);
    final checklistEditorStore =
        Provider.of<ChecklistEditorStore>(context, listen: false);
    checklistEditorStore.loadFromTemplate(templateListStore.templates[index]);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ChecklistPage(
          sectionIndex: 0,
        ),
      ),
    );
  }
}
