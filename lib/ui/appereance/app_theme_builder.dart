import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:sandbox/ui/appereance/additional_colors.dart';
import 'package:sandbox/ui/appereance/app_theme.dart';

@singleton
class AppThemeBuilder {
  AppTheme build() {
    const darkSurface = Color(0xAA000000);
    const overlayColor = Color.fromARGB(40, 196, 196, 196);
    const minorTextColor = Color(0xFF73808D);
    final darkFlexThemeColors = FlexScheme.ebonyClay.colors(Brightness.dark);
    final lightFlexThemeColors = FlexScheme.hippieBlue.colors(Brightness.light);
    final textTheme = TextTheme(
      titleLarge: GoogleFonts.kablammo(fontSize: 24, color: Colors.white),
      titleMedium: GoogleFonts.gabriela(fontSize: 20, color: Colors.white),
      titleSmall: GoogleFonts.gabriela(fontSize: 16, color: Colors.white),
      bodyMedium: GoogleFonts.gabriela(fontSize: 14),
      bodyLarge: GoogleFonts.gabriela(fontSize: 16),
      bodySmall: GoogleFonts.gabriela(color: minorTextColor, fontSize: 10),
    );
    final List<ThemeExtension> extension = [
      AdditionalColors(
        overlayColor: overlayColor,
        minorTextColor: minorTextColor,
        minorHeaderColor: const Color(0xFFCECACA),
      ),
    ];
    final textButtonTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: GoogleFonts.gabriela(fontSize: 16, color: Colors.white),
        foregroundColor: Colors.white,
        backgroundColor: overlayColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
      ),
    );
    return AppTheme(
      light: FlexThemeData.light(
        scheme: FlexScheme.hippieBlue,
        onPrimary: Colors.white,
        textTheme: textTheme,
        appBarBackground: Colors.transparent,
        scaffoldBackground: lightFlexThemeColors.primary,
        extensions: extension,
      ).copyWith(textButtonTheme: textButtonTheme),
      dark: FlexThemeData.dark(
        scheme: FlexScheme.ebonyClay,
        surface: darkSurface,
        onPrimary: Colors.white,
        textTheme: textTheme,
        appBarBackground: Colors.transparent,
        scaffoldBackground: darkFlexThemeColors.primary,
        extensions: extension,
      ).copyWith(textButtonTheme: textButtonTheme),
    );
  }
}
