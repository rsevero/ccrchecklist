import 'package:ccr_checklist/store/checklist_editor_store.dart';

class ChecklistCompleteHelper {
  static String mainReport(ChecklistEditorStore checklistEditorStore) {
    final int nonOkSectionCount = checklistEditorStore.nonOkSectionsCount;
    String message = '';

    if (nonOkSectionCount == 0) {
      message = 'All sections completed!';
    } else if (nonOkSectionCount == 1) {
      message = 'You have 1 non-complete page.';
    } else {
      message = 'You have $nonOkSectionCount non-complete pages.';
    }

    return message;
  }

  static List<int> nonOkSectionIndexes(
      ChecklistEditorStore checklistEditorStore) {
    final List<int> nonOkSections = checklistEditorStore.nonOkChecksPerSection
        .asMap()
        .entries
        .where((entry) => entry.value > 0)
        .map((entry) => entry.key)
        .toList();

    return nonOkSections;
  }

  static String sectionTitle(
      ChecklistEditorStore checklistEditorStore, int sectionIndex) {
    final sectionTitle = checklistEditorStore.sections[sectionIndex].title;

    return sectionTitle;
  }

  static String sectionMessage(
      ChecklistEditorStore checklistEditorStore, int sectionIndex) {
    final String message = checklistEditorStore.sectionsOk[sectionIndex]
        ? "Is complete."
        : "Has ${checklistEditorStore.nonOkChecksPerSection[sectionIndex]} issues.";

    return message;
  }
}
