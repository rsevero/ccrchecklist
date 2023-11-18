import 'package:ccr_checklist/data/template.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CCR Checklist',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TemplatesList(templates: <Template>[]),
    );
  }
}

class TemplatesList extends StatelessWidget {
  final List<Template> templates;

  const TemplatesList({Key? key, required this.templates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Templates'),
        elevation: 4,
      ),
      body: ListView.builder(
        itemCount: templates.length,
        itemBuilder: (context, index) {
          final template = templates[index];
          return ListTile(
            title: Text(template.title),
            subtitle: Text(template.description),
            // Add more UI elements as needed, like onTap to view template details
          );
        },
      ),
    );
  }
}
