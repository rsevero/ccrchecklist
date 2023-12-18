import 'package:ccr_checklist/data/template.dart';
import 'package:ccr_checklist/data/template_file.dart';
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
      builder: (_) {
        final unsavedTemplates = templateListStore.unsavedTemplates.toList();
        final defaultTemplates = templateListStore.defaultTemplates.toList();

        return ListView(
          children: [
            if (templateListStore.unsavedTemplates.isNotEmpty)
              _buildUnsavedTile(context, unsavedTemplates),
            ..._buildDefaultTile(context, defaultTemplates),
          ],
        );
      },
    );
  }

  Widget _buildUnsavedTile(
      BuildContext context, List<Template> unsavedTemplates) {
    return ExpansionTile(
      title: const Text('Unsaved Templates'),
      children: unsavedTemplates.asMap().entries.map<Widget>(
        (entry) {
          final index = entry.key;
          final template = entry.value;
          return TemplateListTileWidget(
            rebreatherManufacturer: template.rebreatherManufacturer,
            rebreatherModel: template.rebreatherModel,
            title: template.title,
            description: template.description,
            onTap: () {
              onTapTemplateFile(context, index);
            },
          );
        },
      ).toList(),
    );
  }

  List<Widget> _buildDefaultTile(
      BuildContext context, List<TemplateFile> defaultTemplates) {
    List<Widget> manufacturers = [];
    List<Widget> models = [];
    List<Widget> templates = [];

    String currentManufacturer = '';
    String currentModel = '';

    for (var i = 0; i < defaultTemplates.length; i++) {
      final template = defaultTemplates[i];
      if (template.rebreatherManufacturer != currentManufacturer) {
        if (currentManufacturer != '') {
          models.add(
            ExpansionTile(
              title: Text(currentModel),
              children: templates,
            ),
          );
          manufacturers.add(
            Observer(
              builder: (_) => ExpansionTile(
                title: Text(currentManufacturer),
                children: models,
              ),
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
          rebreatherManufacturer: template.rebreatherManufacturer,
          rebreatherModel: template.rebreatherModel,
          title: template.title,
          description: template.description,
          onTap: () {
            onTapTemplateFile(context, i);
          },
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
      manufacturers.add(
        Observer(
          builder: (_) => ExpansionTile(
            title: Text(currentManufacturer),
            children: models,
          ),
        ),
      );
    }

    return manufacturers;
  }
}
