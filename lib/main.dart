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

import 'package:ccrchecklist/page/template_list_page.dart';
import 'package:ccrchecklist/store/checklist_editor_store.dart';
import 'package:ccrchecklist/store/config_store.dart';
import 'package:ccrchecklist/store/template_editor_store.dart';
import 'package:ccrchecklist/store/template_list_store.dart';
import 'package:ccrchecklist/theme/material_theme.dart';
import 'package:ccrchecklist/undo/undo_redo_storage.dart';
import 'package:flutter/material.dart';
import 'package:platform_info/platform_info.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

final undoRedoStorage = UndoRedoStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Force mobile like screen size on desktop plataforms.
  if (platform.linux || platform.windows || platform.macOS) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      title: 'CCR Checklist',
      // Regular mobile phone screen size
      size: Size(412, 915),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
    );
    windowManager.waitUntilReadyToShow(
      windowOptions,
      () async {
        await windowManager.show();
        await windowManager.focus();
      },
    );
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
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, 'Jost', 'SpaceGrotesk');
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'CCR Checklist',
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: page,
    );
  }
}
