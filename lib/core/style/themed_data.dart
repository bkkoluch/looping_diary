import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';

class ThemedData {
  static ThemeData lightThemeData = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(CoreDimensions.paddingS),
      ),
    ),
    primaryColor: ColorTokens.brandPrimary,
    fontFamily: GoogleFonts.lato().fontFamily,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorTokens.brandAccent,
      selectionColor: ColorTokens.brandAccent,
      selectionHandleColor: ColorTokens.brandAccent,
    )
    // fontFamily: GoogleFonts.montserrat().fontFamily,
    // fontFamily: GoogleFonts.raleway().fontFamily,
    // fontFamily: GoogleFonts.merriweather().fontFamily,
    // fontFamily: GoogleFonts.permanentMarker().fontFamily,
    ,
  );
}
