import 'package:ccr_checklist/page/template_editor_list_.dart';
import 'package:ccr_checklist/store/template_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TemplateListPage extends StatelessWidget {
  const TemplateListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final templateEditorStore = Provider.of<TemplateEditorStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CCR Checklist Templates'),
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
          itemCount: templateEditorStore.templates.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(templateEditorStore.templates[index].title),
              subtitle: Text(templateEditorStore.templates[index].description),
              onTap: () {
                // Handle template selection, if necessary
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
}
