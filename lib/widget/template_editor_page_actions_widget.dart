import 'package:ccr_checklist/data/regular_check_reference.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/misc/datetime_formater_helper.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/widget/greyable_speed_dial_child_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

class TemplateEditorPageActionsWidget extends StatelessWidget {
  const TemplateEditorPageActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final templateEditorStore = Provider.of<TemplateEditorStore>(context);

    return Observer(
      builder: (_) {
        return SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          tooltip: 'Options',
          children: [
            GreyableSpeedDialChild(
              child: const Icon(Icons.linear_scale),
              text: 'Add Linearity Step 2 Check',
              isEnabled: templateEditorStore.enableLinearityStep2Creation,
              onTap: () => _onTapAddLinearityStep2Check(context),
            ),
            GreyableSpeedDialChild(
              child: const Icon(Icons.linear_scale_rounded),
              text: 'Add Linearity Step 1 Check',
              isEnabled: templateEditorStore.enableLinearityStep1Creation,
              onTap: () => _onTapAddLinearityStep1Check(context),
            ),
            GreyableSpeedDialChild(
              child: const Icon(Icons.check),
              text: 'Add Regular Check',
              isEnabled: templateEditorStore.enableCheckCreation,
              onTap: () => _onTapAddRegularCheck(context),
            ),
            GreyableSpeedDialChild(
              child: const Icon(Icons.add),
              text: 'Add New Section',
              isEnabled: true,
              onTap: () => _onTapAddNewSection(context),
            ),
            GreyableSpeedDialChild(
              child: const Icon(Icons.edit_attributes),
              text: 'Edit Template',
              isEnabled: true,
              onTap: () => _onTapEditTemplate(context),
            ),
          ],
        );
      },
    );
  }

  void _onTapEditTemplate(BuildContext context) {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    final TextEditingController rebreatherManufacturerController =
        TextEditingController(
            text: templateEditorStore.currentTemplate.rebreatherManufacturer);
    final TextEditingController rebreatherModelController =
        TextEditingController(
            text: templateEditorStore.currentTemplate.rebreatherModel);
    final TextEditingController titleController =
        TextEditingController(text: templateEditorStore.currentTemplate.title);
    final TextEditingController descriptionController = TextEditingController(
        text: templateEditorStore.currentTemplate.description);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Template'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: rebreatherManufacturerController,
                  decoration: const InputDecoration(
                      labelText: 'Rebreather Manufacturer'),
                  autofocus: true,
                ),
                TextFormField(
                  controller: rebreatherModelController,
                  decoration:
                      const InputDecoration(labelText: 'Rebreather Model'),
                ),
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Update'),
              onPressed: () => _onPressedUpdateTemplate(
                context: context,
                rebreatherManufacturer:
                    rebreatherManufacturerController.text.trim(),
                rebreatherModel: rebreatherModelController.text.trim(),
                title: titleController.text.trim(),
                description: descriptionController.text.trim(),
              ),
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
  }

  void _onPressedUpdateTemplate({
    required BuildContext context,
    required String rebreatherManufacturer,
    required String rebreatherModel,
    required String title,
    required String description,
  }) {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    templateEditorStore.updateTemplate(
      rebreatherManufacturer: rebreatherManufacturer,
      rebreatherModel: rebreatherModel,
      title: title,
      description: description,
    );

    Navigator.of(context).pop();
  }

  void _onTapAddNewSection(BuildContext context) async {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    final TextEditingController titleController = TextEditingController();
    final GlobalKey<FormState> formKey =
        GlobalKey<FormState>(); // Add a GlobalKey for the Form

    // Show a dialog to enter the section title
    bool confirmed = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('New Section'),
              content: Form(
                key: formKey,
                child: TextFormField(
                  controller: titleController,
                  decoration:
                      const InputDecoration(hintText: 'Enter title here'),
                  autofocus: true,
                  onFieldSubmitted: (value) {
                    Navigator.of(context)
                        .pop(true); // Trigger when Enter is pressed
                  },
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Create'),
                  onPressed: () {
                    Navigator.of(context).pop(true); // Dismiss and return true
                  },
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    if (!context.mounted) return;
                    Navigator.of(context)
                        .pop(false); // Dismiss and return false
                  },
                ),
              ],
            );
          },
        ) ??
        false; // Handle null (dialog dismissed)

    if (confirmed) {
      final title = titleController.text.trim();
      if (title.isNotEmpty) {
        templateEditorStore.addSection(title: title);
      }
    }
  }

  void _onTapAddLinearityStep1Check(BuildContext context) {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    final TextEditingController descriptionController = TextEditingController();

    int numberOfReferences = 1; // Default value

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add step 1 of Linearity Check'),
          content: StatefulBuilder(
            // Use StatefulBuilder to update the dialog's state
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: ccrDescriptionFieldWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 16, // Adjust the font size as needed
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
                          maxLines: null, // Makes the input field expandable
                          minLines:
                              1, // Minimum lines the TextFormField will take
                          keyboardType: TextInputType
                              .multiline, // Keyboard type for multiline input
                          textCapitalization: TextCapitalization
                              .sentences, // Capitalize first letter of sentences
                          autofocus: true,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                        'Amount of references'), // Label for the radio buttons
                  ),
                  ...List.generate(
                    ccrMaxReferences,
                    (index) => RadioListTile<int>(
                      title: Text('${index + 1}'),
                      value: index + 1,
                      groupValue: numberOfReferences,
                      onChanged: (int? value) {
                        if (value != null) {
                          setState(() => numberOfReferences = value);
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Create'),
              onPressed: () {
                final description = descriptionController.text;
                if (description.isNotEmpty) {
                  templateEditorStore.addLinearityStep1Check(
                    description: description,
                    referenceCount: numberOfReferences,
                  );
                  Navigator.of(context).pop();
                }
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

  void _onTapAddLinearityStep2Check(BuildContext context) {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    final TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add step 2 of Linearity Check'),
          content: StatefulBuilder(
            // Use StatefulBuilder to update the dialog's state
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: ccrDescriptionFieldWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 16, // Adjust the font size as needed
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
                          maxLines: null, // Makes the input field expandable
                          minLines:
                              1, // Minimum lines the TextFormField will take
                          keyboardType: TextInputType
                              .multiline, // Keyboard type for multiline input
                          textCapitalization: TextCapitalization
                              .sentences, // Capitalize first letter of sentences
                          autofocus: true,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Create'),
              onPressed: () {
                final description = descriptionController.text;
                if (description.isNotEmpty) {
                  templateEditorStore.addLinearityStep2Check(
                    description: description,
                  );
                  Navigator.of(context).pop();
                }
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

  void _onTapAddRegularCheck(BuildContext context) {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController observationController = TextEditingController();
    int numberOfReferences = 0;
    Duration timerDuration = Duration.zero; // Default values
    final List<TextEditingController> prefixControllers =
        List.generate(ccrMaxReferences + 1, (_) => TextEditingController());
    final List<TextEditingController> suffixControllers =
        List.generate(ccrMaxReferences + 1, (_) => TextEditingController());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Add Check with References'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: ccrDescriptionFieldWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Description',
                                style: TextStyle(
                                  fontSize:
                                      16, // Adjust the font size as needed
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
                            maxLines: null, // Makes the input field expandable
                            minLines:
                                1, // Minimum lines the TextFormField will take
                            keyboardType: TextInputType
                                .multiline, // Keyboard type for multiline input
                            textCapitalization: TextCapitalization
                                .sentences, // Capitalize first letter of sentences
                            autofocus: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: ccrDescriptionFieldWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Observation',
                                style: TextStyle(
                                  fontSize:
                                      16, // Adjust the font size as needed
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: observationController,
                            decoration: const InputDecoration(
                              hintText: 'Enter check observation',
                              border: OutlineInputBorder(),
                            ),
                            maxLines: null, // Makes the input field expandable
                            minLines:
                                1, // Minimum lines the TextFormField will take
                            keyboardType: TextInputType
                                .multiline, // Keyboard type for multiline input
                            textCapitalization: TextCapitalization
                                .sentences, // Capitalize first letter of sentences
                            autofocus: true,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Amount of references'),
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
                          setState(
                            () {
                              timerDuration = Duration(
                                  minutes: pickedTime.hour,
                                  seconds: pickedTime.minute);
                            },
                          );
                        }
                      },
                    ),
                    if (numberOfReferences > 0)
                      const Text(
                          'References prefixes and suffixes are optional'),
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
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Create'),
                  onPressed: () {
                    final description = descriptionController.text;
                    final observation = observationController.text;
                    if (description.isNotEmpty) {
                      List<RegularCheckReference> references = List.generate(
                        numberOfReferences,
                        (i) => RegularCheckReference(
                          prefix: prefixControllers[i + 1].text,
                          suffix: suffixControllers[i + 1].text,
                        ),
                      );
                      templateEditorStore.addRegularCheck(
                        description: description,
                        observation: observation,
                        references: references,
                        secondsTimer: timerDuration.inSeconds,
                      );
                      Navigator.of(context).pop();
                    }
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
}
