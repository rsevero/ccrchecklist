import 'package:ccr_checklist/main.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/store/config_store.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

Widget createTemplateListPage({TemplateListStore? templateListStore}) =>
    MultiProvider(
      providers: [
        Provider(
          create: (context) => templateListStore ?? TemplateListStore(),
        ),
        Provider(
          create: (context) => TemplateEditorStore(),
        ),
        Provider(
          create: (context) => ChecklistEditorStore(),
        ),
        Provider(
          create: (context) => ConfigStore(),
        ),
      ],
      child: const CCRChecklistApp(),
    );

class MockTemplateListStore extends TemplateListStore with Store {
  @override
  TemplateListStoreState get state => TemplateListStoreState.uptodate;
}

void main() {
  group('Template List Page Widget Tests', () {
    testWidgets('Test if initial circular progress indicator shows up',
        (tester) async {
      await tester.pumpWidget(createTemplateListPage());
      expect(find.byType(CircularProgressIndicator), findsAny);
    });
    testWidgets('Test if template list shows up', (tester) async {
      final mockTemplateListStore = MockTemplateListStore();

      // Build the widget tree
      await tester.pumpWidget(
          createTemplateListPage(templateListStore: mockTemplateListStore));

      // Wait for any animations or asynchronous tasks to complete
      await tester.pump();
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
