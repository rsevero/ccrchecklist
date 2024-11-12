import 'package:ccr_checklist/data/template_file.dart';
import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/misc/flutter_extension_methods.dart';
import 'package:ccr_checklist/store/template_list_store.dart';
import 'package:ccr_checklist/widget/template_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TemplateList extends StatefulWidget {
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
  State<TemplateList> createState() => _TemplateListState();
}

class _TemplateListState extends State<TemplateList> {
  late Color expandedManufacturerColor;
  late Color expandedModelColor;
  late Color expandedManufacturerTextColor;
  late Color expandedModelTextColor;
  late Color collapsedManufacturerTextColor;
  late Color collapsedModelTextColor;
  late TemplateListStore templateListStore;
  late List<TemplateFile> defaultTemplates;
  String expandedManufacturer = '';
  String expandedModel = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    templateListStore = Provider.of<TemplateListStore>(context, listen: false);

    final ColorScheme colorScheme = context.colorScheme;
    expandedModelColor = colorScheme.secondaryContainer;
    expandedModelTextColor = colorScheme.onSecondaryContainer;
    expandedManufacturerColor = colorScheme.secondary;
    expandedManufacturerTextColor = colorScheme.onSecondary;
    collapsedManufacturerTextColor = colorScheme.onSurface;
    collapsedModelTextColor = colorScheme.onSurface;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        templateListStore.update();

        final observableDefaultTemplates = templateListStore.defaultTemplates;
        // ignore: unused_local_variable
        final templateListStoreState = templateListStore.state;

        defaultTemplates = observableDefaultTemplates.toList();

        final manufacturers = _buildDefaultTile(context);

        return ListView(
          children: manufacturers,
        );
      },
    );
  }

  List<ExpansionTile> _buildDefaultTile(BuildContext context) {
    List<ExpansionTile> manufacturers = [];
    List<ExpansionTile> models = [];
    List<Widget> templates = [];
    String currentManufacturer = '';
    String currentModel = '';

    for (var templateIndex = 0;
        templateIndex < defaultTemplates.length;
        templateIndex++) {
      final template = defaultTemplates[templateIndex];
      if (template.rebreatherManufacturer != currentManufacturer) {
        if (currentManufacturer != '') {
          models.add(_modelTile(currentModel, templates));
          if (models.length == 1) {
            models[0] = _expandTile(models[0]);
          }
          manufacturers.add(_manufacturerTile(currentManufacturer, models));
        }
        currentManufacturer = template.rebreatherManufacturer;
        models = [];
        currentModel = template.rebreatherModel;
        templates = [];
      } else if (template.rebreatherModel != currentModel) {
        if (currentModel != '') {
          models.add(_modelTile(currentModel, templates));
        }
        currentModel = template.rebreatherModel;
        templates = [];
      }
      templates.add(
        TemplateListTileWidget(
          title: Text(template.title,
              style: context.ccrThemeExtension.templateTitleTextTheme),
          description: Text(template.description,
              style: context.ccrThemeExtension.templateDescriptionTextTheme),
          isAsset: template.isAsset,
          isEditor: widget.isEditor,
          templateIndex: templateIndex,
          borderRadius: ccrTemplateListTileBorderRadius,
          onTap: () {
            widget.onTapTemplateFile(context, templateIndex);
          },
          onRemove: widget.onRemoveTemplateFile,
        ),
      );
    }

    if (templates.isNotEmpty) {
      models.add(_modelTile(currentModel, templates));
    }

    if (models.isNotEmpty) {
      if (models.length == 1) {
        models[0] = _expandTile(models[0]);
      }
      manufacturers.add(_manufacturerTile(currentManufacturer, models));
    }

    if (manufacturers.length == 1) {
      manufacturers[0] = _expandTile(manufacturers[0]);
    }

    return manufacturers;
  }

  ExpansionTile _expandTile(ExpansionTile tile) {
    final expandedTile = ExpansionTile(
      title: tile.title,
      backgroundColor: tile.backgroundColor,
      textColor: tile.textColor,
      collapsedTextColor: tile.collapsedTextColor,
      iconColor: tile.iconColor,
      collapsedIconColor: tile.collapsedIconColor,
      initiallyExpanded: true,
      shape: tile.shape,
      children: tile.children,
    );

    return expandedTile;
  }

  ExpansionTile _modelTile(String tileText, List<Widget> templates) {
    final ExpansionTile newModel = ExpansionTile(
      title: Text(
        tileText,
        style: context.ccrThemeExtension.modelTextTheme,
      ),
      backgroundColor: expandedModelColor,
      textColor: expandedModelTextColor,
      collapsedTextColor: collapsedModelTextColor,
      iconColor: expandedModelTextColor,
      collapsedIconColor: collapsedModelTextColor,
      shape: RoundedRectangleBorder(
        borderRadius: ccrTemplateListTileBorderRadius,
      ),
      children: templates,
    );

    return newModel;
  }

  ExpansionTile _manufacturerTile(String tileText, List<Widget> models) {
    final ExpansionTile newManufacturer = ExpansionTile(
      title: Text(
        tileText,
        style: context.ccrThemeExtension.manufacturerTextTheme,
      ),
      backgroundColor: expandedManufacturerColor,
      textColor: expandedManufacturerTextColor,
      collapsedTextColor: collapsedManufacturerTextColor,
      iconColor: expandedManufacturerTextColor,
      collapsedIconColor: collapsedManufacturerTextColor,
      shape: RoundedRectangleBorder(
        borderRadius: ccrTemplateListTileBorderRadius,
      ),
      children: models,
    );

    return newManufacturer;
  }
}
