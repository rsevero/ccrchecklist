import 'package:ccr_checklist/data/regular_check_reference.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/misc/datetime_formater_helper.dart';
import 'package:ccr_checklist/misc/flutter_extension_methods.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/widget/greyable_speed_dial_child_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:numberpicker/numberpicker.dart';
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
              child: const Icon(Icons.calculate_outlined),
              text: 'Add Linearity Step 2 Check',
              isEnabled: templateEditorStore.enableLinearityStep2Creation,
              onTap: () => _onTapAddLinearityStep2Check(context),
            ),
            GreyableSpeedDialChild(
              child: const Icon(Icons.addchart),
              text: 'Add Linearity Step 1 Check',
              isEnabled: templateEditorStore.enableLinearityStep1Creation,
              onTap: () => _onTapAddLinearityStep1Check(context),
            ),
            GreyableSpeedDialChild(
              child: const Icon(Icons.table_view),
              text: 'Add Complete Linearity Check',
              isEnabled: templateEditorStore.enableCheckCreation,
              onTap: () => _onTapAddCompleteLinearityCheck(context),
            ),
            GreyableSpeedDialChild(
              child: const Icon(Icons.check),
              text: 'Add Regular Check',
              isEnabled: templateEditorStore.enableCheckCreation,
              onTap: () => _onTapAddRegularCheck(context),
            ),
            GreyableSpeedDialChild(
              child: const Icon(Icons.assignment_add),
              text: 'Add Page',
              isEnabled: true,
              onTap: () => _onTapAddSection(context),
            ),
            GreyableSpeedDialChild(
              child: const Icon(Icons.edit_attributes),
              text: 'Edit Info',
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
          title: Text(
            'Edit Info',
            style: context.ccrThemeExtension.dialogTitleTextTheme,
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: rebreatherManufacturerController,
                  style: context.ccrThemeExtension.dialogFieldContentTextTheme,
                  decoration: InputDecoration(
                    labelText: 'Rebreather Manufacturer',
                    labelStyle:
                        context.ccrThemeExtension.dialogFieldTitleTextTheme,
                  ),
                  autofocus: true,
                ),
                TextFormField(
                  controller: rebreatherModelController,
                  style: context.ccrThemeExtension.dialogFieldContentTextTheme,
                  decoration: InputDecoration(
                    labelText: 'Rebreather Model',
                    labelStyle:
                        context.ccrThemeExtension.dialogFieldTitleTextTheme,
                  ),
                ),
                TextFormField(
                  controller: titleController,
                  style: context.ccrThemeExtension.dialogFieldContentTextTheme,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle:
                        context.ccrThemeExtension.dialogFieldTitleTextTheme,
                  ),
                ),
                TextFormField(
                  controller: descriptionController,
                  style: context.ccrThemeExtension.dialogFieldContentTextTheme,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle:
                        context.ccrThemeExtension.dialogFieldTitleTextTheme,
                  ),
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
      rebreatherManufacturer: rebreatherManufacturer.trim(),
      rebreatherModel: rebreatherModel.trim(),
      title: title.trim(),
      description: description.trim(),
    );

    Navigator.of(context).pop();
  }

  void _onTapAddSection(BuildContext context) async {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    final TextEditingController titleController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'New Page',
            style: context.ccrThemeExtension.dialogTitleTextTheme,
          ),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: titleController,
              style: context.ccrThemeExtension.dialogFieldContentTextTheme,
              decoration: InputDecoration(
                hintText: 'Enter title here',
                hintStyle: context.ccrThemeExtension.dialogHintTextTheme,
              ),
              autofocus: true,
              onFieldSubmitted: (value) {
                Navigator.of(context).pop(true);
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Create+'),
              onPressed: () {
                final title = titleController.text.trim();
                if (title.isNotEmpty) {
                  templateEditorStore.addSection(title: title);
                }
                titleController.text = '';
              },
            ),
            TextButton(
              child: const Text('Create'),
              onPressed: () {
                final title = titleController.text.trim();
                if (title.isNotEmpty) {
                  templateEditorStore.addSection(title: title);
                }
                Navigator.of(context).pop(true);
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }

  void _onTapAddCompleteLinearityCheck(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final templateEditorStore =
            Provider.of<TemplateEditorStore>(context, listen: false);
        final theme = context.ccrThemeExtension;
        final TextEditingController measurementController =
            TextEditingController();
        final TextEditingController descriptionController =
            TextEditingController();

        int referenceCount = 1;

        return AlertDialog(
          title: Text(
            'Add Complete Linearity Check',
            style: context.ccrThemeExtension.dialogTitleTextTheme,
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: ccrDescriptionFieldWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Measurement name',
                                style: theme.dialogFieldTitleTextTheme,
                              ),
                              Text(
                                ' *',
                                style: theme.dialogFieldTitleTextTheme.copyWith(
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: measurementController,
                            style: theme.dialogFieldContentTextTheme,
                            decoration: InputDecoration(
                              hintText: 'Enter the name of the measurement',
                              hintStyle: theme.dialogHintTextTheme,
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
                    ),
                    SizedBox(
                      width: ccrDescriptionFieldWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Description',
                                style: theme.dialogFieldTitleTextTheme,
                              ),
                              Text(
                                ' *',
                                style: theme.dialogFieldTitleTextTheme.copyWith(
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
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
                            maxLines: null,
                            minLines: 1,
                            keyboardType: TextInputType.multiline,
                            textCapitalization: TextCapitalization.sentences,
                            autofocus: true,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'References',
                          style: theme.dialogFieldTitleTextTheme,
                        ),
                      ),
                    ),
                    NumberPicker(
                      value: referenceCount,
                      minValue: 1,
                      maxValue: ccrMaxLinearityMeasurements,
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
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Create'),
              onPressed: () {
                final description = descriptionController.text.trim();
                final measurement = measurementController.text.trim();
                if (description.isNotEmpty) {
                  templateEditorStore.addCompleteLinearityCheck(
                    measurement: measurement,
                    description: description,
                    referenceCount: referenceCount,
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

  void _onTapAddLinearityStep1Check(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final templateEditorStore =
            Provider.of<TemplateEditorStore>(context, listen: false);
        final TextEditingController descriptionController =
            TextEditingController();

        int referenceCount = 1;

        return AlertDialog(
          title: Text(
            'Add step 1 of Linearity Check',
            style: context.ccrThemeExtension.dialogTitleTextTheme,
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: ccrDescriptionFieldWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Description',
                                style: context.ccrThemeExtension
                                    .dialogFieldTitleTextTheme,
                              ),
                              Text(
                                ' *',
                                style: context
                                    .ccrThemeExtension.dialogFieldTitleTextTheme
                                    .copyWith(
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: descriptionController,
                            style: context
                                .ccrThemeExtension.dialogFieldContentTextTheme,
                            decoration: InputDecoration(
                              hintText: 'Enter check description',
                              hintStyle:
                                  context.ccrThemeExtension.dialogHintTextTheme,
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'References',
                          style: context
                              .ccrThemeExtension.dialogFieldTitleTextTheme,
                        ),
                      ),
                    ),
                    NumberPicker(
                      value: referenceCount,
                      minValue: 1,
                      maxValue: ccrMaxLinearityMeasurements,
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
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Create'),
              onPressed: () {
                final description = descriptionController.text.trim();
                if (description.isNotEmpty) {
                  templateEditorStore.addLinearityStep1Check(
                    description: description,
                    referenceCount: referenceCount,
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
          title: Text(
            'Add step 2 of Linearity Check',
            style: context.ccrThemeExtension.dialogTitleTextTheme,
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: ccrDescriptionFieldWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Description',
                              style: context
                                  .ccrThemeExtension.dialogFieldTitleTextTheme,
                            ),
                            Text(
                              ' *',
                              style: context
                                  .ccrThemeExtension.dialogFieldTitleTextTheme
                                  .copyWith(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            hintText: 'Enter check description',
                            hintStyle:
                                context.ccrThemeExtension.dialogHintTextTheme,
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
                  ),
                ],
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Create'),
              onPressed: () {
                final description = descriptionController.text.trim();
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
    Duration timerDuration = Duration.zero;
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
              title: Text(
                'Add Check with References',
                style: context.ccrThemeExtension.dialogTitleTextTheme,
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: ccrDescriptionFieldWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Description',
                                style: context.ccrThemeExtension
                                    .dialogFieldTitleTextTheme,
                              ),
                              Text(
                                ' *',
                                style: context
                                    .ccrThemeExtension.dialogFieldTitleTextTheme
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: descriptionController,
                            style: context
                                .ccrThemeExtension.dialogFieldContentTextTheme,
                            decoration: InputDecoration(
                              hintText: 'Enter check description',
                              hintStyle:
                                  context.ccrThemeExtension.dialogHintTextTheme,
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
                    ),
                    SizedBox(
                      width: ccrDescriptionFieldWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Observation',
                                style: context.ccrThemeExtension
                                    .dialogFieldTitleTextTheme,
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: observationController,
                            style: context
                                .ccrThemeExtension.dialogFieldContentTextTheme,
                            decoration: InputDecoration(
                              hintText: 'Enter check observation',
                              hintStyle:
                                  context.ccrThemeExtension.dialogHintTextTheme,
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
                    ),
                    SizedBox(
                      width: ccrDescriptionFieldWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Timer Duration',
                            style: context
                                .ccrThemeExtension.dialogFieldTitleTextTheme,
                          ),
                          InkWell(
                            onTap: () async {
                              final TimeOfDay? pickedTime =
                                  await showTimePicker(
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
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                ccrFormatSecondsToMinutesSecondsTimer(
                                    timerDuration.inSeconds),
                                style: context
                                    .ccrThemeExtension.dialogHintTextTheme
                                    .copyWith(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'References',
                          style: context
                              .ccrThemeExtension.dialogFieldTitleTextTheme,
                        ),
                      ),
                    ),
                    if (numberOfReferences > 0)
                      Text(
                        'References prefixes and suffixes are optional',
                        style: context.ccrThemeExtension.dialogHintTextTheme,
                      ),
                    ...List.generate(
                      ccrMaxReferences + 1,
                      (index) => Column(
                        children: [
                          RadioListTile<int>(
                            title: Text(
                              '$index',
                              style: context.ccrThemeExtension
                                  .dialogFieldContentTextTheme,
                            ),
                            value: index,
                            groupValue: numberOfReferences,
                            onChanged: (int? value) {
                              setState(() => numberOfReferences = value ?? 0);
                            },
                          ),
                          Visibility(
                            visible: index > 0 && index <= numberOfReferences,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: prefixControllers[index],
                                    style: context.ccrThemeExtension
                                        .dialogFieldContentTextTheme,
                                    decoration: InputDecoration(
                                        hintText: 'Prefix $index'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: suffixControllers[index],
                                    style: context.ccrThemeExtension
                                        .dialogFieldContentTextTheme,
                                    decoration: InputDecoration(
                                        hintText: 'Suffix $index'),
                                  ),
                                ),
                              ],
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
                  child: const Text('Create+'),
                  onPressed: () {
                    final description = descriptionController.text.trim();
                    final observation = observationController.text.trim();
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
                    }
                    setState(() {
                      descriptionController.text = '';
                      observationController.text = '';
                      numberOfReferences = 0;
                      timerDuration = Duration.zero;

                      prefixControllers.clear();
                      suffixControllers.clear();
                      prefixControllers.addAll(
                        List.generate(ccrMaxReferences + 1,
                            (_) => TextEditingController()),
                      );
                      suffixControllers.addAll(
                        List.generate(ccrMaxReferences + 1,
                            (_) => TextEditingController()),
                      );
                    });
                  },
                ),
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
                    }
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
}
