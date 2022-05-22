import 'package:flutter/material.dart';

class CorePainterImage extends StatelessWidget {
  const CorePainterImage._({required this.painter, this.width, this.height});

  factory CorePainterImage.sized({
    required double width,
    required double height,
    required CustomPainter painter,
  }) =>
      CorePainterImage._(painter: painter, width: width, height: height);

  final CustomPainter painter;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) => CustomPaint(
        size: (width == null || height == null) ? Size.zero : Size(width!, height!),
        foregroundPainter: painter,
      );
}
