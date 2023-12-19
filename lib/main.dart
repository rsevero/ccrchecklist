import 'package:ccr_checklist/page/template_list_page.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
import 'package:ccr_checklist/theme/main_theme.dart';
import 'package:ccr_checklist/undo/undo_redo_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final undoRedoStorage = UndoRedoStorage();

void main() {
  runApp(const CCRChecklist());
}

class CCRChecklist extends StatelessWidget {
  const CCRChecklist({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) {
            final store = TemplateListStore();
            store.initializeAsync();
            return store;
          },
        ),
        Provider(
          create: (context) => TemplateEditorStore(),
        ),
        Provider(
          create: (context) => ChecklistEditorStore(),
        ),
      ],
      child: const CCRChecklistApp(),
    );
  }
}

class CCRChecklistApp extends StatelessWidget {
  const CCRChecklistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CCR Checklist',
      theme: mainLightTheme,
      darkTheme: mainDarkTheme,
      home: const TemplateListPage(),
    );
  }
}
