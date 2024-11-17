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
