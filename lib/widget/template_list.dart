import 'package:ccr_checklist/store/template_list_store.dart';
import 'package:ccr_checklist/widget/template_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TemplateList extends StatelessWidget {
  final Function(BuildContext, int) onTapTemplate;
  final Function(BuildContext, int) onTapTemplateFile;
  const TemplateList({
    super.key,
    required this.onTapTemplate,
    required this.onTapTemplateFile,
  });

  @override
  Widget build(BuildContext context) {
    final templateListStore = Provider.of<TemplateListStore>(context);

    return Observer(
      builder: (_) => ListView.builder(
        itemCount: templateListStore.defaultTemplates.length,
        itemBuilder: (context, index) {
          return TemplateListTileWidget(
            rebreatherManufacturer: templateListStore
                .defaultTemplates[index].rebreatherManufacturer,
            rebreatherModel:
                templateListStore.defaultTemplates[index].rebreatherModel,
            title: templateListStore.defaultTemplates[index].title,
            description: templateListStore.defaultTemplates[index].description,
            onTap: () {
              onTapTemplateFile(context, index);
            },
          );
        },
      ),
    );
  }
}
