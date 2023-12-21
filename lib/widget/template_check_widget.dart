import 'package:ccr_checklist/data/regular_check_reference.dart';
import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/misc/helper_functions.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TemplateCheckWidget extends StatelessWidget {
  final int index;
  final int sectionIndex;

  const TemplateCheckWidget({
    super.key,
    required this.sectionIndex,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final templateEditorStore = Provider.of<TemplateEditorStore>(context);

    return Observer(
      builder: (_) {
        final check = templateEditorStore.checks[sectionIndex][index];
        String description = check.description;
        if (check is TemplateRegularCheck) {
          final timer =
              ccrFormatSecondsToMinutesSecondsTimer(check.secondsTimer);
          description +=
              ' (Ref count: ${check.references.length} - Timer: $timer)';
        } else if (check is TemplateLinearityStep1Check) {
          description += ' (Ref count: ${check.referenceCount})';
        }
        return Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text(description),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    switch (value) {
                      case 'Edit':
                        _editCheck(
                            context, templateEditorStore, sectionIndex, index);
                        break;
                      case 'Move to new section':
                        _moveCheckNewSection(
                            context, templateEditorStore, sectionIndex, index);
                        break;
                      case 'Delete':
                        templateEditorStore.deleteCheck(sectionIndex, index);
                        break;
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'Edit',
                      enabled: templateEditorStore.checks[sectionIndex][index]
                          is! TemplateLinearityStep2Check,
                      child: const Text('Edit'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Move to new section',
                      enabled: templateEditorStore.sections.length > 1,
                      child: const Text('Move to new section'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Delete',
                      child: Text('Delete'),
                    ),
                  ],
                ),
              ),
            ),
            ReorderableDragStartListener(
              index: index,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.drag_handle),
              ),
            )
          ],
        );
      },
    );
  }

  void _editTemplateRegularCheck(BuildContext context,
      TemplateEditorStore templateEditorStore, int sectionIndex, int index) {
    final TextEditingController descriptionController = TextEditingController();
    final TemplateRegularCheck check =
        templateEditorStore.checks[sectionIndex][index] as TemplateRegularCheck;
    descriptionController.text = check.description;
    int numberOfReferences = check.references.length;
    Duration timerDuration = Duration(seconds: check.secondsTimer);

    // Initialize prefix and suffix controllers
    List<TextEditingController> prefixControllers = [
          TextEditingController(text: '')
        ] +
        List.generate(numberOfReferences,
            (i) => TextEditingController(text: check.references[i].prefix)) +
        List.generate(ccrMaxReferences - numberOfReferences,
            (i) => TextEditingController(text: ''));
    List<TextEditingController> suffixControllers = [
          TextEditingController(text: '')
        ] +
        List.generate(numberOfReferences,
            (i) => TextEditingController(text: check.references[i].suffix)) +
        List.generate(ccrMaxReferences - numberOfReferences,
            (i) => TextEditingController(text: ''));

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Regular Check'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                          hintText: 'Enter check description'),
                      autofocus: true,
                    ),
                    ListTile(
                      title: const Text('Set Timer Duration'),
                      subtitle: Text(ccrFormatSecondsToMinutesSecondsTimer(
                          timerDuration.inSeconds)),
                      onTap: () async {
                        final TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                              hour: timerDuration.inMinutes,
                              minute: timerDuration.inSeconds % 60),
                        );
                        if (pickedTime != null) {
                          setState(() {
                            timerDuration = Duration(
                                minutes: pickedTime.hour,
                                seconds: pickedTime.minute);
                          });
                        }
                      },
                    ),
                    if (numberOfReferences > 0)
                      const Text(
                          'References prefixes and suffixes are optional'),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Amount of references'),
                    ),
                    ...List.generate(
                      ccrMaxReferences + 1,
                      (index) => Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Visibility(
                              visible: index > 0 && index <= numberOfReferences,
                              maintainSize: true,
                              maintainState: true,
                              maintainAnimation: true,
                              child: TextFormField(
                                controller: prefixControllers[index],
                                decoration:
                                    InputDecoration(hintText: 'Prefix $index'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: RadioListTile<int>(
                              title: Text('$index'),
                              value: index,
                              groupValue: numberOfReferences,
                              onChanged: (int? value) {
                                setState(() => numberOfReferences = value ?? 0);
                              },
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Visibility(
                              visible: index > 0 && index <= numberOfReferences,
                              maintainSize: true,
                              maintainState: true,
                              maintainAnimation: true,
                              child: TextFormField(
                                controller: suffixControllers[index],
                                decoration:
                                    InputDecoration(hintText: 'Suffix $index'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                final newDescription = descriptionController.text;
                List<RegularCheckReference> newReferences = List.generate(
                  numberOfReferences,
                  (i) => RegularCheckReference(
                    prefix: i < prefixControllers.length
                        ? prefixControllers[i + 1].text
                        : '',
                    suffix: i < suffixControllers.length
                        ? suffixControllers[i + 1].text
                        : '',
                  ),
                );
                templateEditorStore.updateRegularCheck(sectionIndex, index,
                    description: newDescription,
                    references: newReferences,
                    timerDuration: timerDuration.inSeconds);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _editTemplateLinearityStep1Check(BuildContext context,
      TemplateEditorStore templateEditorStore, int sectionIndex, int index) {
    final check = (templateEditorStore.checks[sectionIndex][index]
        as TemplateLinearityStep1Check);
    int referenceCount = check.referenceCount;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          // Use StatefulBuilder to manage local state of radio buttons
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Edit Section'),
              content: SingleChildScrollView(
                // For better layout management
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Linearity Step 1'),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                          'Amount of references'), // Label for the radio buttons
                    ),
                    ...List.generate(
                      5,
                      (index) => RadioListTile<int>(
                        title: Text('${index + 1}'),
                        value: index + 1,
                        groupValue: referenceCount,
                        onChanged: (int? value) {
                          if (value != null) {
                            setState(() => (referenceCount = value));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Update'),
                  onPressed: () {
                    templateEditorStore.updateLinearityStep1Check(
                        sectionIndex, index, referenceCount);
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _moveCheckNewSection(
      BuildContext context,
      TemplateEditorStore templateEditorStore,
      int sectionIndex,
      int checkIndex) {
    int? selectedNewSectionIndex;

    if (templateEditorStore.sections.length == 2) {
      // If there are only 2 sections, the other section is the destination
      selectedNewSectionIndex = (sectionIndex == 0) ? 1 : 0;
      templateEditorStore.moveCheckToAnotherSection(
          sectionIndex, checkIndex, selectedNewSectionIndex);
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          // Using StatefulBuilder to manage local state
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Move Check to New Section'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    for (int i = 0;
                        i < templateEditorStore.sections.length;
                        i++)
                      if (i != sectionIndex) // Exclude the current section
                        RadioListTile<int>(
                          title: Text(templateEditorStore.sections[i].title),
                          value: i,
                          groupValue: selectedNewSectionIndex,
                          onChanged: (int? value) {
                            setState(() {
                              // Update the local state
                              selectedNewSectionIndex = value;
                            });
                          },
                        ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Update'),
                  onPressed: () {
                    if (selectedNewSectionIndex != null) {
                      templateEditorStore.moveCheckToAnotherSection(
                          sectionIndex, checkIndex, selectedNewSectionIndex!);
                      Navigator.of(context).pop();
                    }
                  },
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _editCheck(BuildContext context, TemplateEditorStore templateEditorStore,
      int sectionIndex, int index) {
    final check = templateEditorStore.checks[sectionIndex][index];

    if (check is TemplateRegularCheck) {
      _editTemplateRegularCheck(
          context, templateEditorStore, sectionIndex, index);
    } else if (check is TemplateLinearityStep1Check) {
      _editTemplateLinearityStep1Check(
          context, templateEditorStore, sectionIndex, index);
    } else if (check is TemplateLinearityStep2Check) {
      return;
    } else {
      throw Exception('Unknown check type');
    }
  }
}
