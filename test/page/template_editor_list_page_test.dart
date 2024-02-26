import 'package:ccr_checklist/main.dart';
import 'package:ccr_checklist/page/template_editor_list_page.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/store/config_store.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
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
    testWidgets('Test if initial circular progress indicator shows up',
        (tester) async {
      await tester.pumpWidget(createTemplateEditorListPage());
      expect(find.byType(CircularProgressIndicator), findsAny);
    });
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
