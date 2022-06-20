// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';

class InfoAlternateIconPainter extends CustomPainter {
  const InfoAlternateIconPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.08333333);
    path_0.arcToPoint(
      Offset(size.width * 0.9166667, size.height * 0.5000000),
      radius: Radius.elliptical(size.width * 0.4166667, size.height * 0.4166667),
      largeArc: true,
      clockwise: false,
    );
    path_0.arcToPoint(
      Offset(size.width * 0.5000000, size.height * 0.08333333),
      radius: Radius.elliptical(size.width * 0.4171308, size.height * 0.4171308),
      clockwise: false,
    );
    path_0.close();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.8333333);
    path_0.arcToPoint(
      Offset(size.width * 0.8333333, size.height * 0.5000000),
      radius: Radius.elliptical(size.width * 0.3333333, size.height * 0.3333333),
      largeArc: true,
    );
    path_0.arcToPoint(
      Offset(size.width * 0.5000000, size.height * 0.8333333),
      radius: Radius.elliptical(size.width * 0.3337154, size.height * 0.3337154),
    );
    path_0.close();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.4791667);
    path_0.arcToPoint(
      Offset(size.width * 0.4583333, size.height * 0.5208333),
      radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.4583333, size.height * 0.6458333);
    path_0.arcToPoint(
      Offset(size.width * 0.5416667, size.height * 0.6458333),
      radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.5416667, size.height * 0.5208333);
    path_0.arcToPoint(
      Offset(size.width * 0.5000000, size.height * 0.4791667),
      radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
      clockwise: false,
    );
    path_0.close();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.3125000);
    path_0.arcToPoint(
      Offset(size.width * 0.5520833, size.height * 0.3645833),
      radius: Radius.elliptical(size.width * 0.05208333, size.height * 0.05208333),
      largeArc: true,
      clockwise: false,
    );
    path_0.arcToPoint(
      Offset(size.width * 0.5000000, size.height * 0.3125000),
      radius: Radius.elliptical(size.width * 0.05208333, size.height * 0.05208333),
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
