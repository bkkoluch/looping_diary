// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';

class BackIconPainter extends CustomPainter {
  const BackIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.7083333, size.height * 0.4583333);
    path_0.lineTo(size.width * 0.3920833, size.height * 0.4583333);
    path_0.lineTo(size.width * 0.5295833, size.height * 0.3212500);
    path_0.arcToPoint(
      Offset(size.width * 0.4704167, size.height * 0.2620833),
      radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
      largeArc: true,
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.2620833, size.height * 0.4704167);
    path_0.arcToPoint(
      Offset(size.width * 0.2533333, size.height * 0.4841667),
      radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
      clockwise: false,
    );
    path_0.arcToPoint(
      Offset(size.width * 0.2533333, size.height * 0.5158333),
      radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
      clockwise: false,
    );
    path_0.arcToPoint(
      Offset(size.width * 0.2620833, size.height * 0.5295833),
      radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.4704167, size.height * 0.7379167);
    path_0.arcToPoint(
      Offset(size.width * 0.5295833, size.height * 0.7379167),
      radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
      clockwise: false,
    );
    path_0.arcToPoint(
      Offset(size.width * 0.5295833, size.height * 0.6787500),
      radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.3920833, size.height * 0.5416667);
    path_0.lineTo(size.width * 0.7083333, size.height * 0.5416667);
    path_0.arcToPoint(
      Offset(size.width * 0.7083333, size.height * 0.4583333),
      radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
      clockwise: false,
    );
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff6C63FF).withOpacity(1);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
