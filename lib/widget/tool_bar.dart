import 'package:ccrchecklist/misc/constants.dart';
import 'package:ccrchecklist/misc/flutter_extension_methods.dart';
import 'package:flutter/material.dart';

class ToolBar extends StatelessWidget {
  final List<Widget>? actions;
  final Widget? content;

  const ToolBar({
    super.key,
    this.actions,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
            if (actions != null)
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: context.ccrThemeExtension.surfaceDim,
                  borderRadius: ccrTemplateListTileBorderRadius,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions!,
                ),
              ),
          ] +
          [
            if (content != null) Expanded(child: content!),
          ],
    );
  }
}
