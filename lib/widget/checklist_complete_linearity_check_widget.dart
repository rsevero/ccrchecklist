import 'package:ccrchecklist/data/checklist_check.dart';
import 'package:ccrchecklist/misc/constants.dart';
import 'package:ccrchecklist/misc/flutter_extension_methods.dart';
import 'package:ccrchecklist/misc/linearity_check_helper.dart';
import 'package:ccrchecklist/store/checklist_editor_store.dart';
import 'package:ccrchecklist/widget/linearity_worksheet_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ChecklistCompleteLinearityCheckWidget extends StatefulWidget {
  final int sectionIndex;
  final int checkIndex;

  const ChecklistCompleteLinearityCheckWidget({
    super.key,
    required this.sectionIndex,
    required this.checkIndex,
  });

  @override
  State<ChecklistCompleteLinearityCheckWidget> createState() =>
      _ChecklistCompleteLinearityCheckWidgetState();
}

class _ChecklistCompleteLinearityCheckWidgetState
    extends State<ChecklistCompleteLinearityCheckWidget> {
  final List<TextEditingController> _controllersAir = [];
  final List<TextEditingController> _controllersOxygen = [];
  final List<FocusNode> _focusNodesAir = [];
  final List<FocusNode> _focusNodesOxygen = [];
  bool _isInit = true;

  @override
  void initState() {
    super.initState();
    _controllersAir.addAll(List.generate(
        ccrMaxReferences, (index) => TextEditingController(text: '')));
    _controllersOxygen.addAll(List.generate(
        ccrMaxReferences, (index) => TextEditingController(text: '')));
    _focusNodesAir
        .addAll(List.generate(ccrMaxReferences, (index) => FocusNode()));
    _focusNodesOxygen
        .addAll(List.generate(ccrMaxReferences, (index) => FocusNode()));
  }

  @override
  void dispose() {
    // Dispose the TextEditingController instances
    for (var controller in _controllersAir) {
      controller.dispose();
    }
    for (var controller in _controllersOxygen) {
      controller.dispose();
    }

    // Dispose the FocusNode instances
    for (var focusNode in _focusNodesAir) {
      focusNode.dispose();
    }
    for (var focusNode in _focusNodesOxygen) {
      focusNode.dispose();
    }

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _isInit = false;
      final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);

      for (var entry in checklistEditorStore.linearityWorksheets.entries) {
        final String key = entry.key;
        final worksheet = entry.value;
        final int referenceCount =
            checklistEditorStore.getCompleteLinearityReferenceCountByKey(key);

        for (var index = 0; index < referenceCount; index++) {
          if (worksheet[index].mv != null) {
            _controllersAir[index].text =
                worksheet[index].mv!.toStringAsFixed(1);
          }
          if (worksheet[index].actual != null) {
            _controllersOxygen[index].text =
                worksheet[index].actual!.toStringAsFixed(1);
          }
        }
      }
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final check = checklistEditorStore.checks[widget.sectionIndex]
        [widget.checkIndex] as ChecklistCompleteLinearityCheck;
    final theme = context.ccrThemeExtension;
    final linearityWorksheet = checklistEditorStore
        .getCompleteLinearityWorksheet(widget.sectionIndex, widget.checkIndex);

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
              borderRadius: ccrTemplateListTileBorderRadius,
              child: Container(
                color: theme.secondaryContainer,
                child: DataTable(
                  columnSpacing: 8,
                  columns: [
                    DataColumn(
                        label: LinearityWorksheetText(
                      check.measurement,
                      theme.linearityColumnTitleTextTheme,
                    )),
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
                    check.referenceCount,
                    (index) => DataRow(
                      cells: [
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodesOxygen[index]);
                            },
                            child: _buildEditableFieldCell(
                                context, LinearityCheckDataType.mv, index),
                          ),
                        ),
                        DataCell(
                          Observer(
                            builder: (_) => buildNonEditableLinearityCheckCell(
                              context,
                              index,
                              linearityWorksheet[index].divided == null
                                  ? ''
                                  : linearityWorksheet[index]
                                      .divided!
                                      .toStringAsFixed(1),
                              () {
                                FocusScope.of(context)
                                    .requestFocus(_focusNodesOxygen[index]);

                                if (_focusNodesOxygen[index].hasFocus) {
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
                              linearityWorksheet[index].multiplied == null
                                  ? ''
                                  : linearityWorksheet[index]
                                      .multiplied!
                                      .toStringAsFixed(1),
                              () {
                                FocusScope.of(context)
                                    .requestFocus(_focusNodesOxygen[index]);

                                if (_focusNodesOxygen[index].hasFocus) {
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
                                  .requestFocus(_focusNodesOxygen[index]);
                            },
                            child: _buildEditableFieldCell(
                                context, LinearityCheckDataType.actual, index),
                          ),
                        ),
                        DataCell(
                          Observer(
                            builder: (_) => buildNonEditableLinearityCheckCell(
                              context,
                              index,
                              linearityWorksheet[index].percentage == null
                                  ? ''
                                  : linearityWorksheet[index]
                                      .percentage!
                                      .toStringAsFixed(1),
                              () {
                                FocusScope.of(context)
                                    .requestFocus(_focusNodesOxygen[index]);

                                if (_focusNodesOxygen[index].hasFocus) {
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

  Widget _buildEditableFieldCell(
    BuildContext context,
    LinearityCheckDataType dataType,
    int index,
  ) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final theme = context.ccrThemeExtension;
    TextEditingController controller;
    FocusNode focusNode;

    switch (dataType) {
      case LinearityCheckDataType.mv:
        controller = _controllersAir[index];
        focusNode = _focusNodesAir[index];
      case LinearityCheckDataType.actual:
        controller = _controllersOxygen[index];
        focusNode = _focusNodesOxygen[index];
    }

    return Container(
      color: theme.surfaceDim,
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: theme.onSurface,
        ),
        decoration: const InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        ),
        onChanged: (value) {
          checklistEditorStore.updateCompleteLinearity(
            widget.sectionIndex,
            widget.checkIndex,
            index,
            dataType,
            double.tryParse(value) ?? 0,
          );
        },
        maxLength: 5,
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
          signed: false,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.-]'))
        ],
        focusNode: focusNode,
      ),
    );
  }
}
