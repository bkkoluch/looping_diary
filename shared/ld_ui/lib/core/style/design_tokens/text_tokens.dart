import 'package:flutter/material.dart';
import 'package:ld_ui/core/extensions/context_extensions.dart';
import 'package:ld_ui/core/style/design_tokens/color_tokens.dart';

class TextTokens {
  static const Color _defaultColor = ColorTokens.black;

  static TextStyle titleLg({BuildContext? context, Color? color, double? lineHeight}) => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: color ?? _defaultColor,
        height: calculateTextSize(context),
      );

  static TextStyle titleMd({BuildContext? context, Color? color, double? lineHeight}) => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: color ?? _defaultColor,
        height: calculateTextSize(context),
      );

  static TextStyle titleSm({BuildContext? context, Color? color, double? lineHeight}) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: color ?? _defaultColor,
        height: calculateTextSize(context),
      );

  static TextStyle bodyLg({BuildContext? context, Color? color, double? lineHeight, FontWeight? fontWeight}) =>
      TextStyle(
        fontSize: 18,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? _defaultColor,
        height: calculateTextSize(context),
      );

  static TextStyle body({BuildContext? context, Color? color, double? lineHeight, FontWeight? fontWeight}) => TextStyle(
        fontSize: 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? _defaultColor,
        height: calculateTextSize(context),
      );

  static TextStyle subBody({BuildContext? context, Color? color, double? lineHeight}) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color ?? _defaultColor,
        height: calculateTextSize(context),
      );

  static TextStyle bodySm({BuildContext? context, Color? color, double? lineHeight, FontWeight? fontWeight}) =>
      TextStyle(
        fontSize: 12,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? _defaultColor,
        height: calculateTextSize(context),
      );

  static TextStyle bodyXs({BuildContext? context, Color? color, double? lineHeight}) =>
      body(context: context, color: color ?? _defaultColor).copyWith(
        fontSize: 10,
        height: calculateTextSize(context),
      );

  static double calculateTextSize(BuildContext? context) {
    if (context == null) {
      return 1;
    }

    final screenHeightMultiplier = context.screenHeight * 0.01;
    final singleLinesHeightFactor = 16 / screenHeightMultiplier;
    final scaledTextHeight = 4.425 / singleLinesHeightFactor;
    return scaledTextHeight;
  }
}
