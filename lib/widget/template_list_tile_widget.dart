import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TemplateListTileWidget extends StatelessWidget {
  final String rebreatherManufacturer;
  final String rebreatherModel;
  final String title;
  final String description;
  final Function()? onTap;

  const TemplateListTileWidget({
    super.key,
    required this.rebreatherManufacturer,
    required this.rebreatherModel,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListTile(
        title: Text("$rebreatherManufacturer - $rebreatherModel"),
        subtitle: Text("$title - $description"),
        onTap: onTap,
      ),
    );
  }
}
