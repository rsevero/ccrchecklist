import 'package:flutter/material.dart';

class CheckListAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String description;
  final String rebreatherManufacturer;
  final String rebreatherModel;

  const CheckListAppBar({
    super.key,
    required this.title,
    required this.description,
    required this.rebreatherManufacturer,
    required this.rebreatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$title - $description'),
          Text(
            '$rebreatherManufacturer $rebreatherModel',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
