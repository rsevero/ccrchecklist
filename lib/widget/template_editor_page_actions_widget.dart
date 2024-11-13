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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final templateEditorStore =
            Provider.of<TemplateEditorStore>(context, listen: false);
        final theme = context.ccrThemeExtension;
        final TextEditingController descriptionController =
            TextEditingController();
        final TextEditingController observationController =
            TextEditingController();

        final List<TextEditingController> prefixControllers =
            List.generate(ccrMaxReferences + 1, (_) => TextEditingController());
        final List<TextEditingController> suffixControllers =
            List.generate(ccrMaxReferences + 1, (_) => TextEditingController());

        int numberOfReferences = 0;
        int timerDurationSeconds = 0;
        int timerDurationMinutes = 0;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text(
                'Add Regular Check',
                style: theme.dialogTitleTextTheme,
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
                    ),
                    SizedBox(
                      width: ccrDescriptionFieldWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Timer Duration',
                            style: theme.dialogFieldTitleTextTheme,
                          ),
                          Row(
                            children: [
                              // NumberPicker for minutes
                              Column(
                                children: [
                                  const Text('minutes'),
                                  NumberPicker(
                                    value: timerDurationMinutes,
                                    minValue: 0,
                                    maxValue: 99,
                                    onChanged: (value) {
                                      setState(() {
                                        timerDurationMinutes = value;
                                      });
                                    },
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          ccrTemplateListTileBorderRadius,
                                      border: Border.all(
                                          color: context
                                              .ccrThemeExtension.outline),
                                    ),
                                  ),
                                  const Text('minutes'),
                                ],
                              ),
                              Text(
                                ':',
                                style: theme.timerTextTheme,
                              ),
                              // NumberPicker for seconds
                              Column(
                                children: [
                                  const Text('seconds'),
                                  NumberPicker(
                                    value: timerDurationSeconds,
                                    minValue: 0,
                                    maxValue: 59,
                                    onChanged: (value) {
                                      setState(() {
                                        timerDurationSeconds = value;
                                      });
                                    },
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          ccrTemplateListTileBorderRadius,
                                      border: Border.all(
                                          color: context
                                              .ccrThemeExtension.outline),
                                    ),
                                  ),
                                  const Text('seconds'),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 8, left: 8),
                                child: Text(
                                  ccrFormatMinutesSecondsToMinutesSecondsTimer(
                                    timerDurationMinutes,
                                    timerDurationSeconds,
                                  ),
                                  style: theme.dialogHintTextTheme.copyWith(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
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
                          style: theme.dialogFieldTitleTextTheme,
                        ),
                      ),
                    ),
                    if (numberOfReferences > 0)
                      Text(
                        'References prefixes and suffixes are optional',
                        style: theme.dialogHintTextTheme,
                      ),
                    ...List.generate(
                      ccrMaxReferences + 1,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: theme.onSurface,
                              width: 1,
                            ),
                            borderRadius: ccrTemplateListTileBorderRadius,
                          ),
                          padding: const EdgeInsets.only(
                            bottom: 8,
                            left: 8,
                            right: 8,
                          ),
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
                                    decoration: InputDecoration(
                                        hintText: 'Prefix $index'),
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
                                    decoration: InputDecoration(
                                        hintText: 'Suffix $index'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Create+'),
                  onPressed: () {
                    final String description =
                        descriptionController.text.trim();
                    final String observation =
                        observationController.text.trim();
                    final int totalSeconds =
                        (timerDurationMinutes * ccrSecondsInAMinute) +
                            timerDurationSeconds;

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
                        secondsTimer: totalSeconds,
                      );
                    }
                    setState(() {
                      descriptionController.text = '';
                      observationController.text = '';
                      numberOfReferences = 0;
                      timerDurationMinutes = 0;
                      timerDurationSeconds = 0;

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
                    final String description =
                        descriptionController.text.trim();
                    final String observation =
                        observationController.text.trim();
                    final int totalSeconds =
                        (timerDurationMinutes * ccrSecondsInAMinute) +
                            timerDurationSeconds;

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
                        secondsTimer: totalSeconds,
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
