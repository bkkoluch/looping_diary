import 'package:flutter/material.dart';
import 'package:looping_diary/core/style/color_tokens.dart';

class NotebookPainter extends CustomPainter {
  const NotebookPainter(this.page);

  final int page;

  @override
  void paint(Canvas canvas, Size size) {
    final paintGrey = Paint()..color = Colors.grey;
    final rRectRed = RRect.fromLTRBR(0, 0, size.width, size.height, Radius.zero);
    canvas.drawRRect(rRectRed, paintGrey);

    final paintBrown = Paint()..color = ColorTokens.brown;
    final rRectBrown = RRect.fromLTRBR(
      isPageEven ? notebookSideGreyMargin : notebookSideGreyMargin / 2,
      0,
      isPageEven ? size.width : size.width - notebookSideGreyMargin,
      size.height,
      Radius.zero,
    );
    canvas.drawRRect(rRectBrown, paintBrown);

    final paintDarkGrey = Paint()
      ..color = Colors.blueGrey
      ..strokeWidth = 1.0;
    canvas
      // ..drawLine(Offset(0, size.height * .1), Offset(size.width, size.height * .1), paintDarkGrey)
      ..drawLine(Offset(0, size.height * .15), Offset(size.width, size.height * .15), paintDarkGrey)
      ..drawLine(Offset(0, size.height * .2), Offset(size.width, size.height * .2), paintDarkGrey)
      ..drawLine(Offset(0, size.height * .25), Offset(size.width, size.height * .25), paintDarkGrey)
      ..drawLine(Offset(0, size.height * .3), Offset(size.width, size.height * .3), paintDarkGrey)
      ..drawLine(Offset(0, size.height * .35), Offset(size.width, size.height * .35), paintDarkGrey)
      ..drawLine(Offset(0, size.height * .4), Offset(size.width, size.height * .4), paintDarkGrey)
      ..drawLine(Offset(0, size.height * .45), Offset(size.width, size.height * .45), paintDarkGrey)
      ..drawLine(Offset(0, size.height * .5), Offset(size.width, size.height * .5), paintDarkGrey)
      ..drawLine(Offset(0, size.height * .55), Offset(size.width, size.height * .55), paintDarkGrey)
      ..drawLine(Offset(0, size.height * .6), Offset(size.width, size.height * .6), paintDarkGrey)
      ..drawLine(Offset(0, size.height * .65), Offset(size.width, size.height * .65), paintDarkGrey)
      ..drawLine(Offset(0, size.height * .7), Offset(size.width, size.height * .7), paintDarkGrey)
      ..drawLine(Offset(0, size.height * .75), Offset(size.width, size.height * .75), paintDarkGrey)
      ..drawLine(Offset(0, size.height * .8), Offset(size.width, size.height * .8), paintDarkGrey)
      ..drawLine(Offset(0, size.height * .85), Offset(size.width, size.height * .85), paintDarkGrey)
      ..drawLine(Offset(0, size.height * .9), Offset(size.width, size.height * .9), paintDarkGrey);

    final paintPink = Paint()
      ..color = Colors.pinkAccent
      ..strokeWidth = 2.5;
    canvas.drawLine(
      Offset(isPageEven ? size.width * .1 : size.width * 0.9, 0),
      Offset(isPageEven ? size.width * .1 : size.width * 0.9, size.height),
      paintPink,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  bool get isPageEven => page % 2 == 0;

  double get notebookSideGreyMargin => 5;
}
