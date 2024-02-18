import 'package:ccr_checklist/main.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/store/config_store.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Widget createTemplateListPage() => MultiProvider(
      providers: [
        Provider(
          create: (context) => TemplateListStore(),
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

void main() {
  group('Template List Page Widget Tests', () {
    testWidgets('Test if template list shows up', (tester) async {
      await tester.pumpWidget(createTemplateListPage());
      expect(find.byType(CircularProgressIndicator), findsAny);
      // expect(
      //     find.byKey(const ValueKey('templateListListView')), findsOneWidget);

      // expect(find.text(('CCR Checklist')), findsOneWidget)
      // expect(
      //     find.descendant(
      //         of: find.byType(Observer), matching: find.byType(ListView)),
      //     findsAny);
      // expect(TestWidgetFinder(), findsAny);
    });
    // testWidgets('Test if template list shows up', (tester) async {
    //   await tester.pumpWidget(createTemplateListPage());
    //   expect(find.text('Item 0'), findsOneWidget);
    //   await tester.fling(
    //     find.byType(ListView),
    //     const Offset(0, -200),
    //     3000,
    //   );
    //   await tester.pumpAndSettle();
    //   expect(find.text('Item 0'), findsNothing);
    // });
  });
}
