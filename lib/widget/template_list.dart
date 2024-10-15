import 'package:ccr_checklist/data/template_file.dart';
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
  late TextStyle manufacturerTextTheme;
  late TextStyle modelTextTheme;
  late Color expandedManufacturerColor;
  late Color expandedModelColor;
  late Color expandedManufacturerTextColor;
  late Color expandedModelTextColor;
  late Color collapsedManufacturerTextColor;
  late Color collapsedModelTextColor;
  late TextStyle templateTitleTextTheme;
  late TextStyle templateDescriptionTextTheme;
  late TemplateListStore templateListStore;
  late List<TemplateFile> defaultTemplates;
  late String currentManufacturer;
  late String currentModel;
  String expandedManufacturer = '';
  String expandedModel = '';

  @override
  Widget build(BuildContext context) {
    templateListStore = Provider.of<TemplateListStore>(context);
    templateListStore.update();
    currentManufacturer = '';
    currentModel = '';

    return Observer(
      builder: (_) {
        final observableDefaultTemplates = templateListStore.defaultTemplates;

        defaultTemplates = observableDefaultTemplates.toList();

        return ListView(
          children: _buildDefaultTile(context),
        );
      },
    );
  }

  List<ExpansionTile> _buildDefaultTile(BuildContext context) {
    List<ExpansionTile> manufacturers = [];
    List<ExpansionTile> models = [];
    List<Widget> templates = [];

    final ThemeData currentTheme = Theme.of(context);

    final ColorScheme currentColorScheme = currentTheme.colorScheme;
    expandedModelColor = currentColorScheme.secondaryContainer;
    expandedModelTextColor = currentColorScheme.onSecondaryContainer;
    expandedManufacturerColor = currentColorScheme.secondary;
    expandedManufacturerTextColor = currentColorScheme.onSecondary;
    collapsedManufacturerTextColor = currentColorScheme.onSurface;
    collapsedModelTextColor = currentColorScheme.onSurface;

    final TextTheme currentTextTheme = currentTheme.textTheme;
    manufacturerTextTheme =
        currentTextTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w200);
    manufacturerTextTheme = _copyUnsettingColor(manufacturerTextTheme);
    modelTextTheme =
        currentTextTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500);
    modelTextTheme = _copyUnsettingColor(modelTextTheme);
    templateTitleTextTheme =
        currentTextTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700);
    templateTitleTextTheme = _copyUnsettingColor(templateTitleTextTheme);
    templateDescriptionTextTheme =
        currentTextTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w300);
    templateDescriptionTextTheme =
        _copyUnsettingColor(templateDescriptionTextTheme);

    for (var templateIndex = 0;
        templateIndex < defaultTemplates.length;
        templateIndex++) {
      final template = defaultTemplates[templateIndex];
      if (template.rebreatherManufacturer != currentManufacturer) {
        if (currentManufacturer != '') {
          models.add(_modelTile(templates));
          if (models.length == 1) {
            models[0] = _expandTile(models[0]);
          }
          manufacturers.add(_manufacturerTile(models));
        }
        currentManufacturer = template.rebreatherManufacturer;
        models = [];
        currentModel = template.rebreatherModel;
        templates = [];
      } else if (template.rebreatherModel != currentModel) {
        if (currentModel != '') {
          models.add(_modelTile(templates));
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
          isEditor: widget.isEditor,
          templateIndex: templateIndex,
          onTap: () {
            widget.onTapTemplateFile(context, templateIndex);
          },
          onRemove: widget.onRemoveTemplateFile,
        ),
      );
    }

    if (templates.isNotEmpty) {
      models.add(_modelTile(templates));
    }

    if (models.isNotEmpty) {
      if (models.length == 1) {
        models[0] = _expandTile(models[0]);
      }
      manufacturers.add(_manufacturerTile(models));
    }

    if (manufacturers.length == 1) {
      manufacturers[0] = _expandTile(manufacturers[0]);
    }

    return manufacturers;
  }

  TextStyle _copyUnsettingColor(TextStyle style) {
    final TextStyle uncoloredStyle = TextStyle(
      background: style.background,
      // color: style.color,
      debugLabel: style.debugLabel,
      decoration: style.decoration,
      decorationColor: style.decorationColor,
      decorationStyle: style.decorationStyle,
      decorationThickness: style.decorationThickness,
      fontFamily: style.fontFamily,
      fontFamilyFallback: style.fontFamilyFallback,
      fontFeatures: style.fontFeatures,
      fontSize: style.fontSize,
      fontStyle: style.fontStyle,
      fontVariations: style.fontVariations,
      fontWeight: style.fontWeight,
      foreground: style.foreground,
      height: style.height,
      // inherit: style.inherit,
      leadingDistribution: style.leadingDistribution,
      letterSpacing: style.letterSpacing,
      locale: style.locale,
      overflow: style.overflow,
      shadows: style.shadows,
      textBaseline: style.textBaseline,
      wordSpacing: style.wordSpacing,
    );
    return uncoloredStyle;
  }

  ExpansionTile _expandTile(ExpansionTile tile) {
    final expandedTile = ExpansionTile(
      title: tile.title,
      backgroundColor: tile.backgroundColor,
      textColor: tile.textColor,
      collapsedTextColor: tile.collapsedTextColor,
      iconColor: tile.iconColor,
      initiallyExpanded: true,
      children: tile.children,
    );

    return expandedTile;
  }

  ExpansionTile _modelTile(List<Widget> templates) {
    final ExpansionTile newModel = ExpansionTile(
      title: Text(
        currentModel,
        style: modelTextTheme,
      ),
      backgroundColor: expandedModelColor,
      textColor: expandedModelTextColor,
      collapsedTextColor: collapsedModelTextColor,
      iconColor: expandedModelTextColor,
      collapsedIconColor: collapsedModelTextColor,
      children: templates,
    );

    return newModel;
  }

  ExpansionTile _manufacturerTile(List<Widget> models) {
    final ExpansionTile newManufacturer = ExpansionTile(
      title: Text(
        currentManufacturer,
        style: manufacturerTextTheme,
      ),
      backgroundColor: expandedManufacturerColor,
      textColor: expandedManufacturerTextColor,
      collapsedTextColor: collapsedManufacturerTextColor,
      iconColor: expandedManufacturerTextColor,
      collapsedIconColor: collapsedManufacturerTextColor,
      children: models,
    );

    return newManufacturer;
  }
}
