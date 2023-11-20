import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/data/template_section.dart';
import 'package:flutter/material.dart';

class TemplateEditor extends StatelessWidget {
  final List<TemplateSection> sections;

  const TemplateEditor(this.sections, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sections.length,
      itemBuilder: (context, index) {
        return TemplateSectionEditor(sections[index]);
      },
    );
  }
}

class TemplateSectionEditor extends StatelessWidget {
  final TemplateSection section;

  const TemplateSectionEditor(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(section.title),
        Expanded(
          child: ListView.builder(
            itemCount: section.checks.length,
            itemBuilder: (context, index) {
              final check = section.checks[index];
              return TemplateCheckEditor(check);
            },
          ),
        ),
        // Add buttons or other UI elements for adding new checks
      ],
    );
  }
}

class TemplateCheckEditor extends StatelessWidget {
  final TemplateCheck check;

  const TemplateCheckEditor(this.check, {super.key});

  @override
  Widget build(BuildContext context) {
    switch (check.runtimeType) {
      case TemplateRegularCheck:
        return TemplateRegularCheckWidget(
            check: (check as TemplateRegularCheck));
      case TemplateWithReferenceCheck:
        return TemplateWithReferenceCheckWidget(
            check: (check as TemplateWithReferenceCheck));
      case TemplateLinearityCheckStep1Check:
        return TemplateLinearityCheckStep1CheckWidget(
            check: (check as TemplateLinearityCheckStep1Check));
      case TemplateLinearityCheckStep2Check:
        return TemplateLinearityCheckStep2CheckWidget(
            check: (check as TemplateLinearityCheckStep2Check));
      default:
        throw UnsupportedError("Unknown check type ${check.runtimeType}");
    }
  }
}

class TemplateRegularCheckWidget extends StatefulWidget {
  final TemplateRegularCheck check;

  const TemplateRegularCheckWidget({Key? key, required this.check})
      : super(key: key);

  @override
  State<TemplateRegularCheckWidget> createState() =>
      _TemplateRegularCheckWidgetState();
}

class _TemplateRegularCheckWidgetState
    extends State<TemplateRegularCheckWidget> {
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _descriptionController =
        TextEditingController(text: widget.check.description);
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _descriptionController,
      decoration: const InputDecoration(
        labelText: 'Description',
      ),
      onChanged: (value) {
        // Update the check description here if needed
      },
    );
  }
}

class TemplateWithReferenceCheckWidget extends StatefulWidget {
  final TemplateWithReferenceCheck check;

  const TemplateWithReferenceCheckWidget({Key? key, required this.check})
      : super(key: key);

  @override
  State<TemplateWithReferenceCheckWidget> createState() =>
      _TemplateWithReferenceCheckWidgetState();
}

class _TemplateWithReferenceCheckWidgetState
    extends State<TemplateWithReferenceCheckWidget> {
  late TextEditingController _descriptionController;
  late TextEditingController _referenceDescriptionController;

  @override
  void initState() {
    super.initState();
    _descriptionController =
        TextEditingController(text: widget.check.description);
    _referenceDescriptionController =
        TextEditingController(text: widget.check.referenceDescription);
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _referenceDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _descriptionController,
          decoration: const InputDecoration(
            labelText: 'Description',
          ),
          onChanged: (value) {
            // Update the check description here if needed
          },
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: _referenceDescriptionController,
          decoration: const InputDecoration(
            labelText: 'Reference Description',
          ),
          onChanged: (value) {
            // Update the reference description here if needed
          },
        ),
        // Add more UI elements if necessary
      ],
    );
  }
}

class TemplateLinearityCheckStep1CheckWidget extends StatelessWidget {
  final TemplateLinearityCheckStep1Check check;

  const TemplateLinearityCheckStep1CheckWidget({Key? key, required this.check})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: const Text(
        "Linearity check: step 1",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class TemplateLinearityCheckStep2CheckWidget extends StatelessWidget {
  final TemplateLinearityCheckStep2Check check;

  const TemplateLinearityCheckStep2CheckWidget({Key? key, required this.check})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: const Text(
        "Linearity check: step 2",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
