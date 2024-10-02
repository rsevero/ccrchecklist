import 'package:ccr_checklist/page/template_list_page.dart';
import 'package:ccr_checklist/store/checklist_editor_store.dart';
import 'package:ccr_checklist/store/config_store.dart';
import 'package:ccr_checklist/store/template_editor_store.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
import 'package:ccr_checklist/theme/main_theme.dart';
import 'package:ccr_checklist/undo/undo_redo_storage.dart';
import 'package:flutter/material.dart';
import 'package:platform_info/platform_info.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

final undoRedoStorage = UndoRedoStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (platform.linux || platform.windows || platform.macOS) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      // Regular mobile phone screen size
      size: Size(412, 915),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      // titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(const CCRChecklist());
}

class CCRChecklist extends StatelessWidget {
  const CCRChecklist({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
      child: const CCRChecklistApp(page: TemplateListPage()),
    );
  }
}

class CCRChecklistApp extends StatelessWidget {
  final Widget page;

  const CCRChecklistApp({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CCR Checklist',
      debugShowCheckedModeBanner: false,
      theme: mainLightTheme,
      darkTheme: mainDarkTheme,
      home: page,
    );
  }
}
