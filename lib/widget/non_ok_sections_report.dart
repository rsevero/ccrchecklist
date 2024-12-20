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

import 'package:ccrchecklist/misc/checklist_complete_helper.dart';
import 'package:ccrchecklist/page/checklist_page.dart';
import 'package:ccrchecklist/store/checklist_editor_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NonOkSectionsReport extends StatelessWidget {
  const NonOkSectionsReport({super.key});

  @override
  Widget build(BuildContext context) {
    final checklistEditorStore = Provider.of<ChecklistEditorStore>(context);

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: checklistEditorStore.sections.length,
        itemBuilder: (context, index) {
          final String sectionTitle =
              ChecklistCompleteHelper.sectionTitle(checklistEditorStore, index);
          final String sectionMessage = ChecklistCompleteHelper.sectionMessage(
              checklistEditorStore, index);
          final bool sectionOk = checklistEditorStore.sectionsOk[index];

          return ListTile(
            leading: sectionOk
                ? const Icon(Icons.check, color: Colors.green)
                : const Icon(Icons.error, color: Colors.red),
            title: Text(sectionTitle),
            subtitle: Text(sectionMessage),
            trailing: sectionOk
                ? null
                : ElevatedButton(
                    child: const Text('Fix'),
                    onPressed: () {
                      onPressedFix(context, index);
                    },
                  ),
          );
        },
      ),
    );
  }

  void onPressedFix(BuildContext context, int sectionIndex) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ChecklistPage(sectionIndex: sectionIndex),
      ),
    );
  }
}
