import 'package:ccr_checklist/misc/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class HelpDialog extends StatelessWidget {
  final String pageName;
  final Future<String> helpTextFuture;

  const HelpDialog(
      {super.key, required this.helpTextFuture, required this.pageName});

  @override
  Widget build(BuildContext context) {
    final helpDialogTitle = '${ccrSeparateCamelCase(pageName)} Help';

    return AlertDialog(
      title: Text(helpDialogTitle),
      content: FutureBuilder<String>(
        future: helpTextFuture,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Markdown(
                data: snapshot.data ?? 'No help available.',
              ),
            );
          }
        },
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
