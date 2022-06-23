import 'package:flutter/material.dart';

class LDPainterImage extends StatelessWidget {
  const LDPainterImage._({required this.painter, this.width, this.height});

  factory LDPainterImage.sized({
    required double width,
    required double height,
    required CustomPainter painter,
  }) =>
      LDPainterImage._(painter: painter, width: width, height: height);

  final CustomPainter painter;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) => CustomPaint(
        size: (width == null || height == null) ? Size.zero : Size(width!, height!),
        foregroundPainter: painter,
      );
}
