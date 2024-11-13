import 'package:flutter/material.dart';

const ccrDefaultAssetsDirectory = 'assets';
const ccrConfigFile = 'config.toml';
const ccrDefaultTemplatesDirectory = '$ccrDefaultAssetsDirectory/templates';
const ccrDefaultTemplatesManifestDirectory =
    '$ccrDefaultTemplatesDirectory/manifest.json';

const double ccrDisabledOpacity = 0.6;

const String ccrNoTimer = 'No Timer';

const Color ccrTimerBackgroundcolorFinished = Color(0xff018571);
const Color ccrTimerBackgroundcolorRunning = Color(0xff00e2ff);
const Color ccrTimerBackgroundcolorNotRunning = Color(0xffe66101);

const Color ccrTimerTextColorFinished = Color(0xffffffff);
const Color ccrTimerTextColorRunning = Color(0xff666666);
const Color ccrTimerTextColorNotRunning = Color(0xffffffff);

const double ccrLinearityWorksheetDivider = 0.21;
const double ccrLinearityWorksheetMultiplier = 1.6;

const int ccrMaxReferences = 8;
const int ccrMaxLinearityMeasurements = 8;

const double ccrVerticalPaddingItem = 4.0;

const int ccrSecondsInAMinute = 60;

const ccrSectionOkColor = Colors.green;

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
