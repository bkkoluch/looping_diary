import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/style/design_tokens/text_tokens.dart';

class CoreText extends StatelessWidget {
  const CoreText._(
    this.text, {
    required this.style,
    this.maxLines,
    this.textAlign,
    this.fontFeatures,
  });

  CoreText.titleLg(
    String text, {
    Color? color,
    int? maxLines,
    TextAlign? textAlign,
    double? lineHeight,
    List<FontFeature>? fontFeatures,
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          style: TextTokens.titleLg(color: color, lineHeight: lineHeight),
          fontFeatures: fontFeatures,
        );

  CoreText.titleMd(
    String text, {
    Color? color,
    int? maxLines,
    TextAlign? textAlign,
    double? lineHeight,
    List<FontFeature>? fontFeatures,
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          style: TextTokens.titleMd(color: color, lineHeight: lineHeight),
          fontFeatures: fontFeatures,
        );

  CoreText.titleSm(
    String text, {
    Color? color,
    int? maxLines,
    TextAlign? textAlign,
    double? lineHeight,
    List<FontFeature>? fontFeatures,
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          style: TextTokens.titleSm(color: color, lineHeight: lineHeight),
          fontFeatures: fontFeatures,
        );

  CoreText.body(
    String text, {
    Color? color,
    int? maxLines,
    TextAlign? textAlign,
    double? lineHeight,
    List<FontFeature>? fontFeatures,
    FontWeight? fontWeight,
  }) : this._(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          style: TextTokens.body(color: color, lineHeight: lineHeight, fontWeight: fontWeight),
          fontFeatures: fontFeatures,
        );

  final String text;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextStyle style;
  final List<FontFeature>? fontFeatures;

  @override
  Widget build(BuildContext context) => maxLines == 1
      ? AutoSizeText(
          text,
          minFontSize: 8,
          maxLines: 1,
          style: style.copyWith(fontFeatures: fontFeatures),
          textAlign: textAlign ?? TextAlign.start,
          overflow: TextOverflow.ellipsis,
        )
      : Text(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          style: style.copyWith(fontFeatures: fontFeatures),
          overflow: maxLines == null ? null : TextOverflow.ellipsis,
        );
}
