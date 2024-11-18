import 'package:ccrchecklist/misc/constants.dart';
import 'package:ccrchecklist/misc/flutter_extension_methods.dart';
import 'package:flutter/material.dart';

class ToolBar extends StatelessWidget {
  final String title;
  final List<Widget> buttons;
  final List<Widget> contents;

  const ToolBar({
    super.key,
    required this.title,
    required this.buttons,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
            AppBar(
              title: Text(title),
              elevation: 4,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: context.ccrThemeExtension.surfaceDim,
                borderRadius: ccrTemplateListTileBorderRadius,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: buttons,
              ),
            ),
          ] +
          contents,
    );
  }
}
