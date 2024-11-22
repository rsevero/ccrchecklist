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

import 'package:ccrchecklist/main.dart';
import 'package:ccrchecklist/page/template_editor_list_page.dart';
import 'package:ccrchecklist/store/checklist_editor_store.dart';
import 'package:ccrchecklist/store/config_store.dart';
import 'package:ccrchecklist/store/template_editor_store.dart';
import 'package:ccrchecklist/store/template_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

Widget createTemplateEditorListPage({
  ChecklistEditorStore? checklistEditorStore,
  ConfigStore? configStore,
  TemplateEditorStore? templateEditorStore,
  TemplateListStore? templateListStore,
}) =>
    MultiProvider(
      providers: [
        Provider(
          create: (context) => checklistEditorStore ?? ChecklistEditorStore(),
        ),
        Provider(
          create: (context) => configStore ?? ConfigStore(),
        ),
        Provider(
          create: (context) => templateEditorStore ?? TemplateEditorStore(),
        ),
        Provider(
          create: (context) => templateListStore ?? TemplateListStore(),
        ),
      ],
      child: const CCRChecklistApp(
        page: TemplateEditorListPage(),
      ),
    );

class MockTemplateEditorStore extends TemplateEditorStore with Store {}

class MockTemplateListStore extends TemplateListStore with Store {
  @override
  TemplateListStoreState get state => TemplateListStoreState.uptodate;
}

void main() {
  group('Template Editor List Page Tests', () {
    testWidgets('Test if template list shows up', (tester) async {
      final mockTemplateListStore = MockTemplateListStore();

      // Build the widget tree
      await tester.pumpWidget(createTemplateEditorListPage(
          templateListStore: mockTemplateListStore));

      // Wait for any animations or asynchronous tasks to complete
      await tester.pump();
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Test if template editor list page does not have a edit icon',
        (tester) async {
      final mockTemplateListStore = MockTemplateListStore();

      // Build the widget tree
      await tester.pumpWidget(createTemplateEditorListPage(
          templateListStore: mockTemplateListStore));

      // Verify that there is a 'edit' icon
      expect(find.byIcon(Icons.settings_outlined), findsNothing);
    });
  });
}
