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
    return ListTile(
      title: title,
      subtitle: description,
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
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
