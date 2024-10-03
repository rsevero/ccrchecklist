import 'package:ccr_checklist/misc/helper_functions.dart';
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
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        final NavigatorState navigator = Navigator.of(context);
        final bool shouldPop = await _onBackPress(context);
        if (shouldPop) {
          navigator.pop();
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

    return await ccrConfirmActionDialog(context, 'Confirm losing modifications',
        'You have unsaved modifications to the template. Do you want to proceed without saving them?');
  }
}
