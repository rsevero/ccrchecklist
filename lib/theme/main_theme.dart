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

final speedDialButtonBackgroundColor = mainLightTheme.colorScheme.background;
final speedDialButtonTextColor = mainLightTheme.colorScheme.onBackground;
// final speedDialButtonDisabledBackgroundColor =
//     mainLightTheme.colorScheme.outline;
// final speedDialButtonDisabledTextColor =
//     mainLightTheme.colorScheme.outlineVariant;
final speedDialButtonDisabledBackgroundColor = Colors.grey[300];
final speedDialButtonDisabledTextColor = Colors.grey[600];
