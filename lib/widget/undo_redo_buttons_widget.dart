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

class UndoRedoButtonsWidget extends StatelessWidget {
  final Function()? undo;
  final Function()? redo;
  final bool canUndo;
  final bool canRedo;
  final String undoDescription;
  final String redoDescription;

  const UndoRedoButtonsWidget({
    super.key,
    this.undo,
    this.redo,
    required this.canUndo,
    required this.canRedo,
    required this.undoDescription,
    required this.redoDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: canUndo ? undo : null,
          icon: const Icon(Icons.undo_rounded),
          tooltip: undoDescription,
        ),
        IconButton(
          onPressed: canRedo ? redo : null,
          icon: const Icon(Icons.redo_rounded),
          tooltip: redoDescription,
        ),
      ],
    );
  }
}
