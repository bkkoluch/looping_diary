import 'package:flutter/material.dart';
import 'package:ld_ui/core/style/core_dimensions.dart';
import 'package:ld_ui/core/style/design_tokens/color_tokens.dart';
import 'package:ld_ui/widgets/ld_painter_image.dart';
import 'package:ld_ui/widgets/ld_text.dart';

class LDSnackBar extends StatelessWidget {
  const LDSnackBar.information({
    required this.text,
    this.iconPainter,
    this.title,
    super.key,
  }) : backgroundColor = ColorTokens.beige;

  final String? title;
  final String? text;
  final Color backgroundColor;
  final CustomPainter? iconPainter;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(CoreDimensions.paddingM),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadiusDirectional.circular(CoreDimensions.coreSnackBarBorderRadius),
        ),
        child: Row(
          crossAxisAlignment: title == null ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            if (iconPainter != null) ...{
              LDPainterImage.sized(
                width: CoreDimensions.defaultIconSize,
                height: CoreDimensions.defaultIconSize,
                painter: iconPainter!,
              ),
              const SizedBox(width: CoreDimensions.spacingMS),
            },
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (title != null) LDText.titleLg(title!),
                  if (text != null) ...{
                    if (title != null) const SizedBox(height: CoreDimensions.spacingS),
                    LDText.body(text!),
                  },
                ],
              ),
            ),
          ],
        ),
      );
}
