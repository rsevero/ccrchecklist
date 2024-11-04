import 'package:ccr_checklist/data/checklist_check.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/misc/flutter_extension_methods.dart';
import 'package:ccr_checklist/misc/linearity_check_helper.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/widget/linearity_worksheet_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ChecklistLinearityStep2CheckWidget extends StatefulWidget {
  final int sectionIndex;
  final int checkIndex;

  const ChecklistLinearityStep2CheckWidget({
    super.key,
    required this.sectionIndex,
    required this.checkIndex,
  });

  @override
  State<ChecklistLinearityStep2CheckWidget> createState() =>
      _ChecklistLinearityStep2CheckWidgetState();
}

class _ChecklistLinearityStep2CheckWidgetState
    extends State<ChecklistLinearityStep2CheckWidget> {
  final List<TextEditingController> _controllers = [];
  final List<FocusNode> _focusNodes = [];
  bool _isInit = true;

  @override
  void initState() {
    super.initState();
    _controllers.addAll(List.generate(
        ccrMaxReferences, (index) => TextEditingController(text: '')));
    _focusNodes.addAll(List.generate(ccrMaxReferences, (index) => FocusNode()));
  }

  @override
  void dispose() {
    // Dispose the TextEditingController instances
    for (var controller in _controllers) {
      controller.dispose();
    }

    // Dispose the FocusNode instances
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _isInit = false;
      final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
      for (var index = 0;
          index < checklistEditorStore.linearityCheckReferenceCount;
          index++) {
        if (checklistEditorStore.linearityWorksheet[index].actual == null) {
          continue;
        }
        _controllers[index].text = checklistEditorStore
            .linearityWorksheet[index].actual!
            .toStringAsFixed(1);
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final check = checklistEditorStore.checks[widget.sectionIndex]
        [widget.checkIndex] as ChecklistLinearityStep2Check;
    final theme = context.ccrThemeExtension;

    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            check.description,
            style: theme.checkDescriptionTextTheme,
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                color: theme.secondaryContainer,
                child: DataTable(
                  columnSpacing: 8,
                  columns: [
                    DataColumn(
                        label: LinearityWorksheetText(
                            'mV', theme.linearityColumnTitleTextTheme)),
                    DataColumn(
                        label: LinearityWorksheetText(
                            '/0.21', theme.linearityColumnTitleTextTheme)),
                    DataColumn(
                        label: LinearityWorksheetText(
                            'x1.6', theme.linearityColumnTitleTextTheme)),
                    DataColumn(
                        label: LinearityWorksheetText(
                            'actual', theme.linearityColumnTitleTextTheme)),
                    DataColumn(
                        label: LinearityWorksheetText(
                            '%', theme.linearityColumnTitleTextTheme)),
                  ],
                  headingRowColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                    return theme.secondary;
                  }),
                  rows: List<DataRow>.generate(
                    checklistEditorStore.linearityCheckReferenceCount,
                    (index) => DataRow(
                      cells: [
                        DataCell(
                          Observer(
                            builder: (_) => buildNonEditableLinearityCheckCell(
                              context,
                              index,
                              checklistEditorStore
                                          .linearityWorksheet[index].mv ==
                                      null
                                  ? ''
                                  : checklistEditorStore
                                      .linearityWorksheet[index].mv!
                                      .toStringAsFixed(1),
                              () {
                                FocusScope.of(context)
                                    .requestFocus(_focusNodes[index]);

                                if (_focusNodes[index].hasFocus) {
                                  SystemChannels.textInput
                                      .invokeMethod('TextInput.show');
                                }
                              },
                            ),
                          ),
                        ),
                        DataCell(
                          Observer(
                            builder: (_) => buildNonEditableLinearityCheckCell(
                              context,
                              index,
                              checklistEditorStore
                                          .linearityWorksheet[index].divided ==
                                      null
                                  ? ''
                                  : checklistEditorStore
                                      .linearityWorksheet[index].divided!
                                      .toStringAsFixed(1),
                              () {
                                FocusScope.of(context)
                                    .requestFocus(_focusNodes[index]);

                                if (_focusNodes[index].hasFocus) {
                                  SystemChannels.textInput
                                      .invokeMethod('TextInput.show');
                                }
                              },
                            ),
                          ),
                        ),
                        DataCell(
                          Observer(
                            builder: (_) => buildNonEditableLinearityCheckCell(
                              context,
                              index,
                              checklistEditorStore.linearityWorksheet[index]
                                          .multiplied ==
                                      null
                                  ? ''
                                  : checklistEditorStore
                                      .linearityWorksheet[index].multiplied!
                                      .toStringAsFixed(1),
                              () {
                                FocusScope.of(context)
                                    .requestFocus(_focusNodes[index]);

                                if (_focusNodes[index].hasFocus) {
                                  SystemChannels.textInput
                                      .invokeMethod('TextInput.show');
                                }
                              },
                            ),
                          ),
                        ),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[index]);
                            },
                            child: _buildEditableFieldCell(context, index),
                          ),
                        ),
                        DataCell(
                          Observer(
                            builder: (_) => buildNonEditableLinearityCheckCell(
                              context,
                              index,
                              checklistEditorStore.linearityWorksheet[index]
                                          .percentage ==
                                      null
                                  ? ''
                                  : checklistEditorStore
                                      .linearityWorksheet[index].percentage!
                                      .toStringAsFixed(1),
                              () {
                                FocusScope.of(context)
                                    .requestFocus(_focusNodes[index]);

                                if (_focusNodes[index].hasFocus) {
                                  SystemChannels.textInput
                                      .invokeMethod('TextInput.show');
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableFieldCell(BuildContext context, int index) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final theme = context.ccrThemeExtension;

    return Container(
      color: theme.surfaceDim,
      child: TextField(
        controller: _controllers[index],
        style: TextStyle(
          color: theme.onSurface,
        ),
        decoration: const InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        ),
        onChanged: (value) => checklistEditorStore.updateLinearityActual(
            index, double.tryParse(value) ?? 0),
        maxLength: 5,
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
          signed: false,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.-]'))
        ],
        focusNode: _focusNodes[index],
      ),
    );
  }
}
