import 'package:ccr_checklist/page/template_list.dart';
import 'package:ccr_checklist/store/template_editor.dart';
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
          create: (context) => TemplateEditorStore(),
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const TemplateListPage(),
    );
  }
}
