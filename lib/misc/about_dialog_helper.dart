import 'package:ccrchecklist/widget/about_dialog_markdown_tile.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_info/platform_info.dart';

void showCCRAboutDialog(BuildContext context) async {
  final Platform platform = Platform.instance;
  final String osVersion = platform.version;
  final String operatingSystem = platform.operatingSystem.name;

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String appVersion = packageInfo.version;

  if (!context.mounted) return;
  showAboutDialog(
    context: context,
    applicationName: 'CCR Checklist',
    applicationVersion: appVersion,
    applicationIcon: Image.asset(
      'assets/icons/ccrchecklist.png',
      width: 48,
      height: 48,
    ),
    applicationLegalese: '© 2024 CCR Checklist Developers',
    children: <Widget>[
      ExpansionTile(
        title: const Text('Operating System'),
        children: <Widget>[
          ListTile(
            title: Text('OS: $operatingSystem'),
            subtitle: Text('Version: $osVersion'),
          ),
        ],
      ),
      AboutDialogMarkdownTile(
        title: 'How to report bugs',
        markdownPath: 'assets/texts/how_to_report_bugs.md',
      ),
      AboutDialogMarkdownTile(
        title: 'Ownership of checklists',
        markdownPath: 'assets/texts/ownership_checklists.md',
      ),
    ],
  );
}
