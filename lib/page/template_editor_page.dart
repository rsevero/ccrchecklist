import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/widget/template_editor_page_actions_widget.dart';
import 'package:ccr_checklist/widget/template_editor_page_app_bar.dart';
import 'package:ccr_checklist/widget/template_editor_page_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TemplateEditorPage extends StatelessWidget {
  const TemplateEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final templateEditorStore = Provider.of<TemplateEditorStore>(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        final backNavigationAllowed = await _onBackPress(context);
        if (backNavigationAllowed && !didPop) {
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        appBar: TemplateEditorPageAppBar(context, templateEditorStore),
        body: const TemplateEditorPageBody(),
        floatingActionButton: const TemplateEditorPageActionsWidget(),
      ),
    );
  }

  Future<bool> _onBackPress(BuildContext context) async {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    if (!templateEditorStore.currentTemplateIsModified) {
      return true;
    }

    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirm losing modifications'),
            content: const Text(
                'You have unsaved modifications to the template. Do you want to proceed without saving them?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
