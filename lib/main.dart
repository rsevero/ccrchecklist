import 'package:ccr_checklist/page/template_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CCRChecklistApp());
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
      home: TemplateListPage(),
    );
  }
}
