// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'ccr_text_theme_extension.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$CCRTextThemeExtensionTailorMixin
    on ThemeExtension<CCRTextThemeExtension> {
  TextStyle get displayLarge;
  TextStyle get displayMedium;
  TextStyle get displaySmall;
  TextStyle get headlineLarge;
  TextStyle get headlineMedium;
  TextStyle get headlineSmall;
  TextStyle get titleLarge;
  TextStyle get titleMedium;
  TextStyle get titleSmall;
  TextStyle get bodyLarge;
  TextStyle get bodyMedium;
  TextStyle get bodySmall;
  TextStyle get labelLarge;
  TextStyle get manufacturerTextTheme;
  TextStyle get modelTextTheme;
  TextStyle get templateTitleTextTheme;
  TextStyle get templateDescriptionTextTheme;

  @override
  CCRTextThemeExtension copyWith({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? manufacturerTextTheme,
    TextStyle? modelTextTheme,
    TextStyle? templateTitleTextTheme,
    TextStyle? templateDescriptionTextTheme,
  }) {
    return CCRTextThemeExtension(
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      displaySmall: displaySmall ?? this.displaySmall,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineSmall: headlineSmall ?? this.headlineSmall,
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
    );
  }

  @override
  CCRTextThemeExtension lerp(
      covariant ThemeExtension<CCRTextThemeExtension>? other, double t) {
    if (other is! CCRTextThemeExtension) return this as CCRTextThemeExtension;
    return CCRTextThemeExtension(
      displayLarge: TextStyle.lerp(displayLarge, other.displayLarge, t)!,
      displayMedium: TextStyle.lerp(displayMedium, other.displayMedium, t)!,
      displaySmall: TextStyle.lerp(displaySmall, other.displaySmall, t)!,
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t)!,
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t)!,
      headlineSmall: TextStyle.lerp(headlineSmall, other.headlineSmall, t)!,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CCRTextThemeExtension &&
            const DeepCollectionEquality()
                .equals(displayLarge, other.displayLarge) &&
            const DeepCollectionEquality()
                .equals(displayMedium, other.displayMedium) &&
            const DeepCollectionEquality()
                .equals(displaySmall, other.displaySmall) &&
            const DeepCollectionEquality()
                .equals(headlineLarge, other.headlineLarge) &&
            const DeepCollectionEquality()
                .equals(headlineMedium, other.headlineMedium) &&
            const DeepCollectionEquality()
                .equals(headlineSmall, other.headlineSmall) &&
            const DeepCollectionEquality()
                .equals(titleLarge, other.titleLarge) &&
            const DeepCollectionEquality()
                .equals(titleMedium, other.titleMedium) &&
            const DeepCollectionEquality()
                .equals(titleSmall, other.titleSmall) &&
            const DeepCollectionEquality().equals(bodyLarge, other.bodyLarge) &&
            const DeepCollectionEquality()
                .equals(bodyMedium, other.bodyMedium) &&
            const DeepCollectionEquality().equals(bodySmall, other.bodySmall) &&
            const DeepCollectionEquality()
                .equals(labelLarge, other.labelLarge) &&
            const DeepCollectionEquality()
                .equals(manufacturerTextTheme, other.manufacturerTextTheme) &&
            const DeepCollectionEquality()
                .equals(modelTextTheme, other.modelTextTheme) &&
            const DeepCollectionEquality()
                .equals(templateTitleTextTheme, other.templateTitleTextTheme) &&
            const DeepCollectionEquality().equals(templateDescriptionTextTheme,
                other.templateDescriptionTextTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(displayLarge),
      const DeepCollectionEquality().hash(displayMedium),
      const DeepCollectionEquality().hash(displaySmall),
      const DeepCollectionEquality().hash(headlineLarge),
      const DeepCollectionEquality().hash(headlineMedium),
      const DeepCollectionEquality().hash(headlineSmall),
      const DeepCollectionEquality().hash(titleLarge),
      const DeepCollectionEquality().hash(titleMedium),
      const DeepCollectionEquality().hash(titleSmall),
      const DeepCollectionEquality().hash(bodyLarge),
      const DeepCollectionEquality().hash(bodyMedium),
      const DeepCollectionEquality().hash(bodySmall),
      const DeepCollectionEquality().hash(labelLarge),
      const DeepCollectionEquality().hash(manufacturerTextTheme),
      const DeepCollectionEquality().hash(modelTextTheme),
      const DeepCollectionEquality().hash(templateTitleTextTheme),
      const DeepCollectionEquality().hash(templateDescriptionTextTheme),
    );
  }
}

extension CCRTextThemeExtensionBuildContextProps on BuildContext {
  CCRTextThemeExtension get cCRTextThemeExtension =>
      Theme.of(this).extension<CCRTextThemeExtension>()!;
  TextStyle get displayLarge => cCRTextThemeExtension.displayLarge;
  TextStyle get displayMedium => cCRTextThemeExtension.displayMedium;
  TextStyle get displaySmall => cCRTextThemeExtension.displaySmall;
  TextStyle get headlineLarge => cCRTextThemeExtension.headlineLarge;
  TextStyle get headlineMedium => cCRTextThemeExtension.headlineMedium;
  TextStyle get headlineSmall => cCRTextThemeExtension.headlineSmall;
  TextStyle get titleLarge => cCRTextThemeExtension.titleLarge;
  TextStyle get titleMedium => cCRTextThemeExtension.titleMedium;
  TextStyle get titleSmall => cCRTextThemeExtension.titleSmall;
  TextStyle get bodyLarge => cCRTextThemeExtension.bodyLarge;
  TextStyle get bodyMedium => cCRTextThemeExtension.bodyMedium;
  TextStyle get bodySmall => cCRTextThemeExtension.bodySmall;
  TextStyle get labelLarge => cCRTextThemeExtension.labelLarge;
  TextStyle get manufacturerTextTheme =>
      cCRTextThemeExtension.manufacturerTextTheme;
  TextStyle get modelTextTheme => cCRTextThemeExtension.modelTextTheme;
  TextStyle get templateTitleTextTheme =>
      cCRTextThemeExtension.templateTitleTextTheme;
  TextStyle get templateDescriptionTextTheme =>
      cCRTextThemeExtension.templateDescriptionTextTheme;
}
