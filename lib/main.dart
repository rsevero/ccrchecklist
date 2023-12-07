import 'package:ccr_checklist/page/template_list_page.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
import 'package:ccr_checklist/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          create: (context) => TemplateListStore(),
          lazy: false,
        ),
        Provider(
          create: (context) => TemplateEditorStore(),
          lazy: false,
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
      theme: mainTheme,
      home: const TemplateListPage(),
    );
  }
}
