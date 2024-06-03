import 'package:ccr_checklist/misc/constants.dart';
import 'package:ccr_checklist/theme/orange_color_schemes.g.dart';
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
