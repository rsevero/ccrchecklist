import 'package:ccr_checklist/data/template_file.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
import 'package:ccr_checklist/widget/template_list_tile_widget.dart';
import 'package:expansion_tile_list/expansion_tile_list.dart';
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
        return ExpansionTileList.radio(
          children: _buildDefaultTile(context, defaultTemplates),
        );
      },
    );
  }

  List<ExpansionTile> _buildDefaultTile(
      BuildContext context, List<TemplateFile> defaultTemplates) {
    List<ExpansionTile> manufacturers = [];
    List<Widget> models = [];
    List<Widget> templates = [];

    String currentManufacturer = '';
    String currentModel = '';

    final TextTheme currentTextTheme = Theme.of(context).textTheme;
    final TextStyle manufacturerTextTheme =
        currentTextTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w200);
    final TextStyle modelTextTheme =
        currentTextTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500);
    final TextStyle templateTitleTextTheme =
        currentTextTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700);
    final TextStyle templateDescriptionTextTheme =
        currentTextTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w300);

    for (var templateIndex = 0;
        templateIndex < defaultTemplates.length;
        templateIndex++) {
      final template = defaultTemplates[templateIndex];
      if (template.rebreatherManufacturer != currentManufacturer) {
        if (currentManufacturer != '') {
          models.add(
            ExpansionTile(
              title: Text(
                currentModel,
                style: modelTextTheme,
              ),
              children: templates,
            ),
          );
          if (models.length == 1) {
            models[0] = _expandTile(models[0] as ExpansionTile);
          } else {
            models = [
              ExpansionTileList.radio(
                children: models.map((e) => e as ExpansionTile).toList(),
              ),
            ];
          }
          manufacturers.add(
            ExpansionTile(
              title: Text(
                currentManufacturer,
                style: manufacturerTextTheme,
              ),
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
              title: Text(
                currentModel,
                style: modelTextTheme,
              ),
              children: templates,
            ),
          );
        }
        currentModel = template.rebreatherModel;
        templates = [];
      }
      templates.add(
        TemplateListTileWidget(
          title: Text(template.title, style: templateTitleTextTheme),
          description:
              Text(template.description, style: templateDescriptionTextTheme),
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
          title: Text(
            currentModel,
            style: modelTextTheme,
          ),
          children: templates,
        ),
      );
    }

    if (models.isNotEmpty) {
      if (models.length == 1) {
        models[0] = _expandTile(models[0] as ExpansionTile);
      } else {
        models = [
          ExpansionTileList.radio(
            children: models.map((e) => e as ExpansionTile).toList(),
          ),
        ];
      }
      manufacturers.add(
        ExpansionTile(
          title: Text(
            currentManufacturer,
            style: manufacturerTextTheme,
          ),
          children: models,
        ),
      );
    }

    if (manufacturers.length == 1) {
      manufacturers[0] = _expandTile(manufacturers[0]);
    }

    return manufacturers;
  }

  ExpansionTile _expandTile(ExpansionTile tile) {
    return ExpansionTile(
      title: tile.title,
      initiallyExpanded: true,
      children: tile.children,
    );
  }
}
