import 'package:ccr_checklist/data/template_section.dart';
import 'package:flutter/material.dart';

class TemplateSectionEditorPage extends StatefulWidget {
  final TemplateSection section;

  const TemplateSectionEditorPage({Key? key, required this.section})
      : super(key: key);

  @override
  State<TemplateSectionEditorPage> createState() =>
      _TemplateSectionEditorPageState();
}

class _TemplateSectionEditorPageState extends State<TemplateSectionEditorPage> {
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.section.title);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _saveSection() {
    // Implement save logic
    // Update the section with the new title
    Navigator.pop(context);
  }

  void _cancelEditing() {
    // Just pop the page without saving
    Navigator.pop(context);
  }

  void _deleteSection() {
    // Implement delete logic
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Section'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Section Title',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveSection,
              child: const Text('Save'),
            ),
            ElevatedButton(
              onPressed: _cancelEditing,
              style: ElevatedButton.styleFrom(primary: Colors.grey),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: _deleteSection,
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
