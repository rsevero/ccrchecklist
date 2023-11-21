import 'package:flutter/material.dart';
import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/page/template_editor.dart';

class TemplateListPage extends StatefulWidget {
  final List<Template> templates = [];

  TemplateListPage({super.key});

  @override
  State<TemplateListPage> createState() => _TemplateListPageState();
}

class _TemplateListPageState extends State<TemplateListPage> {
  _TemplateListPageState();

  void _createNewTemplate() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => TemplateEditorPage(template: Template.empty())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CCR Checklist Templates'),
        elevation: 4,
      ),
      body: ListView.builder(
        itemCount: widget.templates.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.templates[index].title),
            subtitle: Text(widget.templates[index].description),
            onTap: () {
              // Handle template selection, if necessary
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewTemplate,
        tooltip: 'Create new template',
        child: const Icon(Icons.add),
      ),
    );
  }
}
