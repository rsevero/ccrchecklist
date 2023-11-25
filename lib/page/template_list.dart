import 'package:ccr_checklist/store/template_editor.dart';
import 'package:flutter/material.dart';
import 'package:ccr_checklist/page/template_editor.dart';
import 'package:provider/provider.dart';

class TemplateListPage extends StatelessWidget {
  const TemplateListPage({super.key});

  void _createNewTemplate(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TemplateEditorPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final templateEditorStore = Provider.of<TemplateEditorStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CCR Checklist Templates'),
        elevation: 4,
      ),
      body: ListView.builder(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createNewTemplate(context),
        tooltip: 'Create new template',
        child: const Icon(Icons.add),
      ),
    );
  }
}
