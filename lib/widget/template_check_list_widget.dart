import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/widget/template_check_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TemplateCheckListWidget extends StatelessWidget {
  final int sectionIndex;
  final TemplateEditorStore templateEditorStore;

  const TemplateCheckListWidget({
    super.key,
    required this.sectionIndex,
    required this.templateEditorStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final checks = templateEditorStore.checks[sectionIndex];
        return SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: checks.length,
            itemBuilder: (context, index) {
              return TemplateCheckWidget(
                  index: index, templateEditorStore: templateEditorStore);
            },
          ),
        );
      },
    );
  }
}
