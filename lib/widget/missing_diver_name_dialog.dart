import 'package:flutter/material.dart';

class MissingDiverNameDialog extends StatefulWidget {
  final Function(String) onDiverNameSubmitted;

  const MissingDiverNameDialog({super.key, required this.onDiverNameSubmitted});

  @override
  State<MissingDiverNameDialog> createState() => _MissingDiverNameDialogState();
}

class _MissingDiverNameDialogState extends State<MissingDiverNameDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Missing Information'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: 'Enter Diver Name'),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Submit'),
          onPressed: () {
            widget.onDiverNameSubmitted(_controller.text);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
