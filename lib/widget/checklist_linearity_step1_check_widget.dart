import 'package:ccr_checklist/data/checklist_check.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/widget/linearity_worksheet_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ChecklistLinearityStep1CheckWidget extends StatefulWidget {
  final int sectionIndex;
  final int checkIndex;

  const ChecklistLinearityStep1CheckWidget({
    super.key,
    required this.sectionIndex,
    required this.checkIndex,
  });

  @override
  State<ChecklistLinearityStep1CheckWidget> createState() =>
      _ChecklistLinearityStep1CheckWidgetState();
}

class _ChecklistLinearityStep1CheckWidgetState
    extends State<ChecklistLinearityStep1CheckWidget> {
  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final check = checklistEditorStore.checks[widget.sectionIndex]
        [widget.checkIndex] as ChecklistLinearityStep1Check;

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
                'Linearity check - step 1: enter the mV (milivolts) readings with pure air.'),
          ),
          Observer(
            builder: (_) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                color: Theme.of(context).colorScheme.tertiary,
                child: DataTable(
                  columns: const [
                    DataColumn(
                        label: LinearityWorksheetText(
                      'mV',
                    )),
                    DataColumn(label: LinearityWorksheetText('/ 0.21')),
                    DataColumn(label: LinearityWorksheetText('x 1.6')),
                  ],
                  rows: List<DataRow>.generate(
                    checklistEditorStore.linearityCheckReferenceCount,
                    (index) => DataRow(
                      cells: [
                        DataCell(
                          Observer(
                            builder: (_) => TextField(
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onTertiary),
                              onChanged: (value) =>
                                  checklistEditorStore.updateLinearityMV(
                                      index, double.tryParse(value) ?? 0),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                            ),
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
