import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8a5100),
      surfaceTint: Color(0xff8a5100),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffa844),
      onPrimaryContainer: Color(0xff462700),
      secondary: Color(0xff795900),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffc84a),
      onSecondaryContainer: Color(0xff4f3900),
      tertiary: Color(0xff5c6300),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffb5c136),
      onTertiaryContainer: Color(0xff2a2e00),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f4),
      onSurface: Color(0xff231a11),
      onSurfaceVariant: Color(0xff544434),
      outline: Color(0xff877361),
      outlineVariant: Color(0xffdac2ad),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e25),
      inversePrimary: Color(0xffffb86d),
      primaryFixed: Color(0xffffdcbd),
      onPrimaryFixed: Color(0xff2c1600),
      primaryFixedDim: Color(0xffffb86d),
      onPrimaryFixedVariant: Color(0xff693c00),
      secondaryFixed: Color(0xffffdfa0),
      onSecondaryFixed: Color(0xff261a00),
      secondaryFixedDim: Color(0xfffbbc00),
      onSecondaryFixedVariant: Color(0xff5c4300),
      tertiaryFixed: Color(0xffdfec5d),
      onTertiaryFixed: Color(0xff1a1d00),
      tertiaryFixedDim: Color(0xffc3cf43),
      onTertiaryFixedVariant: Color(0xff454b00),
      surfaceDim: Color(0xffe9d7c9),
      surfaceBright: Color(0xfffff8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e7),
      surfaceContainer: Color(0xfffdebdc),
      surfaceContainerHigh: Color(0xfff7e5d7),
      surfaceContainerHighest: Color(0xfff1dfd1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff633900),
      surfaceTint: Color(0xff8a5100),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa96400),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff573f00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff956e00),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff414700),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff717b00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f4),
      onSurface: Color(0xff231a11),
      onSurfaceVariant: Color(0xff504030),
      outline: Color(0xff6e5c4a),
      outlineVariant: Color(0xff8b7765),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e25),
      inversePrimary: Color(0xffffb86d),
      primaryFixed: Color(0xffa96400),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff864f00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff956e00),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff765700),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff717b00),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff596100),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe9d7c9),
      surfaceBright: Color(0xfffff8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e7),
      surfaceContainer: Color(0xfffdebdc),
      surfaceContainerHigh: Color(0xfff7e5d7),
      surfaceContainerHighest: Color(0xfff1dfd1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff351c00),
      surfaceTint: Color(0xff8a5100),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff633900),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2e2000),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff573f00),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff212400),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff414700),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f4),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff2f2113),
      outline: Color(0xff504030),
      outlineVariant: Color(0xff504030),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e25),
      inversePrimary: Color(0xffffe8d5),
      primaryFixed: Color(0xff633900),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff442500),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff573f00),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3b2a00),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff414700),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2b2f00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe9d7c9),
      surfaceBright: Color(0xfffff8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e7),
      surfaceContainer: Color(0xfffdebdc),
      surfaceContainerHigh: Color(0xfff7e5d7),
      surfaceContainerHighest: Color(0xfff1dfd1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffcc9a),
      surfaceTint: Color(0xffffb86d),
      onPrimary: Color(0xff492900),
      primaryContainer: Color(0xfff79500),
      onPrimaryContainer: Color(0xff341c00),
      secondary: Color(0xffffeccc),
      onSecondary: Color(0xff402d00),
      secondaryContainer: Color(0xfff9ba00),
      onSecondaryContainer: Color(0xff453100),
      tertiary: Color(0xffccd84c),
      onTertiary: Color(0xff2f3300),
      tertiaryContainer: Color(0xffa3ae23),
      onTertiaryContainer: Color(0xff1b1e00),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a120a),
      onSurface: Color(0xfff1dfd1),
      onSurfaceVariant: Color(0xffdac2ad),
      outline: Color(0xffa28d7a),
      outlineVariant: Color(0xff544434),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfd1),
      inversePrimary: Color(0xff8a5100),
      primaryFixed: Color(0xffffdcbd),
      onPrimaryFixed: Color(0xff2c1600),
      primaryFixedDim: Color(0xffffb86d),
      onPrimaryFixedVariant: Color(0xff693c00),
      secondaryFixed: Color(0xffffdfa0),
      onSecondaryFixed: Color(0xff261a00),
      secondaryFixedDim: Color(0xfffbbc00),
      onSecondaryFixedVariant: Color(0xff5c4300),
      tertiaryFixed: Color(0xffdfec5d),
      onTertiaryFixed: Color(0xff1a1d00),
      tertiaryFixedDim: Color(0xffc3cf43),
      onTertiaryFixedVariant: Color(0xff454b00),
      surfaceDim: Color(0xff1a120a),
      surfaceBright: Color(0xff42372d),
      surfaceContainerLowest: Color(0xff140d06),
      surfaceContainerLow: Color(0xff231a11),
      surfaceContainer: Color(0xff271e15),
      surfaceContainerHigh: Color(0xff32281f),
      surfaceContainerHighest: Color(0xff3d3329),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffcc9a),
      surfaceTint: Color(0xffffb86d),
      onPrimary: Color(0xff331b00),
      primaryContainer: Color(0xfff79500),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffeccc),
      onSecondary: Color(0xff402d00),
      secondaryContainer: Color(0xfff9ba00),
      onSecondaryContainer: Color(0xff150d00),
      tertiary: Color(0xffccd84c),
      onTertiary: Color(0xff1a1d00),
      tertiaryContainer: Color(0xffa3ae23),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a120a),
      onSurface: Color(0xfffffaf8),
      onSurfaceVariant: Color(0xffdfc6b1),
      outline: Color(0xffb59f8b),
      outlineVariant: Color(0xff947f6d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfd1),
      inversePrimary: Color(0xff6a3d00),
      primaryFixed: Color(0xffffdcbd),
      onPrimaryFixed: Color(0xff1e0d00),
      primaryFixedDim: Color(0xffffb86d),
      onPrimaryFixedVariant: Color(0xff512e00),
      secondaryFixed: Color(0xffffdfa0),
      onSecondaryFixed: Color(0xff191000),
      secondaryFixedDim: Color(0xfffbbc00),
      onSecondaryFixedVariant: Color(0xff473300),
      tertiaryFixed: Color(0xffdfec5d),
      onTertiaryFixed: Color(0xff101300),
      tertiaryFixedDim: Color(0xffc3cf43),
      onTertiaryFixedVariant: Color(0xff343900),
      surfaceDim: Color(0xff1a120a),
      surfaceBright: Color(0xff42372d),
      surfaceContainerLowest: Color(0xff140d06),
      surfaceContainerLow: Color(0xff231a11),
      surfaceContainer: Color(0xff271e15),
      surfaceContainerHigh: Color(0xff32281f),
      surfaceContainerHighest: Color(0xff3d3329),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffffaf8),
      surfaceTint: Color(0xffffb86d),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffbe7b),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf7),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffc11d),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffbffc5),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc7d447),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a120a),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffffaf8),
      outline: Color(0xffdfc6b1),
      outlineVariant: Color(0xffdfc6b1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfd1),
      inversePrimary: Color(0xff402300),
      primaryFixed: Color(0xffffe2c8),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffbe7b),
      onPrimaryFixedVariant: Color(0xff251200),
      secondaryFixed: Color(0xffffe4b0),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffc11d),
      onSecondaryFixedVariant: Color(0xff1f1500),
      tertiaryFixed: Color(0xffe3f061),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc7d447),
      onTertiaryFixedVariant: Color(0xff151800),
      surfaceDim: Color(0xff1a120a),
      surfaceBright: Color(0xff42372d),
      surfaceContainerLowest: Color(0xff140d06),
      surfaceContainerLow: Color(0xff231a11),
      surfaceContainer: Color(0xff271e15),
      surfaceContainerHigh: Color(0xff32281f),
      surfaceContainerHighest: Color(0xff3d3329),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          titleTextStyle: textTheme.displaySmall!.copyWith(
              color: colorScheme.onPrimary, fontWeight: FontWeight.w800),
        ),
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

TextTheme createTextTheme(
    BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme =
      GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme =
      GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}
