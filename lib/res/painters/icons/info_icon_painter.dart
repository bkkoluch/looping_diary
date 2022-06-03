import 'package:flutter/material.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';

class InfoIconPainter extends CustomPainter {
  const InfoIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path()
      ..moveTo(size.width * 0.5000000, 0)
      ..cubicTo(size.width * 0.7761438, 0, size.width, size.height * 0.2238575, size.width, size.height * 0.5000000)
      ..cubicTo(
        size.width,
        size.height * 0.7761438,
        size.width * 0.7761438,
        size.height,
        size.width * 0.5000000,
        size.height,
      )
      ..cubicTo(size.width * 0.2238575, size.height, 0, size.height * 0.7761438, 0, size.height * 0.5000000)
      ..cubicTo(0, size.height * 0.2238575, size.width * 0.2238575, 0, size.width * 0.5000000, 0)
      ..close();

    final Paint paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = ColorTokens.brandAccent.withOpacity(1);
    canvas.drawPath(path_0, paint0Fill);

    final Path path_1 = Path()
      ..moveTo(size.width * 0.5555537, size.height * 0.2777844)
      ..cubicTo(
        size.width * 0.5555537,
        size.height * 0.3084669,
        size.width * 0.5306806,
        size.height * 0.3333400,
        size.width * 0.4999981,
        size.height * 0.3333400,
      )
      ..cubicTo(
        size.width * 0.4693156,
        size.height * 0.3333400,
        size.width * 0.4444425,
        size.height * 0.3084669,
        size.width * 0.4444425,
        size.height * 0.2777844,
      )
      ..cubicTo(
        size.width * 0.4444425,
        size.height * 0.2471019,
        size.width * 0.4693156,
        size.height * 0.2222288,
        size.width * 0.4999981,
        size.height * 0.2222288,
      )
      ..cubicTo(
        size.width * 0.5306806,
        size.height * 0.2222288,
        size.width * 0.5555537,
        size.height * 0.2471019,
        size.width * 0.5555537,
        size.height * 0.2777844,
      )
      ..close();

    final Paint paint1Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = ColorTokens.white.withOpacity(1);
    canvas.drawPath(path_1, paint1Fill);

    final Path path_2 = Path()
      ..moveTo(size.width * 0.4999981, size.height * 0.7777875)
      ..cubicTo(
        size.width * 0.4769863,
        size.height * 0.7777875,
        size.width * 0.4583319,
        size.height * 0.7591313,
        size.width * 0.4583319,
        size.height * 0.7361188,
      )
      ..lineTo(size.width * 0.4583319, size.height * 0.4583400)
      ..cubicTo(
        size.width * 0.4583319,
        size.height * 0.4353281,
        size.width * 0.4769863,
        size.height * 0.4166731,
        size.width * 0.4999981,
        size.height * 0.4166731,
      )
      ..cubicTo(
        size.width * 0.5230100,
        size.height * 0.4166731,
        size.width * 0.5416650,
        size.height * 0.4353281,
        size.width * 0.5416650,
        size.height * 0.4583400,
      )
      ..lineTo(size.width * 0.5416650, size.height * 0.7361188)
      ..cubicTo(
        size.width * 0.5416650,
        size.height * 0.7591313,
        size.width * 0.5230100,
        size.height * 0.7777875,
        size.width * 0.4999981,
        size.height * 0.7777875,
      )
      ..close();

    final Paint paint2Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = ColorTokens.white.withOpacity(1);
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
