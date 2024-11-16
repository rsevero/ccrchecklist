import 'package:ccrchecklist/store/template_editor_store.dart';
import 'package:ccrchecklist/widget/template_check_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TemplateCheckListWidget extends StatelessWidget {
  final int sectionIndex;

  const TemplateCheckListWidget({
    super.key,
    required this.sectionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final templateEditorStore = Provider.of<TemplateEditorStore>(context);

        final checks = templateEditorStore.checks[sectionIndex];
        return ReorderableListView.builder(
          buildDefaultDragHandles: false,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: checks.length,
          itemBuilder: (context, index) {
            return TemplateCheckWidget(
              key: ValueKey(index),
              sectionIndex: sectionIndex,
              index: index,
            );
          },
          onReorder: (int oldCheckIndex, int newCheckIndex) {
            templateEditorStore.moveCheck(
                sectionIndex, oldCheckIndex, newCheckIndex);
          },
        );
      },
    );
  }
}
