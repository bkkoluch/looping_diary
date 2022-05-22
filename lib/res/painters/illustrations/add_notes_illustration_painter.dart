// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';

class AddNotesIllustrationPainter extends CustomPainter {
  const AddNotesIllustrationPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 1.394596, size.height * 0.6956508);
    path_0.lineTo(size.width * 1.230463, size.height * 0.6956508);
    path_0.arcToPoint(
      Offset(size.width * 1.211803, size.height * 0.6865638),
      radius: Radius.elliptical(size.width * 0.02362561, size.height * 0.02373965),
    );
    path_0.lineTo(size.width * 1.211803, size.height * 0.6865638);
    path_0.arcToPoint(
      Offset(size.width * 1.207323, size.height * 0.6659480),
      radius: Radius.elliptical(size.width * 0.02392082, size.height * 0.02403628),
    );
    path_0.arcToPoint(
      Offset(size.width * 1.207322, size.height * 0.4722623),
      radius: Radius.elliptical(size.width * 0.4150196, size.height * 0.4170228),
      clockwise: false,
    );
    path_0.arcToPoint(
      Offset(size.width * 1.211802, size.height * 0.4516475),
      radius: Radius.elliptical(size.width * 0.02392640, size.height * 0.02404188),
    );
    path_0.arcToPoint(
      Offset(size.width * 1.230463, size.height * 0.4425605),
      radius: Radius.elliptical(size.width * 0.02362440, size.height * 0.02373843),
    );
    path_0.lineTo(size.width * 1.394596, size.height * 0.4425605);
    path_0.arcToPoint(
      Offset(size.width * 1.418141, size.height * 0.4627371),
      radius: Radius.elliptical(size.width * 0.02392485, size.height * 0.02404033),
    );
    path_0.arcToPoint(
      Offset(size.width * 1.418141, size.height * 0.6754742),
      radius: Radius.elliptical(size.width * 0.6956312, size.height * 0.6989888),
    );
    path_0.arcToPoint(
      Offset(size.width * 1.394596, size.height * 0.6956508),
      radius: Radius.elliptical(size.width * 0.02392485, size.height * 0.02404033),
    );
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffe6e6e6).withOpacity(1);
    canvas.drawPath(path_0, paint0Fill);

    final Path path_1 = Path();
    path_1.moveTo(size.width * 1.230463, size.height * 0.4549700);
    path_1.arcToPoint(
      Offset(size.width * 1.221500, size.height * 0.4593307),
      radius: Radius.elliptical(size.width * 0.01134676, size.height * 0.01140153),
      clockwise: false,
    );
    path_1.arcToPoint(
      Offset(size.width * 1.219331, size.height * 0.4693690),
      radius: Radius.elliptical(size.width * 0.01164890, size.height * 0.01170513),
      clockwise: false,
    );
    path_1.arcToPoint(
      Offset(size.width * 1.219332, size.height * 0.6688422),
      radius: Radius.elliptical(size.width * 0.4274219, size.height * 0.4294850),
    );
    path_1.arcToPoint(
      Offset(size.width * 1.221500, size.height * 0.6788785),
      radius: Radius.elliptical(size.width * 0.01164263, size.height * 0.01169882),
      clockwise: false,
    );
    path_1.lineTo(size.width * 1.221501, size.height * 0.6788795);
    path_1.arcToPoint(
      Offset(size.width * 1.230463, size.height * 0.6832412),
      radius: Radius.elliptical(size.width * 0.01134380, size.height * 0.01139855),
      clockwise: false,
    );
    path_1.lineTo(size.width * 1.394596, size.height * 0.6832412);
    path_1.arcToPoint(
      Offset(size.width * 1.405935, size.height * 0.6735887),
      radius: Radius.elliptical(size.width * 0.01149052, size.height * 0.01154598),
      clockwise: false,
    );
    path_1.arcToPoint(
      Offset(size.width * 1.405935, size.height * 0.4646225),
      radius: Radius.elliptical(size.width * 0.6833313, size.height * 0.6866296),
      clockwise: false,
    );
    path_1.arcToPoint(
      Offset(size.width * 1.394596, size.height * 0.4549700),
      radius: Radius.elliptical(size.width * 0.01149052, size.height * 0.01154598),
      clockwise: false,
    );
    path_1.close();

    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffffffff).withOpacity(1);
    canvas.drawPath(path_1, paint1Fill);

    final Path path_2 = Path();
    path_2.moveTo(size.width * 1.358779, size.height * 0.5146406);
    path_2.lineTo(size.width * 1.272648, size.height * 0.5146406);
    path_2.arcToPoint(
      Offset(size.width * 1.260299, size.height * 0.5022315),
      radius: Radius.elliptical(size.width * 0.01236293, size.height * 0.01242261),
    );
    path_2.lineTo(size.width * 1.260299, size.height * 0.4973823);
    path_2.arcToPoint(
      Offset(size.width * 1.272648, size.height * 0.4849732),
      radius: Radius.elliptical(size.width * 0.01236293, size.height * 0.01242261),
    );
    path_2.lineTo(size.width * 1.358779, size.height * 0.4849732);
    path_2.arcToPoint(
      Offset(size.width * 1.371128, size.height * 0.4973823),
      radius: Radius.elliptical(size.width * 0.01236293, size.height * 0.01242261),
    );
    path_2.lineTo(size.width * 1.371128, size.height * 0.5022316);
    path_2.arcToPoint(
      Offset(size.width * 1.358779, size.height * 0.5146406),
      radius: Radius.elliptical(size.width * 0.01236291, size.height * 0.01242259),
    );
    path_2.close();

    final Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xffe6e6e6).withOpacity(1);
    canvas.drawPath(path_2, paint2Fill);

    final Path path_3 = Path();
    path_3.moveTo(size.width * 1.358779, size.height * 0.5759142);
    path_3.lineTo(size.width * 1.272648, size.height * 0.5759142);
    path_3.arcToPoint(
      Offset(size.width * 1.260299, size.height * 0.5635051),
      radius: Radius.elliptical(size.width * 0.01236291, size.height * 0.01242259),
    );
    path_3.lineTo(size.width * 1.260299, size.height * 0.5586558);
    path_3.arcToPoint(
      Offset(size.width * 1.272648, size.height * 0.5462468),
      radius: Radius.elliptical(size.width * 0.01236291, size.height * 0.01242259),
    );
    path_3.lineTo(size.width * 1.358779, size.height * 0.5462468);
    path_3.arcToPoint(
      Offset(size.width * 1.371128, size.height * 0.5586558),
      radius: Radius.elliptical(size.width * 0.01236291, size.height * 0.01242259),
    );
    path_3.lineTo(size.width * 1.371128, size.height * 0.5635051);
    path_3.arcToPoint(
      Offset(size.width * 1.358779, size.height * 0.5759142),
      radius: Radius.elliptical(size.width * 0.01236291, size.height * 0.01242259),
    );
    path_3.close();

    final Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xffe6e6e6).withOpacity(1);
    canvas.drawPath(path_3, paint3Fill);

    final Path path_4 = Path();
    path_4.moveTo(size.width * 1.358779, size.height * 0.6371878);
    path_4.lineTo(size.width * 1.272648, size.height * 0.6371878);
    path_4.arcToPoint(
      Offset(size.width * 1.260299, size.height * 0.6247787),
      radius: Radius.elliptical(size.width * 0.01236293, size.height * 0.01242261),
    );
    path_4.lineTo(size.width * 1.260299, size.height * 0.6199295);
    path_4.arcToPoint(
      Offset(size.width * 1.272648, size.height * 0.6075204),
      radius: Radius.elliptical(size.width * 0.01236291, size.height * 0.01242259),
    );
    path_4.lineTo(size.width * 1.358779, size.height * 0.6075204);
    path_4.arcToPoint(
      Offset(size.width * 1.371128, size.height * 0.6199295),
      radius: Radius.elliptical(size.width * 0.01236291, size.height * 0.01242259),
    );
    path_4.lineTo(size.width * 1.371128, size.height * 0.6247787);
    path_4.arcToPoint(
      Offset(size.width * 1.358779, size.height * 0.6371878),
      radius: Radius.elliptical(size.width * 0.01236291, size.height * 0.01242259),
    );
    path_4.close();

    final Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xffe6e6e6).withOpacity(1);
    canvas.drawPath(path_4, paint4Fill);

    final Path path_5 = Path();
    path_5.moveTo(size.width * 1.703344, size.height * 0.8528380);
    path_5.lineTo(size.width * 1.539211, size.height * 0.8528380);
    path_5.arcToPoint(
      Offset(size.width * 1.520551, size.height * 0.8437510),
      radius: Radius.elliptical(size.width * 0.02362561, size.height * 0.02373965),
    );
    path_5.lineTo(size.width * 1.520551, size.height * 0.8437510);
    path_5.arcToPoint(
      Offset(size.width * 1.516071, size.height * 0.8231351),
      radius: Radius.elliptical(size.width * 0.02392082, size.height * 0.02403628),
    );
    path_5.arcToPoint(
      Offset(size.width * 1.516070, size.height * 0.6294495),
      radius: Radius.elliptical(size.width * 0.4150196, size.height * 0.4170228),
      clockwise: false,
    );
    path_5.arcToPoint(
      Offset(size.width * 1.520550, size.height * 0.6088346),
      radius: Radius.elliptical(size.width * 0.02392640, size.height * 0.02404188),
    );
    path_5.arcToPoint(
      Offset(size.width * 1.539211, size.height * 0.5997477),
      radius: Radius.elliptical(size.width * 0.02362440, size.height * 0.02373843),
    );
    path_5.lineTo(size.width * 1.703344, size.height * 0.5997477);
    path_5.arcToPoint(
      Offset(size.width * 1.726889, size.height * 0.6199242),
      radius: Radius.elliptical(size.width * 0.02392485, size.height * 0.02404033),
    );
    path_5.arcToPoint(
      Offset(size.width * 1.726889, size.height * 0.8326614),
      radius: Radius.elliptical(size.width * 0.6956312, size.height * 0.6989888),
    );
    path_5.arcToPoint(
      Offset(size.width * 1.703344, size.height * 0.8528380),
      radius: Radius.elliptical(size.width * 0.02392485, size.height * 0.02404033),
    );
    path_5.close();

    final Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xffe6e6e6).withOpacity(1);
    canvas.drawPath(path_5, paint5Fill);

    final Path path_6 = Path();
    path_6.moveTo(size.width * 1.539211, size.height * 0.6121572);
    path_6.arcToPoint(
      Offset(size.width * 1.530248, size.height * 0.6165179),
      radius: Radius.elliptical(size.width * 0.01134676, size.height * 0.01140153),
      clockwise: false,
    );
    path_6.arcToPoint(
      Offset(size.width * 1.528079, size.height * 0.6265562),
      radius: Radius.elliptical(size.width * 0.01164890, size.height * 0.01170513),
      clockwise: false,
    );
    path_6.arcToPoint(
      Offset(size.width * 1.528080, size.height * 0.8260294),
      radius: Radius.elliptical(size.width * 0.4274219, size.height * 0.4294850),
    );
    path_6.arcToPoint(
      Offset(size.width * 1.530247, size.height * 0.8360657),
      radius: Radius.elliptical(size.width * 0.01164263, size.height * 0.01169882),
      clockwise: false,
    );
    path_6.lineTo(size.width * 1.530248, size.height * 0.8360667);
    path_6.arcToPoint(
      Offset(size.width * 1.539211, size.height * 0.8404284),
      radius: Radius.elliptical(size.width * 0.01134380, size.height * 0.01139855),
      clockwise: false,
    );
    path_6.lineTo(size.width * 1.703344, size.height * 0.8404284);
    path_6.arcToPoint(
      Offset(size.width * 1.714683, size.height * 0.8307759),
      radius: Radius.elliptical(size.width * 0.01149052, size.height * 0.01154598),
      clockwise: false,
    );
    path_6.arcToPoint(
      Offset(size.width * 1.714683, size.height * 0.6218097),
      radius: Radius.elliptical(size.width * 0.6833313, size.height * 0.6866296),
      clockwise: false,
    );
    path_6.arcToPoint(
      Offset(size.width * 1.703344, size.height * 0.6121571),
      radius: Radius.elliptical(size.width * 0.01149052, size.height * 0.01154598),
      clockwise: false,
    );
    path_6.close();

    final Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = const Color(0xffffffff).withOpacity(1);
    canvas.drawPath(path_6, paint6Fill);

    final Path path_7 = Path();
    path_7.moveTo(size.width * 1.376071, size.height * 1.031742);
    path_7.lineTo(size.width * 1.211938, size.height * 1.031742);
    path_7.arcToPoint(
      Offset(size.width * 1.192470, size.height * 1.022261),
      radius: Radius.elliptical(size.width * 0.02464930, size.height * 0.02476827),
    );
    path_7.arcToPoint(
      Offset(size.width * 1.187798, size.height * 1.000764),
      radius: Radius.elliptical(size.width * 0.02494516, size.height * 0.02506556),
    );
    path_7.arcToPoint(
      Offset(size.width * 1.187797, size.height * 0.8075607),
      radius: Radius.elliptical(size.width * 0.4139917, size.height * 0.4159899),
      clockwise: false,
    );
    path_7.arcToPoint(
      Offset(size.width * 1.192470, size.height * 0.7860642),
      radius: Radius.elliptical(size.width * 0.02494839, size.height * 0.02506881),
    );
    path_7.arcToPoint(
      Offset(size.width * 1.211938, size.height * 0.7765833),
      radius: Radius.elliptical(size.width * 0.02464961, size.height * 0.02476858),
    );
    path_7.lineTo(size.width * 1.376071, size.height * 0.7765833);
    path_7.arcToPoint(
      Offset(size.width * 1.400633, size.height * 0.7976365),
      radius: Radius.elliptical(size.width * 0.02496054, size.height * 0.02508101),
    );
    path_7.arcToPoint(
      Offset(size.width * 1.400633, size.height * 1.010689),
      radius: Radius.elliptical(size.width * 0.6966565, size.height * 0.7000191),
    );
    path_7.arcToPoint(
      Offset(size.width * 1.376071, size.height * 1.031742),
      radius: Radius.elliptical(size.width * 0.02496056, size.height * 0.02508103),
    );
    path_7.close();

    final Paint paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawPath(path_7, paint7Fill);

    final Path path_8 = Path();
    path_8.moveTo(size.width * 1.667526, size.height * 0.7028515);
    path_8.lineTo(size.width * 1.581396, size.height * 0.7028515);
    path_8.arcToPoint(
      Offset(size.width * 1.569047, size.height * 0.6904425),
      radius: Radius.elliptical(size.width * 0.01236293, size.height * 0.01242261),
    );
    path_8.lineTo(size.width * 1.569047, size.height * 0.6855932);
    path_8.arcToPoint(
      Offset(size.width * 1.581396, size.height * 0.6731842),
      radius: Radius.elliptical(size.width * 0.01236293, size.height * 0.01242261),
    );
    path_8.lineTo(size.width * 1.667526, size.height * 0.6731842);
    path_8.arcToPoint(
      Offset(size.width * 1.679876, size.height * 0.6855932),
      radius: Radius.elliptical(size.width * 0.01236293, size.height * 0.01242261),
    );
    path_8.lineTo(size.width * 1.679876, size.height * 0.6904426);
    path_8.arcToPoint(
      Offset(size.width * 1.667526, size.height * 0.7028515),
      radius: Radius.elliptical(size.width * 0.01236291, size.height * 0.01242259),
    );
    path_8.close();

    final Paint paint8Fill = Paint()..style = PaintingStyle.fill;
    paint8Fill.color = const Color(0xffe6e6e6).withOpacity(1);
    canvas.drawPath(path_8, paint8Fill);

    final Path path_9 = Path();
    path_9.moveTo(size.width * 1.667526, size.height * 0.7641251);
    path_9.lineTo(size.width * 1.581396, size.height * 0.7641251);
    path_9.arcToPoint(
      Offset(size.width * 1.569047, size.height * 0.7517161),
      radius: Radius.elliptical(size.width * 0.01236291, size.height * 0.01242259),
    );
    path_9.lineTo(size.width * 1.569047, size.height * 0.7468668);
    path_9.arcToPoint(
      Offset(size.width * 1.581396, size.height * 0.7344578),
      radius: Radius.elliptical(size.width * 0.01236291, size.height * 0.01242259),
    );
    path_9.lineTo(size.width * 1.667526, size.height * 0.7344578);
    path_9.arcToPoint(
      Offset(size.width * 1.679876, size.height * 0.7468668),
      radius: Radius.elliptical(size.width * 0.01236291, size.height * 0.01242259),
    );
    path_9.lineTo(size.width * 1.679876, size.height * 0.7517161);
    path_9.arcToPoint(
      Offset(size.width * 1.667526, size.height * 0.7641251),
      radius: Radius.elliptical(size.width * 0.01236291, size.height * 0.01242259),
    );
    path_9.close();

    final Paint paint9Fill = Paint()..style = PaintingStyle.fill;
    paint9Fill.color = const Color(0xffe6e6e6).withOpacity(1);
    canvas.drawPath(path_9, paint9Fill);

    final Paint paint10Fill = Paint()..style = PaintingStyle.fill;
    paint10Fill.color = const Color(0xffffffff).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.5594733, size.height * 0.4725957), size.width * 0.04734130, paint10Fill);

    final Path path_11 = Path();
    path_11.moveTo(size.width * 1.317105, size.height * 0.8971044);
    path_11.lineTo(size.width * 1.300639, size.height * 0.8971044);
    path_11.lineTo(size.width * 1.300639, size.height * 0.8805584);
    path_11.arcToPoint(
      Offset(size.width * 1.288289, size.height * 0.8805584),
      radius: Radius.elliptical(size.width * 0.006174952, size.height * 0.006204757),
      clockwise: false,
    );
    path_11.lineTo(size.width * 1.288289, size.height * 0.8971044);
    path_11.lineTo(size.width * 1.271822, size.height * 0.8971044);
    path_11.arcToPoint(
      Offset(size.width * 1.271822, size.height * 0.9095140),
      radius: Radius.elliptical(size.width * 0.006174952, size.height * 0.006204757),
      clockwise: false,
    );
    path_11.lineTo(size.width * 1.288289, size.height * 0.9095140);
    path_11.lineTo(size.width * 1.288289, size.height * 0.9260600);
    path_11.arcToPoint(
      Offset(size.width * 1.300639, size.height * 0.9260600),
      radius: Radius.elliptical(size.width * 0.006174952, size.height * 0.006204757),
      clockwise: false,
    );
    path_11.lineTo(size.width * 1.300639, size.height * 0.9095140);
    path_11.lineTo(size.width * 1.317105, size.height * 0.9095140);
    path_11.arcToPoint(
      Offset(size.width * 1.317105, size.height * 0.8971044),
      radius: Radius.elliptical(size.width * 0.006174952, size.height * 0.006204757),
      clockwise: false,
    );
    path_11.close();

    final Paint paint11Fill = Paint()..style = PaintingStyle.fill;
    paint11Fill.color = const Color(0xffe6e6e6).withOpacity(1);
    canvas.drawPath(path_11, paint11Fill);

    final Path path_12 = Path();
    path_12.moveTo(size.width * 1.354155, size.height * 0.4658738);
    path_12.lineTo(size.width * 1.267706, size.height * 0.4658738);
    path_12.arcToPoint(
      Offset(size.width * 1.258443, size.height * 0.4565667),
      radius: Radius.elliptical(size.width * 0.009272884, size.height * 0.009317642),
    );
    path_12.lineTo(size.width * 1.258443, size.height * 0.4400207);
    path_12.arcToPoint(
      Offset(size.width * 1.267706, size.height * 0.4307135),
      radius: Radius.elliptical(size.width * 0.009272884, size.height * 0.009317642),
    );
    path_12.lineTo(size.width * 1.354155, size.height * 0.4307135);
    path_12.arcToPoint(
      Offset(size.width * 1.363417, size.height * 0.4400207),
      radius: Radius.elliptical(size.width * 0.009272884, size.height * 0.009317642),
    );
    path_12.lineTo(size.width * 1.363417, size.height * 0.4565667);
    path_12.arcToPoint(
      Offset(size.width * 1.354155, size.height * 0.4658738),
      radius: Radius.elliptical(size.width * 0.009272884, size.height * 0.009317642),
    );
    path_12.close();

    final Paint paint12Fill = Paint()..style = PaintingStyle.fill;
    paint12Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_12, paint12Fill);

    final Path path_13 = Path();
    path_13.moveTo(size.width * 1.667019, size.height * 0.6251293);
    path_13.lineTo(size.width * 1.580570, size.height * 0.6251293);
    path_13.arcToPoint(
      Offset(size.width * 1.571307, size.height * 0.6158221),
      radius: Radius.elliptical(size.width * 0.009272884, size.height * 0.009317642),
    );
    path_13.lineTo(size.width * 1.571307, size.height * 0.5992761);
    path_13.arcToPoint(
      Offset(size.width * 1.580570, size.height * 0.5899690),
      radius: Radius.elliptical(size.width * 0.009272884, size.height * 0.009317642),
    );
    path_13.lineTo(size.width * 1.667019, size.height * 0.5899690);
    path_13.arcToPoint(
      Offset(size.width * 1.676282, size.height * 0.5992761),
      radius: Radius.elliptical(size.width * 0.009272884, size.height * 0.009317642),
    );
    path_13.lineTo(size.width * 1.676282, size.height * 0.6158221);
    path_13.arcToPoint(
      Offset(size.width * 1.667019, size.height * 0.6251293),
      radius: Radius.elliptical(size.width * 0.009272884, size.height * 0.009317642),
    );
    path_13.close();

    final Paint paint13Fill = Paint()..style = PaintingStyle.fill;
    paint13Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_13, paint13Fill);

    final Path path_14 = Path();
    path_14.moveTo(size.width * 0.1823587, size.height * 0.9742730);
    path_14.lineTo(size.width * 0.2075937, size.height * 0.9742730);
    path_14.lineTo(size.width * 0.2154832, size.height * 0.8764695);
    path_14.lineTo(size.width * 0.1823546, size.height * 0.8764695);
    path_14.lineTo(size.width * 0.1823587, size.height * 0.9742730);
    path_14.close();

    final Paint paint14Fill = Paint()..style = PaintingStyle.fill;
    paint14Fill.color = const Color(0xffffb8b8).withOpacity(1);
    canvas.drawPath(path_14, paint14Fill);

    final Path path_15 = Path();
    path_15.moveTo(size.width * 0.9109132, size.height * 1.396708);
    path_15.lineTo(size.width * 0.9606088, size.height * 1.396706);
    path_15.lineTo(size.width * 0.9606108, size.height * 1.396706);
    path_15.arcToPoint(
      Offset(size.width * 0.9922811, size.height * 1.428529),
      radius: Radius.elliptical(size.width * 0.03166937, size.height * 0.03182223),
    );
    path_15.lineTo(size.width * 0.9922811, size.height * 1.429563);
    path_15.lineTo(size.width * 0.9109147, size.height * 1.429566);
    path_15.close();

    final Paint paint15Fill = Paint()..style = PaintingStyle.fill;
    paint15Fill.color = const Color(0xff2f2e41).withOpacity(1);
    canvas.drawPath(path_15, paint15Fill);

    final Path path_16 = Path();
    path_16.moveTo(size.width * 0.04650974, size.height * 0.9742730);
    path_16.lineTo(size.width * 0.07174471, size.height * 0.9742730);
    path_16.lineTo(size.width * 0.08375088, size.height * 0.8764695);
    path_16.lineTo(size.width * 0.04650562, size.height * 0.8764695);
    path_16.lineTo(size.width * 0.04650974, size.height * 0.9742730);
    path_16.close();

    final Paint paint16Fill = Paint()..style = PaintingStyle.fill;
    paint16Fill.color = const Color(0xffffb8b8).withOpacity(1);
    canvas.drawPath(path_16, paint16Fill);

    final Path path_17 = Path();
    path_17.moveTo(size.width * 0.7750642, size.height * 1.396708);
    path_17.lineTo(size.width * 0.8247598, size.height * 1.396706);
    path_17.lineTo(size.width * 0.8247619, size.height * 1.396706);
    path_17.arcToPoint(
      Offset(size.width * 0.8564321, size.height * 1.428529),
      radius: Radius.elliptical(size.width * 0.03166937, size.height * 0.03182223),
    );
    path_17.lineTo(size.width * 0.8564321, size.height * 1.429563);
    path_17.lineTo(size.width * 0.7750658, size.height * 1.429566);
    path_17.close();

    final Paint paint17Fill = Paint()..style = PaintingStyle.fill;
    paint17Fill.color = const Color(0xff2f2e41).withOpacity(1);
    canvas.drawPath(path_17, paint17Fill);

    final Path path_18 = Path();
    path_18.moveTo(size.width * 0.7859775, size.height * 1.374090);
    path_18.arcToPoint(
      Offset(size.width * 0.7790306, size.height * 1.371363),
      radius: Radius.elliptical(size.width * 0.01025332, size.height * 0.01030281),
    );
    path_18.lineTo(size.width * 0.7790306, size.height * 1.371363);
    path_18.arcToPoint(
      Offset(size.width * 0.7757050, size.height * 1.364048),
      radius: Radius.elliptical(size.width * 0.01021131, size.height * 0.01026060),
    );
    path_18.lineTo(size.width * 0.7655850, size.height * 0.9995940);
    path_18.lineTo(size.width * 0.9092785, size.height * 1.035689);
    path_18.lineTo(size.width * 0.9536137, size.height * 1.169335);
    path_18.arcToPoint(
      Offset(size.width * 0.9609113, size.height * 1.222746),
      radius: Radius.elliptical(size.width * 0.1450311, size.height * 0.1457311),
    );
    path_18.lineTo(size.width * 0.9554062, size.height * 1.352295);
    path_18.arcToPoint(
      Offset(size.width * 0.9451262, size.height * 1.362137),
      radius: Radius.elliptical(size.width * 0.01028335, size.height * 0.01033299),
    );
    path_18.lineTo(size.width * 0.9210253, size.height * 1.362137);
    path_18.arcToPoint(
      Offset(size.width * 0.9108267, size.height * 1.353182),
      radius: Radius.elliptical(size.width * 0.01033994, size.height * 0.01038984),
    );
    path_18.lineTo(size.width * 0.8936009, size.height * 1.210180);
    path_18.arcToPoint(
      Offset(size.width * 0.8822148, size.height * 1.178817),
      radius: Radius.elliptical(size.width * 0.07785252, size.height * 0.07822829),
      clockwise: false,
    );
    path_18.lineTo(size.width * 0.8483154, size.height * 1.124885);
    path_18.arcToPoint(
      Offset(size.width * 0.8445329, size.height * 1.125733),
      radius: Radius.elliptical(size.width * 0.002058544, size.height * 0.002068480),
      clockwise: false,
    );
    path_18.lineTo(size.width * 0.8179300, size.height * 1.363765);
    path_18.arcToPoint(
      Offset(size.width * 0.8082827, size.height * 1.372858),
      radius: Radius.elliptical(size.width * 0.01027775, size.height * 0.01032736),
    );
    path_18.lineTo(size.width * 0.7865633, size.height * 1.374072);
    path_18.cubicTo(
      size.width * 0.7863679,
      size.height * 1.374083,
      size.width * 0.7861730,
      size.height * 1.374090,
      size.width * 0.7859775,
      size.height * 1.374090,
    );
    path_18.close();

    final Paint paint18Fill = Paint()..style = PaintingStyle.fill;
    paint18Fill.color = const Color(0xff2f2e41).withOpacity(1);
    canvas.drawPath(path_18, paint18Fill);

    final Paint paint19Fill = Paint()..style = PaintingStyle.fill;
    paint19Fill.color = const Color(0xffffb8b8).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.1503759, size.height * 0.2821222), size.width * 0.05055439, paint19Fill);

    final Path path_20 = Path();
    path_20.moveTo(size.width * 0.9085901, size.height * 1.050512);
    path_20.arcToPoint(
      Offset(size.width * 0.9060111, size.height * 1.050182),
      radius: Radius.elliptical(size.width * 0.01044860, size.height * 0.01049903),
    );
    path_20.lineTo(size.width * 0.9060096, size.height * 1.050182);
    path_20.lineTo(size.width * 0.7634417, size.height * 1.013451);
    path_20.arcToPoint(
      Offset(size.width * 0.7559024, size.height * 1.001423),
      radius: Radius.elliptical(size.width * 0.01028850, size.height * 0.01033816),
    );
    path_20.lineTo(size.width * 0.7886443, size.height * 0.8241925);
    path_20.arcToPoint(
      Offset(size.width * 0.8262081, size.height * 0.7775750),
      radius: Radius.elliptical(size.width * 0.06424784, size.height * 0.06455795),
    );
    path_20.arcToPoint(
      Offset(size.width * 0.8843877, size.height * 0.7818670),
      radius: Radius.elliptical(size.width * 0.06198228, size.height * 0.06228145),
    );
    path_20.cubicTo(
      size.width * 0.8863837,
      size.height * 0.7831183,
      size.width * 0.8883943,
      size.height * 0.7844826,
      size.width * 0.8903622,
      size.height * 0.7859228,
    );
    path_20.arcToPoint(
      Offset(size.width * 0.9162534, size.height * 0.8366555),
      radius: Radius.elliptical(size.width * 0.06372645, size.height * 0.06403404),
    );
    path_20.lineTo(size.width * 0.9188570, size.height * 1.040024);
    path_20.arcToPoint(
      Offset(size.width * 0.9085901, size.height * 1.050512),
      radius: Radius.elliptical(size.width * 0.01030509, size.height * 0.01035483),
    );
    path_20.close();

    final Paint paint20Fill = Paint()..style = PaintingStyle.fill;
    paint20Fill.color = const Color(0xff6c63ff).withOpacity(1);
    canvas.drawPath(path_20, paint20Fill);

    final Path path_21 = Path();
    path_21.moveTo(size.width * 0.7781108, size.height * 1.052596);
    path_21.arcToPoint(
      Offset(size.width * 0.7867846, size.height * 1.021919),
      radius: Radius.elliptical(size.width * 0.02069795, size.height * 0.02079785),
    );
    path_21.lineTo(size.width * 0.7804433, size.height * 0.9482853);
    path_21.lineTo(size.width * 0.8140474, size.height * 0.9665862);
    path_21.lineTo(size.width * 0.8149173, size.height * 1.033704);
    path_21.arcToPoint(
      Offset(size.width * 0.7781109, size.height * 1.052596),
      radius: Radius.elliptical(size.width * 0.02081014, size.height * 0.02091059),
    );
    path_21.close();

    final Paint paint21Fill = Paint()..style = PaintingStyle.fill;
    paint21Fill.color = const Color(0xffffb8b8).withOpacity(1);
    canvas.drawPath(path_21, paint21Fill);

    final Path path_22 = Path();
    path_22.moveTo(size.width * 0.7901162, size.height * 1.012180);
    path_22.arcToPoint(
      Offset(size.width * 0.7873051, size.height * 1.011823),
      radius: Radius.elliptical(size.width * 0.01138711, size.height * 0.01144207),
    );
    path_22.arcToPoint(
      Offset(size.width * 0.7791296, size.height * 1.003578),
      radius: Radius.elliptical(size.width * 0.01131167, size.height * 0.01136627),
    );
    path_22.lineTo(size.width * 0.7626154, size.height * 0.9376343);
    path_22.arcToPoint(
      Offset(size.width * 0.7703572, size.height * 0.8691033),
      radius: Radius.elliptical(size.width * 0.09750307, size.height * 0.09797369),
    );
    path_22.lineTo(size.width * 0.8049551, size.height * 0.8010953);
    path_22.arcToPoint(
      Offset(size.width * 0.8436681, size.height * 0.7783062),
      radius: Radius.elliptical(size.width * 0.03198796, size.height * 0.03214236),
    );
    path_22.arcToPoint(
      Offset(size.width * 0.8631704, size.height * 0.7929920),
      radius: Radius.elliptical(size.width * 0.03160699, size.height * 0.03175954),
    );
    path_22.arcToPoint(
      Offset(size.width * 0.8665750, size.height * 0.8176313),
      radius: Radius.elliptical(size.width * 0.03204197, size.height * 0.03219663),
    );
    path_22.lineTo(size.width * 0.8173246, size.height * 0.9282949);
    path_22.lineTo(size.width * 0.8179095, size.height * 0.9945527);
    path_22.arcToPoint(
      Offset(size.width * 0.8105315, size.height * 1.005317),
      radius: Radius.elliptical(size.width * 0.01135903, size.height * 0.01141386),
    );
    path_22.lineTo(size.width * 0.7940499, size.height * 1.011467);
    path_22.arcToPoint(
      Offset(size.width * 0.7901162, size.height * 1.012180),
      radius: Radius.elliptical(size.width * 0.01127958, size.height * 0.01133402),
    );
    path_22.close();

    final Paint paint22Fill = Paint()..style = PaintingStyle.fill;
    paint22Fill.color = const Color(0xff6c63ff).withOpacity(1);
    canvas.drawPath(path_22, paint22Fill);

    final Path path_23 = Path();
    path_23.moveTo(size.width * 1.025867, size.height * 1.025511);
    path_23.arcToPoint(
      Offset(size.width * 1.008386, size.height * 0.9988938),
      radius: Radius.elliptical(size.width * 0.02069799, size.height * 0.02079789),
    );
    path_23.lineTo(size.width * 0.9487082, size.height * 0.9556895);
    path_23.lineTo(size.width * 0.9844335, size.height * 0.9420353);
    path_23.lineTo(size.width * 1.035627, size.height * 0.9851561);
    path_23.arcToPoint(
      Offset(size.width * 1.025867, size.height * 1.025511),
      radius: Radius.elliptical(size.width * 0.02081014, size.height * 0.02091059),
    );
    path_23.close();

    final Paint paint23Fill = Paint()..style = PaintingStyle.fill;
    paint23Fill.color = const Color(0xffffb8b8).withOpacity(1);
    canvas.drawPath(path_23, paint23Fill);

    final Path path_24 = Path();
    path_24.moveTo(size.width * 0.9946263, size.height * 0.9939619);
    path_24.arcToPoint(
      Offset(size.width * 0.9895574, size.height * 0.9927591),
      radius: Radius.elliptical(size.width * 0.01136704, size.height * 0.01142190),
    );
    path_24.lineTo(size.width * 0.9290446, size.height * 0.9623200);
    path_24.arcToPoint(
      Offset(size.width * 0.8824018, size.height * 0.9117196),
      radius: Radius.elliptical(size.width * 0.09752513, size.height * 0.09799586),
    );
    path_24.lineTo(size.width * 0.8536733, size.height * 0.8410052);
    path_24.arcToPoint(
      Offset(size.width * 0.8617372, size.height * 0.7966529),
      radius: Radius.elliptical(size.width * 0.03199372, size.height * 0.03214815),
    );
    path_24.arcToPoint(
      Offset(size.width * 0.8855938, size.height * 0.7913923),
      radius: Radius.elliptical(size.width * 0.03159842, size.height * 0.03175094),
    );
    path_24.arcToPoint(
      Offset(size.width * 0.9063433, size.height * 0.8048612),
      radius: Radius.elliptical(size.width * 0.03204749, size.height * 0.03220217),
    );
    path_24.lineTo(size.width * 0.9576882, size.height * 0.9145604);
    path_24.lineTo(size.width * 1.008047, size.height * 0.9573372);
    path_24.arcToPoint(
      Offset(size.width * 1.011354, size.height * 0.9699780),
      radius: Radius.elliptical(size.width * 0.01135705, size.height * 0.01141187),
    );
    path_24.lineTo(size.width * 1.005241, size.height * 0.9865412);
    path_24.arcToPoint(
      Offset(size.width * 1.001110, size.height * 0.9919108),
      radius: Radius.elliptical(size.width * 0.01126723, size.height * 0.01132161),
    );
    path_24.arcToPoint(
      Offset(size.width * 0.9946262, size.height * 0.9939619),
      radius: Radius.elliptical(size.width * 0.01131492, size.height * 0.01136953),
    );
    path_24.close();

    final Paint paint24Fill = Paint()..style = PaintingStyle.fill;
    paint24Fill.color = const Color(0xff6c63ff).withOpacity(1);
    canvas.drawPath(path_24, paint24Fill);

    final Path path_25 = Path();
    path_25.moveTo(size.width * 0.8747505, size.height * 0.7644118);
    path_25.cubicTo(
      size.width * 0.8774366,
      size.height * 0.7655928,
      size.width * 0.8829371,
      size.height * 0.7440864,
      size.width * 0.8804732,
      size.height * 0.7397850,
    );
    path_25.cubicTo(
      size.width * 0.8768089,
      size.height * 0.7333880,
      size.width * 0.8770255,
      size.height * 0.7334339,
      size.width * 0.8745930,
      size.height * 0.7292017,
    );
    path_25.cubicTo(
      size.width * 0.8721604,
      size.height * 0.7249695,
      size.width * 0.8716162,
      size.height * 0.7191766,
      size.width * 0.8747662,
      size.height * 0.7154528,
    );
    path_25.cubicTo(
      size.width * 0.8779163,
      size.height * 0.7117289,
      size.width * 0.8852060,
      size.height * 0.7122229,
      size.width * 0.8866436,
      size.height * 0.7168919,
    );
    path_25.cubicTo(
      size.width * 0.8857188,
      size.height * 0.7080236,
      size.width * 0.8944485,
      size.height * 0.7008949,
      size.width * 0.9030957,
      size.height * 0.6988916,
    );
    path_25.cubicTo(
      size.width * 0.9117429,
      size.height * 0.6968883,
      size.width * 0.9208640,
      size.height * 0.6981321,
      size.width * 0.9295588,
      size.height * 0.6963494,
    );
    path_25.cubicTo(
      size.width * 0.9396496,
      size.height * 0.6942805,
      size.width * 0.9501485,
      size.height * 0.6857812,
      size.width * 0.9461225,
      size.height * 0.6746313,
    );
    path_25.arcToPoint(
      Offset(size.width * 0.9430740, size.height * 0.6695970),
      radius: Radius.elliptical(size.width * 0.01562901, size.height * 0.01570445),
      clockwise: false,
    );
    path_25.cubicTo(
      size.width * 0.9384223,
      size.height * 0.6643417,
      size.width * 0.9319155,
      size.height * 0.6620976,
      size.width * 0.9255536,
      size.height * 0.6599279,
    );
    path_25.cubicTo(
      size.width * 0.9123185,
      size.height * 0.6554140,
      size.width * 0.8987214,
      size.height * 0.6508435,
      size.width * 0.8847534,
      size.height * 0.6513418,
    );
    path_25.arcToPoint(
      Offset(size.width * 0.8323767, size.height * 0.6898304),
      radius: Radius.elliptical(size.width * 0.05927481, size.height * 0.05956091),
      clockwise: false,
    );
    path_25.arcToPoint(
      Offset(size.width * 0.8301467, size.height * 0.6981558),
      radius: Radius.elliptical(size.width * 0.05383675, size.height * 0.05409661),
      clockwise: false,
    );
    path_25.cubicTo(
      size.width * 0.8253524,
      size.height * 0.7240591,
      size.width * 0.8403223,
      size.height * 0.7496097,
      size.width * 0.8646363,
      size.height * 0.7594736,
    );
    path_25.close();

    final Paint paint25Fill = Paint()..style = PaintingStyle.fill;
    paint25Fill.color = const Color(0xff2f2e41).withOpacity(1);
    canvas.drawPath(path_25, paint25Fill);

    final Path path_26 = Path();
    path_26.moveTo(size.width * 0.08006855, size.height * 0.5653423);
    path_26.lineTo(size.width * 0.08121503, size.height * 0.4972368);
    path_26.lineTo(size.width * 0.1171183, size.height * 0.4247011);
    path_26.lineTo(size.width * 0.08830181, size.height * 0.4991582);
    path_26.lineTo(size.width * 0.08006855, size.height * 0.5653423);
    path_26.close();

    final Paint paint26Fill = Paint()..style = PaintingStyle.fill;
    paint26Fill.color = const Color(0xff000000).withOpacity(1);
    canvas.drawPath(path_26, paint26Fill);

    final Path path_27 = Path();
    path_27.moveTo(size.width * 1.140638, size.height * 1.166975);
    path_27.lineTo(size.width * 0.9890668, size.height * 1.103696);
    path_27.arcToPoint(
      Offset(size.width * 0.9753047, size.height * 1.088110),
      radius: Radius.elliptical(size.width * 0.02362572, size.height * 0.02373975),
    );
    path_27.lineTo(size.width * 0.9753047, size.height * 1.088110);
    path_27.arcToPoint(
      Offset(size.width * 0.9790396, size.height * 1.067345),
      radius: Radius.elliptical(size.width * 0.02392084, size.height * 0.02403630),
    );
    path_27.arcToPoint(
      Offset(size.width * 1.052996, size.height * 0.8884828),
      radius: Radius.elliptical(size.width * 0.4150198, size.height * 0.4170230),
      clockwise: false,
    );
    path_27.arcToPoint(
      Offset(size.width * 1.065005, size.height * 0.8711731),
      radius: Radius.elliptical(size.width * 0.02392633, size.height * 0.02404182),
    );
    path_27.arcToPoint(
      Offset(size.width * 1.085707, size.height * 0.8699759),
      radius: Radius.elliptical(size.width * 0.02362436, size.height * 0.02373839),
    );
    path_27.lineTo(size.width * 1.237278, size.height * 0.9332552);
    path_27.arcToPoint(
      Offset(size.width * 1.251317, size.height * 0.9609650),
      radius: Radius.elliptical(size.width * 0.02392483, size.height * 0.02404031),
    );
    path_27.arcToPoint(
      Offset(size.width * 1.170085, size.height * 1.157420),
      radius: Radius.elliptical(size.width * 0.6956320, size.height * 0.6989896),
    );
    path_27.arcToPoint(
      Offset(size.width * 1.140638, size.height * 1.166975),
      radius: Radius.elliptical(size.width * 0.02392485, size.height * 0.02404033),
    );
    path_27.close();

    final Paint paint27Fill = Paint()..style = PaintingStyle.fill;
    paint27Fill.color = const Color(0xffe6e6e6).withOpacity(1);
    canvas.drawPath(path_27, paint27Fill);

    final Path path_28 = Path();
    path_28.moveTo(size.width * 1.080968, size.height * 0.8814357);
    path_28.arcToPoint(
      Offset(size.width * 1.071026, size.height * 0.8820071),
      radius: Radius.elliptical(size.width * 0.01134674, size.height * 0.01140151),
      clockwise: false,
    );
    path_28.arcToPoint(
      Offset(size.width * 1.065190, size.height * 0.8904409),
      radius: Radius.elliptical(size.width * 0.01164894, size.height * 0.01170517),
      clockwise: false,
    );
    path_28.arcToPoint(
      Offset(size.width * 0.9890244, size.height * 1.074648),
      radius: Radius.elliptical(size.width * 0.4274221, size.height * 0.4294852),
    );
    path_28.arcToPoint(
      Offset(size.width * 0.9871936, size.height * 1.084751),
      radius: Radius.elliptical(size.width * 0.01164258, size.height * 0.01169878),
      clockwise: false,
    );
    path_28.lineTo(size.width * 0.9871941, size.height * 1.084753);
    path_28.arcToPoint(
      Offset(size.width * 0.9938051, size.height * 1.092236),
      radius: Radius.elliptical(size.width * 0.01134372, size.height * 0.01139847),
      clockwise: false,
    );
    path_28.lineTo(size.width * 1.145376, size.height * 1.155515);
    path_28.arcToPoint(
      Offset(size.width * 1.159533, size.height * 1.150973),
      radius: Radius.elliptical(size.width * 0.01149049, size.height * 0.01154596),
      clockwise: false,
    );
    path_28.arcToPoint(
      Offset(size.width * 1.239325, size.height * 0.9580002),
      radius: Radius.elliptical(size.width * 0.6833318, size.height * 0.6866301),
      clockwise: false,
    );
    path_28.arcToPoint(
      Offset(size.width * 1.232540, size.height * 0.9447149),
      radius: Radius.elliptical(size.width * 0.01149052, size.height * 0.01154598),
      clockwise: false,
    );
    path_28.close();

    final Paint paint28Fill = Paint()..style = PaintingStyle.fill;
    paint28Fill.color = const Color(0xffffffff).withOpacity(1);
    canvas.drawPath(path_28, paint28Fill);

    final Path path_29 = Path();
    path_29.moveTo(size.width * 1.161674, size.height * 1.022299);
    path_29.lineTo(size.width * 1.082135, size.height * 0.9890925);
    path_29.arcToPoint(
      Offset(size.width * 1.075469, size.height * 0.9728720),
      radius: Radius.elliptical(size.width * 0.01236293, size.height * 0.01242261),
    );
    path_29.lineTo(size.width * 1.077321, size.height * 0.9683939);
    path_29.arcToPoint(
      Offset(size.width * 1.093464, size.height * 0.9616957),
      radius: Radius.elliptical(size.width * 0.01236291, size.height * 0.01242259),
    );
    path_29.lineTo(size.width * 1.173002, size.height * 0.9949021);
    path_29.arcToPoint(
      Offset(size.width * 1.179668, size.height * 1.011123),
      radius: Radius.elliptical(size.width * 0.01236295, size.height * 0.01242263),
    );
    path_29.lineTo(size.width * 1.177816, size.height * 1.015601);
    path_29.arcToPoint(
      Offset(size.width * 1.161674, size.height * 1.022299),
      radius: Radius.elliptical(size.width * 0.01236291, size.height * 0.01242259),
    );
    path_29.close();

    final Paint paint29Fill = Paint()..style = PaintingStyle.fill;
    paint29Fill.color = const Color(0xff6c63ff).withOpacity(1);
    canvas.drawPath(path_29, paint29Fill);

    final Path path_30 = Path();
    path_30.moveTo(size.width * 1.138277, size.height * 1.078883);
    path_30.lineTo(size.width * 1.058739, size.height * 1.045676);
    path_30.arcToPoint(
      Offset(size.width * 1.052073, size.height * 1.029456),
      radius: Radius.elliptical(size.width * 0.01236293, size.height * 0.01242261),
    );
    path_30.lineTo(size.width * 1.053924, size.height * 1.024978);
    path_30.arcToPoint(
      Offset(size.width * 1.070067, size.height * 1.018280),
      radius: Radius.elliptical(size.width * 0.01236295, size.height * 0.01242263),
    );
    path_30.lineTo(size.width * 1.149605, size.height * 1.051486);
    path_30.arcToPoint(
      Offset(size.width * 1.156271, size.height * 1.067706),
      radius: Radius.elliptical(size.width * 0.01236293, size.height * 0.01242261),
    );
    path_30.lineTo(size.width * 1.154420, size.height * 1.072185);
    path_30.arcToPoint(
      Offset(size.width * 1.138277, size.height * 1.078883),
      radius: Radius.elliptical(size.width * 0.01236291, size.height * 0.01242259),
    );
    path_30.close();

    final Paint paint30Fill = Paint()..style = PaintingStyle.fill;
    paint30Fill.color = const Color(0xff6c63ff).withOpacity(1);
    canvas.drawPath(path_30, paint30Fill);

    final Path path_31 = Path();
    path_31.moveTo(size.width * 1.193545, size.height * 0.9427756);
    path_31.arcToPoint(
      Offset(size.width * 1.190072, size.height * 0.9420919),
      radius: Radius.elliptical(size.width * 0.009240692, size.height * 0.009285295),
    );
    path_31.lineTo(size.width * 1.109925, size.height * 0.9095321);
    path_31.arcToPoint(
      Offset(size.width * 1.104810, size.height * 0.8974154),
      radius: Radius.elliptical(size.width * 0.009273090, size.height * 0.009317849),
    );
    path_31.lineTo(size.width * 1.110982, size.height * 0.8820752);
    path_31.arcToPoint(
      Offset(size.width * 1.123041, size.height * 0.8769359),
      radius: Radius.elliptical(size.width * 0.009262984, size.height * 0.009307694),
    );
    path_31.lineTo(size.width * 1.203188, size.height * 0.9094957);
    path_31.arcToPoint(
      Offset(size.width * 1.208303, size.height * 0.9216123),
      radius: Radius.elliptical(size.width * 0.009273090, size.height * 0.009317849),
    );
    path_31.lineTo(size.width * 1.202131, size.height * 0.9369526);
    path_31.arcToPoint(
      Offset(size.width * 1.193545, size.height * 0.9427756),
      radius: Radius.elliptical(size.width * 0.009284637, size.height * 0.009329452),
    );
    path_31.close();

    final Paint paint31Fill = Paint()..style = PaintingStyle.fill;
    paint31Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_31, paint31Fill);

    final Path path_32 = Path();
    path_32.moveTo(size.width * 1.025213, size.height * 1.430714);
    path_32.lineTo(size.width * 0.7370487, size.height * 1.430714);
    path_32.arcToPoint(
      Offset(size.width * 0.7370487, size.height * 1.426577),
      radius: Radius.elliptical(size.width * 0.002058317, size.height * 0.002068252),
      largeArc: true,
    );
    path_32.lineTo(size.width * 1.025213, size.height * 1.426577);
    path_32.arcToPoint(
      Offset(size.width * 1.025213, size.height * 1.430714),
      radius: Radius.elliptical(size.width * 0.002058317, size.height * 0.002068252),
    );
    path_32.close();

    final Paint paint32Fill = Paint()..style = PaintingStyle.fill;
    paint32Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_32, paint32Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
