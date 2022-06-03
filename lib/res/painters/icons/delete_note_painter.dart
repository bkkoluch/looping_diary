import 'package:flutter/material.dart';

class DeleteNotePainter extends CustomPainter {
  const DeleteNotePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path()
      ..moveTo(size.width * 0.4166667, size.height * 0.7500000)
      ..arcToPoint(
        Offset(size.width * 0.4583333, size.height * 0.7083333),
        radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
        clockwise: false,
      )
      ..lineTo(size.width * 0.4583333, size.height * 0.4583333)
      ..arcToPoint(
        Offset(size.width * 0.3750000, size.height * 0.4583333),
        radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
        clockwise: false,
      )
      ..lineTo(size.width * 0.3750000, size.height * 0.7083333)
      ..arcToPoint(
        Offset(size.width * 0.4166667, size.height * 0.7500000),
        radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
        clockwise: false,
      )
      ..close()
      ..moveTo(size.width * 0.8333333, size.height * 0.2500000)
      ..lineTo(size.width * 0.6666667, size.height * 0.2500000)
      ..lineTo(size.width * 0.6666667, size.height * 0.2083333)
      ..arcToPoint(
        Offset(size.width * 0.5416667, size.height * 0.08333333),
        radius: Radius.elliptical(size.width * 0.1250000, size.height * 0.1250000),
        clockwise: false,
      )
      ..lineTo(size.width * 0.4583333, size.height * 0.08333333)
      ..arcToPoint(
        Offset(size.width * 0.3333333, size.height * 0.2083333),
        radius: Radius.elliptical(size.width * 0.1250000, size.height * 0.1250000),
        clockwise: false,
      )
      ..lineTo(size.width * 0.3333333, size.height * 0.2500000)
      ..lineTo(size.width * 0.1666667, size.height * 0.2500000)
      ..arcToPoint(
        Offset(size.width * 0.1666667, size.height * 0.3333333),
        radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
        clockwise: false,
      )
      ..lineTo(size.width * 0.2083333, size.height * 0.3333333)
      ..lineTo(size.width * 0.2083333, size.height * 0.7916667)
      ..arcToPoint(
        Offset(size.width * 0.3333333, size.height * 0.9166667),
        radius: Radius.elliptical(size.width * 0.1250000, size.height * 0.1250000),
        clockwise: false,
      )
      ..lineTo(size.width * 0.6666667, size.height * 0.9166667)
      ..arcToPoint(
        Offset(size.width * 0.7916667, size.height * 0.7916667),
        radius: Radius.elliptical(size.width * 0.1250000, size.height * 0.1250000),
        clockwise: false,
      )
      ..lineTo(size.width * 0.7916667, size.height * 0.3333333)
      ..lineTo(size.width * 0.8333333, size.height * 0.3333333)
      ..arcToPoint(
        Offset(size.width * 0.8333333, size.height * 0.2500000),
        radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
        clockwise: false,
      )
      ..close()
      ..moveTo(size.width * 0.4166667, size.height * 0.2083333)
      ..arcToPoint(
        Offset(size.width * 0.4583333, size.height * 0.1666667),
        radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
      )
      ..lineTo(size.width * 0.5416667, size.height * 0.1666667)
      ..arcToPoint(
        Offset(size.width * 0.5833333, size.height * 0.2083333),
        radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
      )
      ..lineTo(size.width * 0.5833333, size.height * 0.2500000)
      ..lineTo(size.width * 0.4166667, size.height * 0.2500000)
      ..close()
      ..moveTo(size.width * 0.7083333, size.height * 0.7916667)
      ..arcToPoint(
        Offset(size.width * 0.6666667, size.height * 0.8333333),
        radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
      )
      ..lineTo(size.width * 0.3333333, size.height * 0.8333333)
      ..arcToPoint(
        Offset(size.width * 0.2916667, size.height * 0.7916667),
        radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
      )
      ..lineTo(size.width * 0.2916667, size.height * 0.3333333)
      ..lineTo(size.width * 0.7083333, size.height * 0.3333333)
      ..close()
      ..moveTo(size.width * 0.5833333, size.height * 0.7500000)
      ..arcToPoint(
        Offset(size.width * 0.6250000, size.height * 0.7083333),
        radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
        clockwise: false,
      )
      ..lineTo(size.width * 0.6250000, size.height * 0.4583333)
      ..arcToPoint(
        Offset(size.width * 0.5416667, size.height * 0.4583333),
        radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
        clockwise: false,
      )
      ..lineTo(size.width * 0.5416667, size.height * 0.7083333)
      ..arcToPoint(
        Offset(size.width * 0.5833333, size.height * 0.7500000),
        radius: Radius.elliptical(size.width * 0.04166667, size.height * 0.04166667),
        clockwise: false,
      )
      ..close();

    final Paint paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xff6C63FF).withOpacity(1);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
