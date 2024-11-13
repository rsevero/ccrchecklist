import 'package:flutter/material.dart';

const String ccrDefaultAssetsDirectory = 'assets';
const String ccrConfigFile = 'config.toml';
const String ccrDefaultTemplatesDirectory =
    '$ccrDefaultAssetsDirectory/templates';
const String ccrDefaultTemplatesManifestDirectory =
    '$ccrDefaultTemplatesDirectory/manifest.json';

const double ccrDisabledOpacity = 0.6;

const String ccrNoTimer = 'No Timer';

const double ccrLinearityWorksheetDivider = 0.21;
const double ccrLinearityWorksheetMultiplier = 1.6;

const int ccrMaxReferences = 8;
const int ccrMaxLinearityMeasurements = 8;

const double ccrVerticalPaddingItem = 4.0;

const int ccrSecondsInAMinute = 60;

const String ccrChecklistExtension = 'ccrc';
const String ccrTemplateExtension = 'ccrt';

const String ccrTemplateMimeType = 'application/vnd.ccrchecklist-ccrt+json';

const String ccrDirectory = 'ccr_checklist';
const String ccrTemplatesDirectory = 'templates';
const String ccrShareDirectory = 'share';

enum CCRFileExistsAction { replace, chooseAnother, cancel }

const double ccrDescriptionFieldWidth = 300;

const double ccrReferenceRadioButtonWidth = 40;

const double ccrMinimumLinearity = 90;

const double ccrBorderRadius = 16;
final BorderRadius ccrTemplateListTileBorderRadius =
    BorderRadius.circular(ccrBorderRadius);
