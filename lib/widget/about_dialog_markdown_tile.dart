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
