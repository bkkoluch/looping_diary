import 'package:flutter/material.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_painter_image.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_text.dart';

class CoreSnackBar extends StatelessWidget {
  const CoreSnackBar.information({
    required this.text,
    this.iconPainter,
    this.title,
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
              CorePainterImage.sized(
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
                  if (title != null) CoreText.titleLg(title!),
                  if (text != null) ...{
                    if (title != null) const SizedBox(height: CoreDimensions.spacingS),
                    CoreText.body(text!),
                  },
                ],
              ),
            ),
          ],
        ),
      );
}
