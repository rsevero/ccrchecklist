import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/data/template_section.dart';
import 'package:ccr_checklist/page/template_section_editor.dart';
import 'package:ccr_checklist/store/template_editor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TemplateEditorPage extends StatelessWidget {
  const TemplateEditorPage({super.key});

  void _addNewSection(BuildContext context) {
    // final newSection = TemplateSection.empty();
    // widget.t
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TemplateSectionEditorPage(),
      ),
    );
  }

  void _editSection(BuildContext context, TemplateSection section) {
    // Navigate to the TemplateSectionEditor with the selected section
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => TemplateSectionEditorPage(section: section)),
    );
  }

  void _editCheck(BuildContext context, TemplateCheck check) {
    // Navigate to the TemplateCheckEditor with the selected check
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //       builder: (context) => TemplateCheckEdito(check: check)),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final templateEditorStore = Provider.of<TemplateEditorStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Template Editor'),
        elevation: 4,
      ),
      body: ListView.builder(
        itemCount: templateEditorStore.template.sections.length,
        itemBuilder: (context, index) {
          final section = templateEditorStore.template.sections[index];
          return ListTile(
            title: Text(section.title),
            onTap: () => _editSection(context, section),
            // Display checks in this section
            subtitle: Column(
              children: section.checks.map((check) {
                return ListTile(
                  title: Text(check.type),
                  onTap: () => _editCheck(context, check),
                );
              }).toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewSection(context),
        tooltip: 'Create New Section',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// class TemplateSectionEditor extends StatelessWidget {
//   final TemplateSection section;

//   const TemplateSectionEditor({super.key, required this.section});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(section.title),
//         Expanded(
//           child: ListView.builder(
//             itemCount: section.checks.length,
//             itemBuilder: (context, index) {
//               final check = section.checks[index];
//               return TemplateCheckEditor(check: check);
//             },
//           ),
//         ),
//         // Add buttons or other UI elements for adding new checks
//       ],
//     );
//   }
// }

// class TemplateCheckEditor extends StatelessWidget {
//   final TemplateCheck check;

//   const TemplateCheckEditor({super.key, required this.check});

//   @override
//   Widget build(BuildContext context) {
//     switch (check.runtimeType) {
//       case TemplateRegularCheck:
//         return TemplateRegularCheckWidget(
//             check: (check as TemplateRegularCheck));
//       case TemplateWithReferenceCheck:
//         return TemplateWithReferenceCheckWidget(
//             check: (check as TemplateWithReferenceCheck));
//       case TemplateLinearityCheckStep1Check:
//         return TemplateLinearityCheckStep1CheckWidget(
//             check: (check as TemplateLinearityCheckStep1Check));
//       case TemplateLinearityCheckStep2Check:
//         return TemplateLinearityCheckStep2CheckWidget(
//             check: (check as TemplateLinearityCheckStep2Check));
//       default:
//         throw UnsupportedError("Unknown check type ${check.runtimeType}");
//     }
//   }
// }

// class TemplateRegularCheckWidget extends StatefulWidget {
//   final TemplateRegularCheck check;

//   const TemplateRegularCheckWidget({Key? key, required this.check})
//       : super(key: key);

//   @override
//   State<TemplateRegularCheckWidget> createState() =>
//       _TemplateRegularCheckWidgetState();
// }

// class _TemplateRegularCheckWidgetState
//     extends State<TemplateRegularCheckWidget> {
//   late TextEditingController _descriptionController;

//   @override
//   void initState() {
//     super.initState();
//     _descriptionController =
//         TextEditingController(text: widget.check.description);
//   }

//   @override
//   void dispose() {
//     _descriptionController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: _descriptionController,
//       decoration: const InputDecoration(
//         labelText: 'Description',
//       ),
//       onChanged: (value) {
//         // Update the check description here if needed
//       },
//     );
//   }
// }

// class TemplateWithReferenceCheckWidget extends StatefulWidget {
//   final TemplateWithReferenceCheck check;

//   const TemplateWithReferenceCheckWidget({Key? key, required this.check})
//       : super(key: key);

//   @override
//   State<TemplateWithReferenceCheckWidget> createState() =>
//       _TemplateWithReferenceCheckWidgetState();
// }

// class _TemplateWithReferenceCheckWidgetState
//     extends State<TemplateWithReferenceCheckWidget> {
//   late TextEditingController _descriptionController;
//   late TextEditingController _referenceDescriptionController;

//   @override
//   void initState() {
//     super.initState();
//     _descriptionController =
//         TextEditingController(text: widget.check.description);
//     _referenceDescriptionController =
//         TextEditingController(text: widget.check.referenceDescription);
//   }

//   @override
//   void dispose() {
//     _descriptionController.dispose();
//     _referenceDescriptionController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextField(
//           controller: _descriptionController,
//           decoration: const InputDecoration(
//             labelText: 'Description',
//           ),
//           onChanged: (value) {
//             // Update the check description here if needed
//           },
//         ),
//         const SizedBox(height: 8.0),
//         TextField(
//           controller: _referenceDescriptionController,
//           decoration: const InputDecoration(
//             labelText: 'Reference Description',
//           ),
//           onChanged: (value) {
//             // Update the reference description here if needed
//           },
//         ),
//         // Add more UI elements if necessary
//       ],
//     );
//   }
// }

// class TemplateLinearityCheckStep1CheckWidget extends StatelessWidget {
//   final TemplateLinearityCheckStep1Check check;

//   const TemplateLinearityCheckStep1CheckWidget({Key? key, required this.check})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       child: const Text(
//         "Linearity check: step 1",
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

// class TemplateLinearityCheckStep2CheckWidget extends StatelessWidget {
//   final TemplateLinearityCheckStep2Check check;

//   const TemplateLinearityCheckStep2CheckWidget({Key? key, required this.check})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       child: const Text(
//         "Linearity check: step 2",
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
