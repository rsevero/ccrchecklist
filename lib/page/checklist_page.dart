import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/page/checklist_complete_page.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/widget/checklist_appbar.dart';
import 'package:ccr_checklist/widget/checklist_body.dart';
import 'package:flutter/material.dart'; // For date formatting
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ChecklistPage extends StatelessWidget {
  final int sectionIndex;

  const ChecklistPage({super.key, required this.sectionIndex});

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);
    final totalSections = checklistEditorStore.sections.length;

    return Scaffold(
      appBar: CheckListAppBar(
          title: checklistEditorStore.title,
          description: checklistEditorStore.description,
          rebreatherManufacturer: checklistEditorStore.rebreatherManufacturer,
          rebreatherModel: checklistEditorStore.rebreatherModel),
      body: ChecklistBody(sectionIndex: sectionIndex),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Observer(
              builder: (_) {
                final buttonEnabled = sectionIndex > 0;
                return DecoratedBox(
                  decoration: BoxDecoration(
                      color: !buttonEnabled ||
                              checklistEditorStore
                                  .previousSectionsOk[sectionIndex]
                          ? null
                          : Theme.of(context).colorScheme.error),
                  child: IconButton(
                    icon: const Icon(Icons.navigate_before),
                    color: !buttonEnabled ||
                            checklistEditorStore
                                .previousSectionsOk[sectionIndex]
                        ? null
                        : Theme.of(context).colorScheme.onError,
                    onPressed: buttonEnabled
                        ? () => _onTapPreviousSection(context)
                        : null,
                  ),
                );
              },
            ),
            Observer(
              builder: (_) {
                final buttonEnabled = sectionIndex < totalSections;
                Color? buttonColor;
                if (buttonEnabled) {
                  buttonColor = checklistEditorStore.sectionsOk[sectionIndex]
                      ? ccrSectionOkColor
                      : Theme.of(context).colorScheme.error;
                }
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: buttonColor,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.navigate_next),
                    color: !buttonEnabled ||
                            checklistEditorStore.sectionsOk[sectionIndex]
                        ? null
                        : Theme.of(context).colorScheme.onError,
                    onPressed: buttonEnabled
                        ? () => _onTapNextSection(context, totalSections)
                        : null,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onTapPreviousSection(BuildContext context) {
    navigateToSection(context, sectionIndex - 1);
  }

  void _onTapNextSection(BuildContext context, int totalSections) {
    if (sectionIndex < (totalSections - 1)) {
      navigateToSection(context, sectionIndex + 1);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ChecklistCompletePage(),
        ),
      );
    }
  }

  void navigateToSection(BuildContext context, int newSectionIndex) {
    final checklistEditorStore =
        Provider.of<ChecklistEditorStore>(context, listen: false);
    final totalSections = checklistEditorStore.sections.length;

    if ((newSectionIndex >= 0) && (newSectionIndex < totalSections)) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ChecklistPage(sectionIndex: newSectionIndex),
        ),
      );
    }
  }
}
