import 'package:ccr_checklist/page/template_editor_list_page.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
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
          itemCount: templateListStore.templates.length,
          itemBuilder: (context, index) {
            return Observer(
              builder: (_) => ListTile(
                title: Text(
                    "${templateListStore.templates[index].rebreatherModel} - ${templateListStore.templates[index].title}"),
                subtitle: Text(templateListStore.templates[index].description),
                onTap: () {
                  _onTapTemplate(context, templateListStore, index);
                },
              ),
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

  void _onTapTemplate(
      BuildContext context, TemplateListStore templateListStore, int index) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => TemplateEditorListPage(
    //       template: templateListStore.templates[index],
    //     ),
    //   ),
    // );
  }
}
