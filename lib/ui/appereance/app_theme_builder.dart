import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:sandbox/ui/appereance/app_theme.dart';

@singleton
class AppThemeBuilder {
  AppTheme build() {
    const darkSurface = Color(0xAA000000);
    return AppTheme(
      light: FlexThemeData.light(
        scheme: FlexScheme.hippieBlue,
        onPrimary: Colors.white,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.kablammo(fontSize: 24),
          titleMedium: GoogleFonts.gabriela(fontSize: 16, color: Colors.white),
          bodyMedium: GoogleFonts.gabriela(fontSize: 14),
          bodyLarge: GoogleFonts.gabriela(fontSize: 16),
        ),
        appBarBackground: Colors.transparent,
      ),
      dark: FlexThemeData.dark(
        scheme: FlexScheme.ebonyClay,
        surface: darkSurface,
        onPrimary: Colors.white,
        appBarBackground: Colors.transparent,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.kablammo(fontSize: 24),
          titleMedium: GoogleFonts.gabriela(fontSize: 16, color: Colors.white),
          bodyLarge: GoogleFonts.gabriela(fontSize: 16),
          bodyMedium: GoogleFonts.gabriela(fontSize: 14),
        ),
      ),
    );
  }
}
