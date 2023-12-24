import 'package:flutter/material.dart';

class TemplateListTileWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool isAsset;
  final bool isEditor;
  final int templateIndex;
  final Function() onTap;
  final Function(BuildContext, int)? onRemove;

  const TemplateListTileWidget({
    super.key,
    required this.title,
    required this.description,
    required this.isAsset,
    required this.isEditor,
    required this.templateIndex,
    required this.onTap,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      onTap: onTap,
      trailing: !isEditor || isAsset
          ? null
          : IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onRemove == null
                  ? null
                  : () => onRemove!(context, templateIndex),
              tooltip: 'Remove',
            ),
    );
  }
}
