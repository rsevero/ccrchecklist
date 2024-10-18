import "package:ccr_checklist/theme/ccr_text_theme_extension.dart";
import "package:flutter/material.dart";

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

  ThemeData theme(ColorScheme colorScheme) {
    final ThemeData theme = ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      textTheme: textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
    );

    final TextStyle appBarTextStyle =
        theme.textTheme.headlineLarge ?? const TextStyle();
    final Color foregroundColor = colorScheme.onPrimaryContainer;

    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: foregroundColor,
        titleTextStyle: appBarTextStyle.copyWith(
          fontFamily: 'Jost',
          fontWeight: FontWeight.w900,
          fontSize: 32,
          color: foregroundColor,
        ),
      ),
      extensions: [
        CCRTextThemeExtension(
          displayLarge: textTheme.displayLarge!,
          displayMedium: textTheme.displayMedium!,
          displaySmall: textTheme.displaySmall!,
          headlineLarge: textTheme.headlineLarge!,
          headlineMedium: textTheme.headlineMedium!,
          headlineSmall: textTheme.headlineSmall!,
          titleLarge: textTheme.titleLarge!,
          titleMedium: textTheme.titleMedium!,
          titleSmall: textTheme.titleSmall!,
          bodyLarge: textTheme.bodyLarge!,
          bodyMedium: textTheme.bodyMedium!,
          bodySmall: textTheme.bodySmall!,
          labelLarge: textTheme.labelLarge!,
        ),
      ],
    );
  }
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
  TextTheme bodyTextTheme = ccrGetThemeText(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme =
      ccrGetThemeText(displayFontString, baseTextTheme);
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

TextTheme ccrGetThemeText(String fontFamily, TextTheme textTheme) {
  return TextTheme(
    displayLarge: ccrGetTextStyleWithFamily(
        fontFamily: fontFamily, textStyle: textTheme.displayLarge),
    displayMedium: ccrGetTextStyleWithFamily(
        fontFamily: fontFamily, textStyle: textTheme.displayMedium),
    displaySmall: ccrGetTextStyleWithFamily(
        fontFamily: fontFamily, textStyle: textTheme.displaySmall),
    headlineLarge: ccrGetTextStyleWithFamily(
        fontFamily: fontFamily, textStyle: textTheme.headlineLarge),
    headlineMedium: ccrGetTextStyleWithFamily(
        fontFamily: fontFamily, textStyle: textTheme.headlineMedium),
    headlineSmall: ccrGetTextStyleWithFamily(
        fontFamily: fontFamily, textStyle: textTheme.headlineSmall),
    titleLarge: ccrGetTextStyleWithFamily(
        fontFamily: fontFamily, textStyle: textTheme.titleLarge),
    titleMedium: ccrGetTextStyleWithFamily(
        fontFamily: fontFamily, textStyle: textTheme.titleMedium),
    titleSmall: ccrGetTextStyleWithFamily(
        fontFamily: fontFamily, textStyle: textTheme.titleSmall),
    bodyLarge: ccrGetTextStyleWithFamily(
        fontFamily: fontFamily, textStyle: textTheme.bodyLarge),
    bodyMedium: ccrGetTextStyleWithFamily(
        fontFamily: fontFamily, textStyle: textTheme.bodyMedium),
    bodySmall: ccrGetTextStyleWithFamily(
        fontFamily: fontFamily, textStyle: textTheme.bodySmall),
    labelLarge: ccrGetTextStyleWithFamily(
        fontFamily: fontFamily, textStyle: textTheme.labelLarge),
    labelMedium: ccrGetTextStyleWithFamily(
        fontFamily: fontFamily, textStyle: textTheme.labelMedium),
    labelSmall: ccrGetTextStyleWithFamily(
        fontFamily: fontFamily, textStyle: textTheme.labelSmall),
  );
}

TextStyle ccrGetTextStyleWithFamily({
  required String fontFamily,
  TextStyle? textStyle,
}) {
  textStyle ??= const TextStyle();
  textStyle = textStyle.copyWith(
    fontFamily: fontFamily,
  );

  return textStyle;
}
