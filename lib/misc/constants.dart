// CCR Checklist - a checklist app for rebreather users
// Copyright (C) 2024  Rodrigo Severo
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

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

const String ccrUrlChangelog =
    'https://github.com/rsevero/ccrchecklist/blob/main/CHANGELOG.md';
const String ccrUrlReadme =
    'https://github.com/rsevero/ccrchecklist/blob/main/README.md';

const String ccrDirectory = 'ccrchecklist';
const String ccrTemplatesDirectory = 'templates';
const String ccrShareDirectory = 'share';

const String ccrNoDiverName = 'No Diver Name set';
const String ccrNoDescription = 'No Description set';

enum CCRFileExistsAction { replace, chooseAnother, cancel }

const double ccrDescriptionFieldWidth = 300;

const double ccrReferenceRadioButtonWidth = 40;

const double ccrMinimumLinearity = 90;

const double ccrBorderRadius = 16;
final BorderRadius ccrTemplateListTileBorderRadius =
    BorderRadius.circular(ccrBorderRadius);
