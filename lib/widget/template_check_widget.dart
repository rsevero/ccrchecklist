import 'package:ccrchecklist/data/regular_check_reference.dart';
import 'package:ccrchecklist/data/template_check.dart';
import 'package:ccrchecklist/misc/constants.dart';
import 'package:ccrchecklist/misc/datetime_formater_helper.dart';
import 'package:ccrchecklist/misc/flutter_extension_methods.dart';
import 'package:ccrchecklist/store/template_editor_store.dart';
import 'package:ccrchecklist/theme/ccr_theme_extension.dart';
import 'package:ccrchecklist/widget/dialog_box_column_item.dart';
import 'package:ccrchecklist/widget/timer_duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numberpicker/numberpicker.dart';
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
        CCRThemeExtension ccrThemeExtension = context.ccrThemeExtension;

        final isSelected =
            (sectionIndex == templateEditorStore.selectedSectionIndex);
        final check = templateEditorStore.checks[sectionIndex][index];
        String description = check.description;
        String observation = '';
        if (check is TemplateRegularCheck) {
          final timer =
              ccrFormatSecondsToMinutesSecondsTimer(check.secondsTimer);
          description +=
              ' (Ref count: ${check.references.length} - Timer: $timer)';
          observation = check.observation.trim();
          if (observation.isNotEmpty) {
            observation = "Obs.: $observation";
          }
        } else if (check is TemplateCompleteLinearityCheck) {
          description +=
              ' (Complete linearity check - Measurement: ${check.measurement} - Ref count: ${check.referenceCount})';
        } else if (check is TemplateLinearityStep1Check) {
          description +=
              ' (Linearity step 1 - Ref count: ${check.referenceCount})';
        } else if (check is TemplateLinearityStep2Check) {
          description += ' (Linearity step 2)';
        }
        return Container(
          decoration: BoxDecoration(
            color: ccrThemeExtension.secondaryContainer,
            borderRadius: ccrTemplateListTileBorderRadius,
          ),
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text(
                    "${index + 1}: $description",
                    style: TextStyle(
                      color: isSelected
                          ? ccrThemeExtension.onPrimaryContainer
                          : ccrThemeExtension.onSurface,
                    ),
                  ),
                  subtitle: (observation.isNotEmpty)
                      ? Text(
                          observation,
                          style: TextStyle(
                            color: isSelected
                                ? ccrThemeExtension.onPrimaryContainer
                                : ccrThemeExtension.onSurface,
                          ),
                        )
                      : null,
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      switch (value) {
                        case 'Edit':
                          _editCheck(context, sectionIndex, index);
                          break;
                        case 'Duplicate':
                          _duplicateRegularCheck(context, sectionIndex, index);
                          break;
                        case 'Move to new page':
                          _moveCheckNewSection(context, sectionIndex, index);
                          break;
                        case 'Delete':
                          templateEditorStore.deleteCheck(sectionIndex, index);
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Edit',
                        child: Text('Edit'),
                      ),
                      if (check is TemplateRegularCheck)
                        const PopupMenuItem<String>(
                          value: 'Duplicate',
                          child: Text('Duplicate'),
                        ),
                      PopupMenuItem<String>(
                        value: 'Move to new page',
                        enabled: templateEditorStore.sections.length > 1,
                        child: const Text('Move to new page'),
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
          ),
        );
      },
    );
  }

  void _editTemplateRegularCheck(
      BuildContext context, int sectionIndex, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final templateEditorStore =
            Provider.of<TemplateEditorStore>(context, listen: false);
        final theme = context.ccrThemeExtension;
        final TemplateRegularCheck check = templateEditorStore
            .checks[sectionIndex][index] as TemplateRegularCheck;
        final TextEditingController descriptionController =
            TextEditingController(text: check.description);
        final TextEditingController observationController =
            TextEditingController(text: check.observation);
        int numberOfReferences = check.references.length;
        var (timerDurationMinutes, timerDurationSeconds) =
            ccrConvertSecondsToMinutesSeconds(check.secondsTimer);

        List<TextEditingController> prefixControllers = [
              TextEditingController(text: '')
            ] +
            List.generate(
                numberOfReferences,
                (i) =>
                    TextEditingController(text: check.references[i].prefix)) +
            List.generate(ccrMaxReferences - numberOfReferences,
                (i) => TextEditingController(text: ''));
        List<TextEditingController> suffixControllers = [
              TextEditingController(text: '')
            ] +
            List.generate(
                numberOfReferences,
                (i) =>
                    TextEditingController(text: check.references[i].suffix)) +
            List.generate(ccrMaxReferences - numberOfReferences,
                (i) => TextEditingController(text: ''));

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text(
                'Edit Regular Check',
                style: theme.dialogTitleTextTheme,
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DialogBoxColumnItem(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Description',
                              style: theme.dialogFieldTitleTextTheme,
                            ),
                            Text(
                              ' *',
                              style: theme.dialogFieldTitleTextTheme
                                  .copyWith(color: Colors.red),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: descriptionController,
                          style: theme.dialogFieldContentTextTheme,
                          decoration: InputDecoration(
                            hintText: 'Enter check description',
                            hintStyle: theme.dialogHintTextTheme,
                            border: OutlineInputBorder(),
                          ),
                          maxLines: null, // Makes the input field expandable
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          textCapitalization: TextCapitalization.sentences,
                          autofocus: true,
                        ),
                      ],
                    ),
                    DialogBoxColumnItem(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Observation',
                              style: theme.dialogFieldTitleTextTheme,
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: observationController,
                          style: theme.dialogFieldContentTextTheme,
                          decoration: InputDecoration(
                            hintText: 'Enter check observation',
                            hintStyle: theme.dialogHintTextTheme,
                            border: OutlineInputBorder(),
                          ),
                          maxLines: null, // Makes the input field expandable
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          textCapitalization: TextCapitalization.sentences,
                          autofocus: true,
                        ),
                      ],
                    ),
                    TimerDuration(
                      minutes: timerDurationMinutes,
                      seconds: timerDurationSeconds,
                      onMinutesChanged: (value) {
                        setState(() {
                          timerDurationMinutes = value;
                        });
                      },
                      onSecondsChanged: (value) {
                        setState(() {
                          timerDurationSeconds = value;
                        });
                      },
                    ),
                    DialogBoxColumnItem(children: [
                      Text(
                        'References',
                        style: theme.dialogFieldTitleTextTheme,
                      ),
                    ]),
                    ...List.generate(
                      ccrMaxReferences + 1,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 2,
                              child: Visibility(
                                visible:
                                    index > 0 && index <= numberOfReferences,
                                maintainSize: true,
                                maintainState: true,
                                maintainAnimation: true,
                                child: TextFormField(
                                  controller: prefixControllers[index],
                                  style: theme.dialogFieldContentTextTheme,
                                  decoration: InputDecoration(
                                    hintText: 'Prefix $index',
                                    hintStyle: theme.dialogHintTextTheme,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 90,
                              child: RadioListTile<int>(
                                title: Text('$index'),
                                value: index,
                                groupValue: numberOfReferences,
                                onChanged: (int? value) {
                                  setState(
                                      () => numberOfReferences = value ?? 0);
                                },
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Visibility(
                                visible:
                                    index > 0 && index <= numberOfReferences,
                                maintainSize: true,
                                maintainState: true,
                                maintainAnimation: true,
                                child: TextFormField(
                                  controller: suffixControllers[index],
                                  style: theme.dialogFieldContentTextTheme,
                                  decoration: InputDecoration(
                                    hintText: 'Suffix $index',
                                    hintStyle: theme.dialogHintTextTheme,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Update'),
                  onPressed: () {
                    final String newDescription =
                        descriptionController.text.trim();
                    final String newObservation =
                        observationController.text.trim();
                    final int totalSeconds =
                        (timerDurationMinutes * ccrSecondsInAMinute) +
                            timerDurationSeconds;

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
                        observation: newObservation,
                        references: newReferences,
                        timerDuration: totalSeconds);
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
      },
    );
  }

  void _editTemplateCompleteLinearityCheck(
      BuildContext context, int sectionIndex, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final templateEditorStore =
            Provider.of<TemplateEditorStore>(context, listen: false);
        final theme = context.ccrThemeExtension;
        final TemplateCompleteLinearityCheck check = templateEditorStore
            .checks[sectionIndex][index] as TemplateCompleteLinearityCheck;
        final TextEditingController measurementController =
            TextEditingController(text: check.measurement);
        final TextEditingController descriptionController =
            TextEditingController(text: check.description);
        int referenceCount = check.referenceCount;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Edit Complete Linearity Check'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DialogBoxColumnItem(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Measurement',
                              style: theme.dialogFieldTitleTextTheme,
                            ),
                            Text(
                              ' *',
                              style: theme.dialogFieldTitleTextTheme
                                  .copyWith(color: Colors.red),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: measurementController,
                          decoration: const InputDecoration(
                            hintText: 'Enter measurement name',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 1,
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          textCapitalization: TextCapitalization.sentences,
                          autofocus: true,
                        ),
                      ],
                    ),
                    DialogBoxColumnItem(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Description',
                              style: theme.dialogFieldTitleTextTheme,
                            ),
                            Text(
                              ' *',
                              style: theme.dialogFieldTitleTextTheme
                                  .copyWith(color: Colors.red),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            hintText: 'Enter check description',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: null,
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          textCapitalization: TextCapitalization.sentences,
                          autofocus: true,
                        ),
                      ],
                    ),
                    DialogBoxColumnItem(
                      children: [
                        Text(
                          'Amount of references',
                          style: theme.dialogFieldTitleTextTheme,
                        ),
                      ],
                    ),
                    NumberPicker(
                      value: referenceCount,
                      minValue: 1,
                      maxValue: ccrMaxLinearityMeasurements,
                      infiniteLoop: true,
                      onChanged: (value) {
                        setState(() => referenceCount = value);
                      },
                      decoration: BoxDecoration(
                        borderRadius: ccrTemplateListTileBorderRadius,
                        border: Border.all(
                            color: context.ccrThemeExtension.outline),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Update'),
                  onPressed: () {
                    final newDescription = descriptionController.text.trim();
                    final newMeasurement = measurementController.text.trim();

                    templateEditorStore.updateCompleteLinearityCheck(
                      sectionIndex,
                      index,
                      referenceCount: referenceCount,
                      description: newDescription,
                      measurement: newMeasurement,
                    );
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

  void _editTemplateLinearityStep1Check(
      BuildContext context, int sectionIndex, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final templateEditorStore =
            Provider.of<TemplateEditorStore>(context, listen: false);
        final TemplateLinearityStep1Check check = templateEditorStore
            .checks[sectionIndex][index] as TemplateLinearityStep1Check;
        final TextEditingController measurementController =
            TextEditingController(text: check.measurement);
        final TextEditingController descriptionController =
            TextEditingController(text: check.description);
        int referenceCount = check.referenceCount;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Edit Linearity Step 1 Check'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DialogBoxColumnItem(
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Measurement',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              ' *',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: measurementController,
                          decoration: const InputDecoration(
                            hintText: 'Enter measurement name',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: null,
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          textCapitalization: TextCapitalization.sentences,
                          autofocus: true,
                        ),
                      ],
                    ),
                    DialogBoxColumnItem(
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              ' *',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            hintText: 'Enter check description',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: null,
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          textCapitalization: TextCapitalization.sentences,
                          autofocus: true,
                        ),
                      ],
                    ),
                    DialogBoxColumnItem(children: [
                      Text('Amount of references'),
                    ]),
                    NumberPicker(
                      value: referenceCount,
                      minValue: 1,
                      maxValue: ccrMaxLinearityMeasurements,
                      infiniteLoop: true,
                      onChanged: (value) {
                        setState(() => referenceCount = value);
                      },
                      decoration: BoxDecoration(
                        borderRadius: ccrTemplateListTileBorderRadius,
                        border: Border.all(
                            color: context.ccrThemeExtension.outline),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Update'),
                  onPressed: () {
                    final newDescription = descriptionController.text.trim();
                    final newMeasurement = measurementController.text.trim();

                    templateEditorStore.updateLinearityStep1Check(
                      sectionIndex,
                      index,
                      referenceCount: referenceCount,
                      measurement: newMeasurement,
                      description: newDescription,
                    );
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

  void _editTemplateLinearityStep2Check(
      BuildContext context, int sectionIndex, int index) {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    final TemplateLinearityStep2Check check = templateEditorStore
        .checks[sectionIndex][index] as TemplateLinearityStep2Check;
    final TextEditingController descriptionController =
        TextEditingController(text: check.description);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          // Use StatefulBuilder to manage local state of radio buttons
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Edit Linearity Step 2 Check'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DialogBoxColumnItem(
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              ' *', // Red asterisk with preceding space for separation
                              style: TextStyle(
                                color: Colors.red,
                                fontSize:
                                    16, // Adjust the font size to match the label
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            hintText: 'Enter check description',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: null,
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          textCapitalization: TextCapitalization.sentences,
                          autofocus: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Update'),
                  onPressed: () {
                    final newDescription = descriptionController.text.trim();
                    templateEditorStore.updateLinearityStep2Check(
                        sectionIndex, index,
                        description: newDescription);
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
      BuildContext context, int sectionIndex, int checkIndex) {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
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

  void _duplicateRegularCheck(
    BuildContext context,
    int sectionIndex,
    int index,
  ) {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    final check = templateEditorStore.checks[sectionIndex][index];

    if (check is! TemplateRegularCheck) {
      return;
    }

    templateEditorStore.addRegularCheck(
      description: check.description,
      observation: check.observation,
      secondsTimer: check.secondsTimer,
      references: check.references,
    );
  }

  void _editCheck(BuildContext context, int sectionIndex, int index) {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    final check = templateEditorStore.checks[sectionIndex][index];

    if (check is TemplateRegularCheck) {
      _editTemplateRegularCheck(context, sectionIndex, index);
    } else if (check is TemplateCompleteLinearityCheck) {
      _editTemplateCompleteLinearityCheck(context, sectionIndex, index);
    } else if (check is TemplateLinearityStep1Check) {
      _editTemplateLinearityStep1Check(context, sectionIndex, index);
    } else if (check is TemplateLinearityStep2Check) {
      _editTemplateLinearityStep2Check(context, sectionIndex, index);
    } else {
      throw Exception('Unknown check type');
    }
  }
}
