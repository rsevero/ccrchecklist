import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/misc/helper_functions.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/widget/template_editor_actions_widget.dart';
import 'package:ccr_checklist/widget/template_section_widget.dart';
import 'package:ccr_checklist/widget/undo_redo_buttons_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

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
        appBar: AppBar(
          title: Observer(
            builder: (_) => Text(
                "${templateEditorStore.currentTemplate.rebreatherManufacturer} - ${templateEditorStore.currentTemplate.rebreatherModel}"),
          ),
          elevation: 4,
          actions: [
            Observer(
              builder: (_) {
                return UndoRedoButtonsWidget(
                  canRedo: templateEditorStore.canRedo,
                  canUndo: templateEditorStore.canUndo,
                  redo: templateEditorStore.redo,
                  undo: templateEditorStore.undo,
                  redoDescription: templateEditorStore.redoDescription,
                  undoDescription: templateEditorStore.undoDescription,
                );
              },
            ),
            if (defaultTargetPlatform != TargetPlatform.linux) ...[
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () => _onPressedShare(context),
              )
            ],
            Observer(
              builder: (_) => IconButton(
                icon: const Icon(Icons.save),
                onPressed:
                    (templateEditorStore.currentTemplate.path.isNotEmpty &&
                            templateEditorStore.currentTemplateIsModified)
                        ? () => _onPressedSaveTemplate(context)
                        : null,
                tooltip: 'Save Template',
              ),
            ),
            IconButton(
              icon: const Icon(Icons.save_as),
              onPressed: () => _onPressedSaveAsTemplate(
                  context, templateEditorStore.currentTemplate),
              tooltip: 'Save As Template',
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Observer(
                builder: (_) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          templateEditorStore.currentTemplate.title,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Center(
                        child: Text(
                          templateEditorStore.currentTemplate.description,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                'Sections',
                style: TextStyle(
                  fontSize: 20.0, // Font size for the title
                  fontWeight: FontWeight.bold, // Bold title
                ),
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) => ReorderableListView.builder(
                  shrinkWrap: true,
                  itemCount: templateEditorStore.sections.length,
                  itemBuilder: (context, index) {
                    return Observer(
                      key: ValueKey(index),
                      builder: (_) {
                        final section = templateEditorStore.sections[index];
                        return TemplateSectionWidget(
                            section: section,
                            index: index,
                            templateEditorStore: templateEditorStore);
                      },
                    );
                  },
                  onReorder: (oldIndex, newIndex) =>
                      templateEditorStore.moveSection(oldIndex, newIndex),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: const TemplateEditorActionsWidget(),
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

  Future<void> _onPressedShare(BuildContext context) async {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    final file = await templateEditorStore.createShareableFile();

    Share.shareXFiles([XFile(file)], text: 'Check out this template!');
  }

  Future<void> _onPressedSaveTemplate(BuildContext context) async {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    await templateEditorStore.saveTemplate(
        context, templateEditorStore.currentTemplate);
  }

  Future<void> _onPressedSaveAsTemplate(
      BuildContext context, Template template) async {
    await ccrSaveAsTemplate(context, template);
  }
}
