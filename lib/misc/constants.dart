import 'package:flutter/material.dart';

const ccrDefaultAssetsDirectory = 'assets';
const ccrConfigFile = 'config.toml';
const ccrDefaultTemplatesDirectory = '$ccrDefaultAssetsDirectory/templates';
const ccrDefaultTemplatesManifestDirectory =
    '$ccrDefaultTemplatesDirectory/manifest.json';

const double ccrDisabledOpacity = 0.6;

const ccrNoTimer = 'No Timer';

const ccrTimerBackgroundcolorFinished = Color(0xff018571);
const ccrTimerBackgroundcolorRunning = Color(0xff00e2ff);
const ccrTimerBackgroundcolorNotRunning = Color(0xffe66101);

const ccrTimerTextColorFinished = Color(0xffffffff);
const ccrTimerTextColorRunning = Color(0xff666666);
const ccrTimerTextColorNotRunning = Color(0xffffffff);

const ccrLinearityWorksheetDivider = 0.21;
const ccrLinearityWorksheetMultiplier = 1.6;

const ccrMaxReferences = 5;

const ccrSectionOkColor = Colors.green;

const ccrChecklistExtension = 'ccrc';
const ccrTemplateExtension = 'ccrt';

const ccrTemplateMimeType = 'application/vnd.ccrchecklist-ccrt+json';

const ccrDirectory = 'ccr_checklist';
const ccrTemplatesDirectory = 'templates';
const ccrShareDirectory = 'share';

enum CCRFileExistsAction { replace, chooseAnother, cancel }

const double ccrDescriptionFieldWidth = 300;

const double ccrReferenceRadioButtonWidth = 40;

const double ccrMinimumLinearity = 90;

final BorderRadius ccrTemplateListTileBorderRadius = BorderRadius.circular(16);
