import 'package:flutter/material.dart';

class MissingDiverNameDialog extends StatefulWidget {
  final Function(String) onDiverNameSubmitted;

  const MissingDiverNameDialog({super.key, required this.onDiverNameSubmitted});

  @override
  State<MissingDiverNameDialog> createState() => _MissingDiverNameDialogState();
}

class _MissingDiverNameDialogState extends State<MissingDiverNameDialog> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Automatically focus the TextField when the dialog is displayed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    widget.onDiverNameSubmitted(_controller.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Missing Information'),
      content: TextField(
        controller: _controller,
        focusNode: _focusNode,
        decoration: const InputDecoration(hintText: 'Enter Diver Name'),
        onSubmitted: (_) => _handleSubmit(),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: _handleSubmit,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
