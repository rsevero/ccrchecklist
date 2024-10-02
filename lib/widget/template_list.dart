import 'package:ccr_checklist/data/template_file.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
import 'package:ccr_checklist/widget/template_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TemplateList extends StatelessWidget {
  final Function(BuildContext, int) onTapTemplateFile;
  final Function(BuildContext, int)? onRemoveTemplateFile;
  final bool isEditor;

  const TemplateList({
    super.key,
    required this.onTapTemplateFile,
    required this.isEditor,
    this.onRemoveTemplateFile,
  });

  @override
  Widget build(BuildContext context) {
    final templateListStore = Provider.of<TemplateListStore>(context);
    templateListStore.update();

    return Observer(
      builder: (_) {
        if (templateListStore.state != TemplateListStoreState.uptodate) {
          return const Center(child: CircularProgressIndicator());
        }

        final defaultTemplates = templateListStore.defaultTemplates.toList();
        return ListView(
          children: _buildDefaultTile(context, defaultTemplates),
        );
      },
    );
  }

  List<Widget> _buildDefaultTile(
      BuildContext context, List<TemplateFile> defaultTemplates) {
    List<Widget> manufacturers = [];
    List<Widget> models = [];
    List<Widget> templates = [];

    String currentManufacturer = '';
    String currentModel = '';

    for (var templateIndex = 0;
        templateIndex < defaultTemplates.length;
        templateIndex++) {
      final template = defaultTemplates[templateIndex];
      if (template.rebreatherManufacturer != currentManufacturer) {
        if (currentManufacturer != '') {
          models.add(
            ExpansionTile(
              title: Text(currentModel),
              children: templates,
            ),
          );
          if (models.length == 1) {
            models[0] = _expandRegularTile(models[0] as ExpansionTile);
          }
          manufacturers.add(
            ExpansionTile(
              title: Text(currentManufacturer),
              children: models,
            ),
          );
        }
        currentManufacturer = template.rebreatherManufacturer;
        models = [];
        currentModel = template.rebreatherModel;
        templates = [];
      } else if (template.rebreatherModel != currentModel) {
        if (currentModel != '') {
          models.add(
            ExpansionTile(
              title: Text(currentModel),
              children: templates,
            ),
          );
        }
        currentModel = template.rebreatherModel;
        templates = [];
      }
      templates.add(
        TemplateListTileWidget(
          title: template.title,
          description: template.description,
          isAsset: template.isAsset,
          isEditor: isEditor,
          templateIndex: templateIndex,
          onTap: () {
            onTapTemplateFile(context, templateIndex);
          },
          onRemove: onRemoveTemplateFile,
        ),
      );
    }

    if (templates.isNotEmpty) {
      models.add(
        ExpansionTile(
          title: Text(currentModel),
          children: templates,
        ),
      );
    }

    if (models.isNotEmpty) {
      if (models.length == 1) {
        models[0] = _expandRegularTile(models[0] as ExpansionTile);
      }
      manufacturers.add(
        ExpansionTile(
          title: Text(currentManufacturer),
          children: models,
        ),
      );
    }

    if (manufacturers.length == 1) {
      manufacturers[0] = _expandRegularTile(manufacturers[0] as ExpansionTile);
    }

    return manufacturers;
  }

  ExpansionTile _expandRegularTile(ExpansionTile tile) {
    return ExpansionTile(
      title: tile.title,
      initiallyExpanded: true,
      children: tile.children,
    );
  }
}
