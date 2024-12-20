// CCR Checklist - a checklist app for rebreather users
// Copyright (C) 2024  Rodrigo Severo
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:ccrchecklist/store/checklist_editor_store.dart';
import 'package:intl/intl.dart';

class ChecklistCompleteHelper {
  static String mainReport(ChecklistEditorStore checklistEditorStore) {
    final int nonOkSectionCount = checklistEditorStore.nonOkSectionsCount;
    String message = '';

    if (nonOkSectionCount == 0) {
      message = 'All sections completed!';
    } else if (nonOkSectionCount == 1) {
      message = 'You have 1 incomplete page.';
    } else {
      message = 'You have $nonOkSectionCount incomplete pages.';
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
        ? "Complete."
        : "Has ${checklistEditorStore.nonOkChecksPerSection[sectionIndex]} issues.";

    return message;
  }

  static String formatDate(DateTime dateTime) {
    DateFormat formatter = DateFormat('yyyy.MM.dd-HH:mm');
    return formatter.format(dateTime);
  }
}
