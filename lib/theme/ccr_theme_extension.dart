import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'ccr_theme_extension.tailor.dart';

@TailorMixin()
class CCRThemeExtension extends ThemeExtension<CCRThemeExtension>
    with _$CCRThemeExtensionTailorMixin {
  CCRThemeExtension({
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
    manufacturerTextTheme = _copyUnsettingColor(
        headlineSmall.copyWith(fontWeight: FontWeight.w200));
    modelTextTheme =
        _copyUnsettingColor(titleLarge.copyWith(fontWeight: FontWeight.w500));
    templateTitleTextTheme =
        _copyUnsettingColor(titleMedium.copyWith(fontWeight: FontWeight.w700));
    templateDescriptionTextTheme =
        _copyUnsettingColor(bodyLarge.copyWith(fontWeight: FontWeight.w300));
    dialogTitleTextTheme = _copyUnsettingColor(
        headlineMedium.copyWith(fontWeight: FontWeight.w600));
    dialogFieldTitleTextTheme =
        _copyUnsettingColor(bodyLarge.copyWith(fontWeight: FontWeight.w400));
    dialogFieldContentTextTheme =
        _copyUnsettingColor(bodyLarge.copyWith(fontWeight: FontWeight.w500));
    dialogHintTextTheme = _copyUnsettingColor(bodyLarge.copyWith(
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.italic,
    ));
    appBarSubtitleTextTheme = _copyUnsettingColor(titleSmall);
  }

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
