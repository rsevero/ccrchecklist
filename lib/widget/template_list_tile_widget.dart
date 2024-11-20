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

import 'package:ccrchecklist/misc/flutter_extension_methods.dart';
import 'package:flutter/material.dart';

class TemplateListTileWidget extends StatelessWidget {
  final Widget title;
  final Widget description;
  final bool isAsset;
  final bool isEditor;
  final int templateIndex;
  final BorderRadius borderRadius;
  final Function() onTap;
  final Function(BuildContext, int)? onRemove;

  const TemplateListTileWidget({
    super.key,
    required this.title,
    required this.description,
    required this.isAsset,
    required this.isEditor,
    required this.borderRadius,
    required this.templateIndex,
    required this.onTap,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: ListTile(
        title: title,
        subtitle: description,
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        tileColor: context.ccrThemeExtension.surfaceContainerHigh,
        trailing: !isEditor || isAsset
            ? null
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: onRemove == null
                    ? null
                    : () => onRemove!(context, templateIndex),
                tooltip: 'Remove',
              ),
      ),
    );
  }
}
