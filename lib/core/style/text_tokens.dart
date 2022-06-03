import 'package:flutter/material.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';
import 'package:looping_diary/features/notes/utils/note_helper.dart' as note_helper;

class TextTokens {
  static const Color _defaultColor = ColorTokens.black;

  static TextStyle titleLg(BuildContext context, {Color? color, double? lineHeight}) => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: color ?? _defaultColor,
        height: note_helper.calculateTextSize(context),
      );

  static TextStyle titleMd(BuildContext context, {Color? color, double? lineHeight}) => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: color ?? _defaultColor,
        height: note_helper.calculateTextSize(context),
      );

  static TextStyle titleSm(BuildContext context, {Color? color, double? lineHeight}) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: color ?? _defaultColor,
        height: note_helper.calculateTextSize(context),
      );

  static TextStyle bodyLg(BuildContext context, {Color? color, double? lineHeight, FontWeight? fontWeight}) =>
      TextStyle(
        fontSize: 18,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? _defaultColor,
        height: note_helper.calculateTextSize(context),
      );

  static TextStyle body(BuildContext context, {Color? color, double? lineHeight, FontWeight? fontWeight}) => TextStyle(
        fontSize: 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? _defaultColor,
        height: note_helper.calculateTextSize(context),
      );

  static TextStyle subBody(BuildContext context, {Color? color, double? lineHeight}) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color ?? _defaultColor,
        height: note_helper.calculateTextSize(context),
      );

  static TextStyle bodySm(BuildContext context, {Color? color, double? lineHeight, FontWeight? fontWeight}) =>
      TextStyle(
        fontSize: 12,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? _defaultColor,
        height: note_helper.calculateTextSize(context),
      );

  static TextStyle bodyXs(BuildContext context, {Color? color, double? lineHeight}) =>
      body(context, color: color ?? _defaultColor).copyWith(
        fontSize: 10,
        height: note_helper.calculateTextSize(context),
      );
}
