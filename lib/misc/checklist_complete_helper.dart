import 'package:ccr_checklist/store/checklist_editor_store.dart';

class ChecklistCompleteHelper {
  static String mainReport(ChecklistEditorStore checklistEditorStore) {
    final nonOkSectionCount = checklistEditorStore.nonOkSectionsCount;
    var message = '';

    if (nonOkSectionCount == 0) {
      message = 'All sections completed!';
    } else if (nonOkSectionCount == 1) {
      message = 'You have 1 not completed page.';
    } else {
      message = 'You have $nonOkSectionCount not completed pages.';
    }

    return message;
  }
}
