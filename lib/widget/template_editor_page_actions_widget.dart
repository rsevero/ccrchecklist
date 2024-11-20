// CCR Checklist - a checklist app for rebreather users
// Copyright (C) 2024  Rodrigo Severo
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:ccrchecklist/data/regular_check_reference.dart';
import 'package:ccrchecklist/misc/constants.dart';
import 'package:ccrchecklist/misc/flutter_extension_methods.dart';
import 'package:ccrchecklist/store/template_editor_store.dart';
import 'package:ccrchecklist/widget/dialog_box_column_item.dart';
import 'package:ccrchecklist/widget/greyable_speed_dial_child_widget.dart';
import 'package:ccrchecklist/widget/timer_duration.dart';
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
        return Padding(
          padding: const EdgeInsets.only(right: 120.0),
          child: SpeedDial(
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
          ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: ccrVerticalPaddingItem),
                  child: TextFormField(
                    controller: rebreatherManufacturerController,
                    style:
                        context.ccrThemeExtension.dialogFieldContentTextTheme,
                    decoration: InputDecoration(
                      labelText: 'Rebreather Manufacturer',
                      labelStyle:
                          context.ccrThemeExtension.dialogFieldTitleTextTheme,
                    ),
                    autofocus: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: ccrVerticalPaddingItem),
                  child: TextFormField(
                    controller: rebreatherModelController,
                    style:
                        context.ccrThemeExtension.dialogFieldContentTextTheme,
                    decoration: InputDecoration(
                      labelText: 'Rebreather Model',
                      labelStyle:
                          context.ccrThemeExtension.dialogFieldTitleTextTheme,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: ccrVerticalPaddingItem),
                  child: TextFormField(
                    controller: titleController,
                    style:
                        context.ccrThemeExtension.dialogFieldContentTextTheme,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle:
                          context.ccrThemeExtension.dialogFieldTitleTextTheme,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: ccrVerticalPaddingItem),
                  child: TextFormField(
                    controller: descriptionController,
                    style:
                        context.ccrThemeExtension.dialogFieldContentTextTheme,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle:
                          context.ccrThemeExtension.dialogFieldTitleTextTheme,
                    ),
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
    final theme = context.ccrThemeExtension;
    final TextEditingController titleController = TextEditingController();
    final FocusNode titleFocusNode = FocusNode();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String titleHintText = 'Enter title here';
    Color? titleHintColor = theme.dialogHintTextTheme.color;
    bool titleOk = true;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            void setTitleHint() {
              setState(() {
                if (titleOk) {
                  titleHintText = 'Enter title here';
                  titleHintColor = theme.dialogHintTextTheme.color;
                } else {
                  titleHintText = 'Title cannot be empty';
                  titleHintColor = Colors.red;
                }
              });
            }

            bool addSection() {
              final title = titleController.text.trim();
              titleOk = title.isNotEmpty;

              if (titleOk) {
                templateEditorStore.addSection(title: title);
              }

              setTitleHint();
              return titleOk;
            }

            return AlertDialog(
              title: Text(
                'New Page',
                style: context.ccrThemeExtension.dialogTitleTextTheme,
              ),
              content: Form(
                key: formKey,
                child: TextFormField(
                  controller: titleController,
                  focusNode: titleFocusNode,
                  style: context.ccrThemeExtension.dialogFieldContentTextTheme,
                  decoration: InputDecoration(
                    hintText: titleHintText,
                    hintStyle: theme.dialogHintTextTheme
                        .copyWith(color: titleHintColor),
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
                    final bool result = addSection();

                    if (result) {
                      titleController.text = '';
                    }

                    titleFocusNode.requestFocus();
                  },
                ),
                TextButton(
                  child: const Text('Create'),
                  onPressed: () {
                    final bool result = addSection();

                    if (result) {
                      Navigator.of(context).pop(true);
                    } else {
                      titleFocusNode.requestFocus();
                    }
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
      },
    );
  }

  void _onTapAddCompleteLinearityCheck(BuildContext context) {
    final templateEditorStore =
        Provider.of<TemplateEditorStore>(context, listen: false);
    final theme = context.ccrThemeExtension;
    final TextEditingController measurementController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final FocusNode measurementFocusNode = FocusNode();
    final FocusNode descriptionFocusNode = FocusNode();
    String measurementHintText = 'Enter the name of the measurement';
    Color? measurementHintColor = theme.dialogHintTextTheme.color;
    String descriptionHintText = 'Enter check description';
    Color? descriptionHintColor = theme.dialogHintTextTheme.color;
    bool measurementOk = true;
    bool descriptionOk = true;

    int referenceCount = 1;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            void setHints() {
              setState(
                () {
                  if (measurementOk) {
                    measurementHintText = 'Enter the name of the measurement';
                    measurementHintColor = theme.dialogHintTextTheme.color;
                  } else {
                    measurementHintText = 'Measurement cannot be empty';
                    measurementHintColor = Colors.red;
                  }

                  if (descriptionOk) {
                    descriptionHintText = 'Enter check description';
                    descriptionHintColor = theme.dialogHintTextTheme.color;
                  } else {
                    descriptionHintText = 'Description cannot be empty';
                    descriptionHintColor = Colors.red;
                  }
                },
              );
            }

            bool addCompleteLinearityCheck() {
              final description = descriptionController.text.trim();
              final measurement = measurementController.text.trim();

              measurementOk = measurement.isNotEmpty;
              descriptionOk = description.isNotEmpty;

              if (measurementOk && descriptionOk) {
                templateEditorStore.addCompleteLinearityCheck(
                  measurement: measurement,
                  description: description,
                  referenceCount: referenceCount,
                );
              }

              setHints();

              return measurementOk && descriptionOk;
            }

            void setFocus() {
              if (measurementOk) {
                descriptionFocusNode.requestFocus();
              } else {
                measurementFocusNode.requestFocus();
              }
            }

            return AlertDialog(
              title: Text(
                'Add Complete Linearity Check',
                style: context.ccrThemeExtension.dialogTitleTextTheme,
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
                          focusNode: measurementFocusNode,
                          style: theme.dialogFieldContentTextTheme,
                          decoration: InputDecoration(
                            hintText: measurementHintText,
                            hintStyle: theme.dialogHintTextTheme.copyWith(
                              color: measurementHintColor,
                            ),
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
                          focusNode: descriptionFocusNode,
                          style: theme.dialogFieldContentTextTheme,
                          decoration: InputDecoration(
                            hintText: descriptionHintText,
                            hintStyle: theme.dialogHintTextTheme.copyWith(
                              color: descriptionHintColor,
                            ),
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
                          'References',
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
                  child: const Text('Create+'),
                  onPressed: () {
                    final bool result = addCompleteLinearityCheck();

                    if (result) {
                      measurementController.text = '';
                      descriptionController.text = '';
                      referenceCount = 1;
                    }

                    setFocus();
                  },
                ),
                TextButton(
                  child: const Text('Create'),
                  onPressed: () {
                    final bool result = addCompleteLinearityCheck();

                    if (result) {
                      Navigator.of(context).pop();
                    } else {
                      setFocus();
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

  void _onTapAddLinearityStep1Check(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final templateEditorStore =
            Provider.of<TemplateEditorStore>(context, listen: false);
        final TextEditingController measurementController =
            TextEditingController();
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
                    DialogBoxColumnItem(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Measurement',
                              style: context
                                  .ccrThemeExtension.dialogFieldTitleTextTheme,
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
                          controller: measurementController,
                          style: context
                              .ccrThemeExtension.dialogFieldContentTextTheme,
                          decoration: InputDecoration(
                            hintText: 'Enter measurement name',
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
                    DialogBoxColumnItem(
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
                    DialogBoxColumnItem(
                      children: [
                        Text(
                          'References',
                          style: context
                              .ccrThemeExtension.dialogFieldTitleTextTheme,
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
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Create'),
              onPressed: () {
                final measurement = measurementController.text.trim();
                final description = descriptionController.text.trim();

                if (description.isNotEmpty && measurement.isNotEmpty) {
                  templateEditorStore.addLinearityStep1Check(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: ccrVerticalPaddingItem),
                    child: SizedBox(
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
    final theme = context.ccrThemeExtension;
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController observationController = TextEditingController();
    final FocusNode descriptionFocusNode = FocusNode();

    String descriptionHintText = 'Enter check description';
    Color? descriptionHintColor = theme.dialogHintTextTheme.color;
    bool descriptionOk = true;

    final List<TextEditingController> prefixControllers =
        List.generate(ccrMaxReferences + 1, (_) => TextEditingController());
    final List<TextEditingController> suffixControllers =
        List.generate(ccrMaxReferences + 1, (_) => TextEditingController());

    int numberOfReferences = 0;
    int timerDurationSeconds = 0;
    int timerDurationMinutes = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            void setHint() {
              setState(
                () {
                  if (descriptionOk) {
                    descriptionHintText = 'Enter check description';
                    descriptionHintColor = theme.dialogHintTextTheme.color;
                  } else {
                    descriptionHintText = 'Description cannot be empty';
                    descriptionHintColor = Colors.red;
                  }
                },
              );
            }

            bool addRegularCheck() {
              final String description = descriptionController.text.trim();

              descriptionOk = description.isNotEmpty;

              if (descriptionOk) {
                final String observation = observationController.text.trim();
                final int totalSeconds =
                    (timerDurationMinutes * ccrSecondsInAMinute) +
                        timerDurationSeconds;
                final List<RegularCheckReference> references = List.generate(
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

              setHint();

              return descriptionOk;
            }

            return AlertDialog(
              title: Text(
                'Add Regular Check',
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
                          focusNode: descriptionFocusNode,
                          style: theme.dialogFieldContentTextTheme,
                          decoration: InputDecoration(
                            hintText: descriptionHintText,
                            hintStyle: theme.dialogHintTextTheme.copyWith(
                              color: descriptionHintColor,
                            ),
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
                    DialogBoxColumnItem(
                      children: [
                        Text(
                          'References',
                          style: theme.dialogFieldTitleTextTheme,
                        ),
                      ],
                    ),
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
                  child: const Text('Create+'),
                  onPressed: () {
                    final bool result = addRegularCheck();

                    if (result) {
                      setState(() {
                        descriptionController.text = '';
                        observationController.text = '';
                        numberOfReferences = 0;
                        timerDurationMinutes = 0;
                        timerDurationSeconds = 0;

                        prefixControllers.clear();
                        prefixControllers.addAll(
                          List.generate(ccrMaxReferences + 1,
                              (_) => TextEditingController()),
                        );

                        suffixControllers.clear();
                        suffixControllers.addAll(
                          List.generate(ccrMaxReferences + 1,
                              (_) => TextEditingController()),
                        );
                      });
                    }

                    descriptionFocusNode.requestFocus();
                  },
                ),
                TextButton(
                  child: const Text('Create'),
                  onPressed: () {
                    final bool result = addRegularCheck();

                    if (result) {
                      Navigator.of(context).pop();
                    } else {
                      descriptionFocusNode.requestFocus();
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
