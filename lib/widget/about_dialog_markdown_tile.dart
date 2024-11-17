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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutDialogMarkdownTile extends StatefulWidget {
  final String markdownPath;
  final String title;

  const AboutDialogMarkdownTile({
    super.key,
    required this.markdownPath,
    required this.title,
  });

  @override
  State<AboutDialogMarkdownTile> createState() =>
      _AboutDialogMarkdownTileState();
}

class _AboutDialogMarkdownTileState extends State<AboutDialogMarkdownTile> {
  Future<String>? _markdownFuture;

  @override
  void initState() {
    super.initState();
    _markdownFuture = _loadMarkdown();
  }

  Future<String> _loadMarkdown() async {
    return await rootBundle.loadString(widget.markdownPath);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _markdownFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return ExpansionTile(
            title: Text(widget.title),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MarkdownBody(
                  data: snapshot.data!,
                  onTapLink: (text, href, title) async {
                    if (href != null) {
                      if (await canLaunchUrlString(href)) {
                        await launchUrlString(href);
                      } else {
                        throw 'Could not launch $href';
                      }
                    }
                  },
                  styleSheet: MarkdownStyleSheet(
                    a: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
