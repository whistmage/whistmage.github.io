import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:sandbox/widgets/app_theme/additional_colors.dart';
import 'package:sandbox/widgets/app_theme/link_button_style_extension.dart';
import 'package:sandbox/widgets/app_theme/app_themes.dart';

@singleton
class AppThemeBuilder {
  static const _darkSurface = Color(0xAA000000);
  static const _overlayColor = Color.fromARGB(40, 196, 196, 196);
  static const _minorTextColor = Color(0xFF73808D);
  static final _darkFlexThemeColors = FlexScheme.ebonyClay.colors(
    Brightness.dark,
  );
  static final lightFlexThemeColors = FlexScheme.hippieBlue.colors(
    Brightness.light,
  );
  static final textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: GoogleFonts.gabriela(fontSize: 16, color: Colors.white),
      foregroundColor: Colors.white,
      backgroundColor: _overlayColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
    ),
  );
  static final _textTheme = TextTheme(
    titleLarge: GoogleFonts.kablammo(fontSize: 24, color: Colors.white),
    titleMedium: GoogleFonts.gabriela(fontSize: 20, color: Colors.white),
    titleSmall: GoogleFonts.gabriela(fontSize: 16, color: Colors.white),
    bodyMedium: GoogleFonts.gabriela(fontSize: 14),
    bodyLarge: GoogleFonts.gabriela(fontSize: 16),
    bodySmall: GoogleFonts.gabriela(color: _minorTextColor, fontSize: 10),
  );

  static final _additionalColors = AdditionalColors(
    overlayColor: _overlayColor,
    minorTextColor: _minorTextColor,
    minorHeaderColor: const Color(0xFFCECACA),
  );

  static final _darkLinkButtonStyleExtension = LinkButtonStyleExtension(
    textStyle: GoogleFonts.gabriela(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    color: _darkFlexThemeColors.secondary,
  );

  static final _lightLinkButtonStyleExtension = LinkButtonStyleExtension(
    textStyle: GoogleFonts.gabriela(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    color: lightFlexThemeColors.secondary,
  );

  AppThemes build() {
    return AppThemes(
      light: FlexThemeData.light(
        scheme: FlexScheme.hippieBlue,
        onPrimary: Colors.white,
        textTheme: _textTheme,
        appBarBackground: Colors.transparent,
        scaffoldBackground: lightFlexThemeColors.primary,
        extensions: [_additionalColors, _lightLinkButtonStyleExtension],
      ).copyWith(textButtonTheme: textButtonTheme),
      dark: FlexThemeData.dark(
        scheme: FlexScheme.ebonyClay,
        surface: _darkSurface,
        onPrimary: Colors.white,
        textTheme: _textTheme,
        appBarBackground: Colors.transparent,
        scaffoldBackground: _darkFlexThemeColors.primary,
        extensions: [_additionalColors, _darkLinkButtonStyleExtension],
      ).copyWith(textButtonTheme: textButtonTheme),
    );
  }
}
