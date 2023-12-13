import 'package:ccr_checklist/data/checklist_check.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/widget/linearity_worksheet_text.dart';
import 'package:flutter/material.dart';
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
  bool _isInit = true;

  @override
  void initState() {
    super.initState();
    _controllers.addAll(List.generate(
        ccrMaxReferences, (index) => TextEditingController(text: '')));
  }

  @override
  void dispose() {
    final controllersLenght = _controllers.length;
    for (var i = 0; i < controllersLenght; i++) {
      var controller = _controllers.removeLast();
      controller.dispose();
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

    return ListTile(
      leading: Checkbox(
        value: check.isChecked,
        onChanged: (bool? value) {
          if (value != null) {
            checklistEditorStore.setCheckIsChecked(
                widget.sectionIndex, widget.checkIndex, value);
          }
        },
      ),
      title: Row(
        children: [
          const Expanded(
            child: Text(
                'Linearity check - step 2: enter the mV (milivolts) readings in the "actual" column with pure oxygen.'),
          ),
          Observer(
            builder: (_) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                color: Theme.of(context).colorScheme.tertiary,
                child: DataTable(
                  columns: const [
                    DataColumn(label: LinearityWorksheetText('mV')),
                    DataColumn(label: LinearityWorksheetText('/ 0.21')),
                    DataColumn(label: LinearityWorksheetText('x 1.6')),
                    DataColumn(label: LinearityWorksheetText('actual')),
                    DataColumn(label: LinearityWorksheetText('%')),
                  ],
                  rows: List<DataRow>.generate(
                    checklistEditorStore.linearityCheckReferenceCount,
                    (index) => DataRow(
                      cells: [
                        DataCell(
                          Observer(
                            builder: (_) => LinearityWorksheetText(
                                checklistEditorStore
                                            .linearityWorksheet[index].mv ==
                                        null
                                    ? ''
                                    : checklistEditorStore
                                        .linearityWorksheet[index].mv!
                                        .toStringAsFixed(1)),
                          ),
                        ),
                        DataCell(Observer(
                          builder: (_) => LinearityWorksheetText(
                              checklistEditorStore
                                          .linearityWorksheet[index].divided ==
                                      null
                                  ? ''
                                  : checklistEditorStore
                                      .linearityWorksheet[index].divided!
                                      .toStringAsFixed(1)),
                        )),
                        DataCell(
                          Observer(
                            builder: (_) => LinearityWorksheetText(
                                checklistEditorStore.linearityWorksheet[index]
                                            .multiplied ==
                                        null
                                    ? ''
                                    : checklistEditorStore
                                        .linearityWorksheet[index].multiplied!
                                        .toStringAsFixed(1)),
                          ),
                        ),
                        DataCell(
                          Observer(
                            builder: (_) => TextField(
                              controller: _controllers[index],
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onTertiary),
                              onChanged: (value) =>
                                  checklistEditorStore.updateLinearityActual(
                                      index, double.tryParse(value) ?? 0),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                            ),
                          ),
                        ),
                        DataCell(
                          Observer(
                            builder: (_) => LinearityWorksheetText(
                                checklistEditorStore.linearityWorksheet[index]
                                            .percentage ==
                                        null
                                    ? ''
                                    : checklistEditorStore
                                        .linearityWorksheet[index].percentage!
                                        .toStringAsFixed(1)),
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
}
