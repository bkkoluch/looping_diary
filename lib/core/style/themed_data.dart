import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:looping_diary/core/style/color_tokens.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';

class ThemedData {
  static ThemeData lightThemeData = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(CoreDimensions.paddingS),
      ),
    ),
    primaryColor: ColorTokens.brandPrimary,
    fontFamily: GoogleFonts.lato().fontFamily,
  );
}
