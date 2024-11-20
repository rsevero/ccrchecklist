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

import 'package:ccrchecklist/widget/about_dialog_markdown_tile.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_info/platform_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
    applicationLegalese: '© 2024 Rodrigo Severo',
    children: <Widget>[
      ListTile(
        title: InkWell(
          child: const Text(
            'View CHANGELOG',
            style: TextStyle(
                color: Colors.blue, decoration: TextDecoration.underline),
          ),
          onTap: () async {
            const url =
                'https://github.com/rsevero/ccrchecklist/blob/main/CHANGELOG.md';
            final Uri uri = Uri.parse(url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
      ),
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
        title: 'No warranties. Be responsable.',
        markdownPath: 'assets/texts/no_warranties.md',
      ),
      AboutDialogMarkdownTile(
        title: 'How to report bugs',
        markdownPath: 'assets/texts/how_to_report_bugs.md',
      ),
      AboutDialogMarkdownTile(
        title: 'Ownership of checklists',
        markdownPath: 'assets/texts/ownership_checklists.md',
      ),
      AboutDialogMarkdownTile(
        title: 'Privacy policy',
        markdownPath: 'assets/texts/privacy_policy.md',
      ),
    ],
  );
}
