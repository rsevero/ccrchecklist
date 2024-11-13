import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'ccr_theme_extension.tailor.dart';

@TailorMixin()
class CCRThemeExtension extends ThemeExtension<CCRThemeExtension>
    with _$CCRThemeExtensionTailorMixin {
  @override
  final Color primary;
  @override
  final Color onPrimary;
  @override
  final Color secondary;
  @override
  final Color onSecondary;
  @override
  final Color tertiary;
  @override
  final Color onTertiary;
  @override
  final Color primaryContainer;
  @override
  final Color onPrimaryContainer;
  @override
  final Color secondaryContainer;
  @override
  final Color onSecondaryContainer;
  @override
  final Color tertiaryContainer;
  @override
  final Color onTertiaryContainer;
  @override
  final Color error;
  @override
  final Color onError;
  @override
  final Color surface;
  @override
  final Color onSurface;
  @override
  final Color surfaceDim;
  @override
  final Color surfaceBright;
  @override
  final Color surfaceContainerLowest;
  @override
  final Color surfaceContainerLow;
  @override
  final Color surfaceContainer;
  @override
  final Color surfaceContainerHigh;
  @override
  final Color surfaceContainerHighest;
  @override
  final Color outline;
  @override
  final Color outlineVariant;
  @override
  final Color shadow;
  @override
  final Color scrim;
  @override
  final Color inverseSurface;
  @override
  final Color inversePrimary;
  @override
  final Color onInverseSurface;
  @override
  final TextStyle displayLarge;
  @override
  final TextStyle displayMedium;
  @override
  final TextStyle displaySmall;
  @override
  final TextStyle headlineLarge;
  @override
  final TextStyle headlineMedium;
  @override
  final TextStyle headlineSmall;
  @override
  final TextStyle titleLarge;
  @override
  final TextStyle titleMedium;
  @override
  final TextStyle titleSmall;
  @override
  final TextStyle bodyLarge;
  @override
  final TextStyle bodyMedium;
  @override
  final TextStyle bodySmall;
  @override
  final TextStyle labelLarge;
  @override
  late final TextStyle manufacturerTextTheme;
  @override
  late final TextStyle modelTextTheme;
  @override
  late final TextStyle templateTitleTextTheme;
  @override
  late final TextStyle templateDescriptionTextTheme;
  @override
  late final TextStyle dialogTitleTextTheme;
  @override
  late final TextStyle dialogFieldTitleTextTheme;
  @override
  late final TextStyle dialogFieldContentTextTheme;
  @override
  late final TextStyle dialogHintTextTheme;
  @override
  late final TextStyle appBarSubtitleTextTheme;
  @override
  late final TextStyle checkDescriptionTextTheme;
  @override
  late final TextStyle checkReferenceTextTheme;
  @override
  late final TextStyle linearityColumnTitleTextTheme;
  @override
  late final TextStyle linearityColumnContentTextTheme;
  @override
  late final TextStyle timerTextTheme;

  CCRThemeExtension({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.tertiary,
    required this.onTertiary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.surface,
    required this.onSurface,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inversePrimary,
    required this.onInverseSurface,
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
  }) {
    manufacturerTextTheme = _copyUnsettingColor(headlineSmall)
        .copyWith(fontWeight: FontWeight.w200);
    modelTextTheme =
        _copyUnsettingColor(titleLarge).copyWith(fontWeight: FontWeight.w500);
    templateTitleTextTheme =
        _copyUnsettingColor(titleMedium).copyWith(fontWeight: FontWeight.w700);
    templateDescriptionTextTheme =
        _copyUnsettingColor(bodyLarge).copyWith(fontWeight: FontWeight.w300);
    dialogTitleTextTheme = _copyUnsettingColor(headlineMedium)
        .copyWith(fontWeight: FontWeight.w600);
    dialogFieldTitleTextTheme =
        _copyUnsettingColor(bodyLarge).copyWith(fontWeight: FontWeight.w400);
    dialogFieldContentTextTheme =
        _copyUnsettingColor(bodyLarge).copyWith(fontWeight: FontWeight.w500);
    dialogHintTextTheme = _copyUnsettingColor(bodyLarge).copyWith(
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w300,
    );
    appBarSubtitleTextTheme = _copyUnsettingColor(titleSmall);
    checkDescriptionTextTheme =
        _copyUnsettingColor(bodyLarge).copyWith(fontWeight: FontWeight.w500);
    checkReferenceTextTheme =
        _copyUnsettingColor(bodyLarge).copyWith(fontStyle: FontStyle.italic);
    linearityColumnTitleTextTheme = _copyUnsettingColor(bodyLarge).copyWith(
      fontWeight: FontWeight.w700,
      color: onSecondary,
    );
    linearityColumnContentTextTheme =
        _copyUnsettingColor(bodyLarge).copyWith(color: onSecondaryContainer);
    timerTextTheme =
        _copyUnsettingColor(headlineLarge).copyWith(color: onSurface);
  }

  TextStyle _copyUnsettingColor(TextStyle style) {
    final TextStyle uncoloredStyle = TextStyle(
      background: style.background,
      // color: style.color,
      debugLabel: style.debugLabel,
      decoration: style.decoration,
      decorationColor: style.decorationColor,
      decorationStyle: style.decorationStyle,
      decorationThickness: style.decorationThickness,
      fontFamily: style.fontFamily,
      fontFamilyFallback: style.fontFamilyFallback,
      fontFeatures: style.fontFeatures,
      fontSize: style.fontSize,
      fontStyle: style.fontStyle,
      fontVariations: style.fontVariations,
      fontWeight: style.fontWeight,
      foreground: style.foreground,
      height: style.height,
      // inherit: style.inherit,
      leadingDistribution: style.leadingDistribution,
      letterSpacing: style.letterSpacing,
      locale: style.locale,
      overflow: style.overflow,
      shadows: style.shadows,
      textBaseline: style.textBaseline,
      wordSpacing: style.wordSpacing,
    );

    return uncoloredStyle;
  }
}
