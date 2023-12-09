import 'package:ccr_checklist/data/template_check.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/widget/template_check_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TemplateCheckListWidget extends StatelessWidget {
  final List<TemplateCheck> checks;
  final TemplateEditorStore templateEditorStore;

  const TemplateCheckListWidget({
    super.key,
    required this.checks,
    required this.templateEditorStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: checks.length,
          itemBuilder: (context, index) {
            return TemplateCheckWidget(
                check: checks[index],
                index: index,
                templateEditorStore: templateEditorStore);
          },
        ),
      ),
    );
  }
}
