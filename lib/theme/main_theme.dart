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

import 'package:ccrchecklist/misc/constants.dart';
import 'package:ccrchecklist/theme/orange_color_schemes.g.dart';
import 'package:flutter/material.dart';

final mainColorScheme = ColorScheme.fromSeed(seedColor: Colors.orange);

final mainLightTheme = ThemeData(
  colorScheme: lightColorScheme,
  useMaterial3: true,
);

final mainDarkTheme = ThemeData(
  colorScheme: darkColorScheme,
  useMaterial3: true,
);

final speedDialButtonBackgroundColor = mainLightTheme.colorScheme.surface;
final speedDialButtonTextColor = mainLightTheme.colorScheme.onSurface;

const speedDialButtonDisabledBackgroundColor =
    Color.fromRGBO(224, 224, 224, ccrDisabledOpacity);
const speedDialButtonDisabledTextColor =
    Color.fromRGBO(117, 117, 117, ccrDisabledOpacity);
