import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ld_ui/ld_ui.dart';

class ThemedData {
  static ThemeData lightThemeData = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(CoreDimensions.paddingS),
      ),
    ),
    backgroundColor: ColorTokens.brown,
    fontFamily: GoogleFonts.lato().fontFamily,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorTokens.brandAccent,
      selectionColor: ColorTokens.brandAccent,
      selectionHandleColor: ColorTokens.brandAccent,
    ),
  );
}
