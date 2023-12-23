import 'package:ccr_checklist/data/checklist_check.dart';
import 'package:ccr_checklist/misc/constants.dart';
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
        if (checklistEditorStore.linearityWorksheet[index].mv == null) {
          continue;
        }
        _controllers[index].text = checklistEditorStore
            .linearityWorksheet[index].mv!
            .toStringAsFixed(1);
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final check = checklistEditorStore.checks[widget.sectionIndex]
        [widget.checkIndex] as ChecklistLinearityStep1Check;

    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(check.description),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              color: Theme.of(context).colorScheme.tertiary,
              child: DataTable(
                columnSpacing: 16,
                columns: const [
                  DataColumn(label: LinearityWorksheetText('mV')),
                  DataColumn(label: LinearityWorksheetText('/0.21')),
                  DataColumn(label: LinearityWorksheetText('x1.6')),
                ],
                rows: List<DataRow>.generate(
                  checklistEditorStore.linearityCheckReferenceCount,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Container(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          child: TextField(
                            controller: _controllers[index],
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                            onChanged: (value) =>
                                checklistEditorStore.updateLinearityMV(
                                    index, double.tryParse(value) ?? 0),
                            keyboardType: const TextInputType.numberWithOptions(
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
        ],
      ),
    );
  }
}
