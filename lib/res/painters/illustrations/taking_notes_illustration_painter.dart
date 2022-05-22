// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';

class TakingNotesIllustrationPainter extends CustomPainter {
  const TakingNotesIllustrationPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.6843342, size.height * 0.9433486);
    path_0.lineTo(size.width * 0.4773257, size.height * 1.002494);
    path_0.arcToPoint(
      Offset(size.width * 0.4500122, size.height * 0.9783612),
      radius: Radius.elliptical(size.width * 0.02308028, size.height * 0.03128522),
    );
    path_0.lineTo(size.width * 0.4144898, size.height * 0.7499248);
    path_0.arcToPoint(
      Offset(size.width * 0.4322935, size.height * 0.7129014),
      radius: Radius.elliptical(size.width * 0.02308028, size.height * 0.03128522),
    );
    path_0.lineTo(size.width * 0.6393019, size.height * 0.6537560);
    path_0.arcToPoint(
      Offset(size.width * 0.6666154, size.height * 0.6778888),
      radius: Radius.elliptical(size.width * 0.02308026, size.height * 0.03128520),
    );
    path_0.lineTo(size.width * 0.7021378, size.height * 0.9063252);
    path_0.arcToPoint(
      Offset(size.width * 0.6843342, size.height * 0.9433486),
      radius: Radius.elliptical(size.width * 0.02308028, size.height * 0.03128522),
    );
    path_0.close();
    path_0.moveTo(size.width * 0.4328529, size.height * 0.7164988);
    path_0.arcToPoint(
      Offset(size.width * 0.4171438, size.height * 0.7491665),
      radius: Radius.elliptical(size.width * 0.02036508, size.height * 0.02760478),
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.4526661, size.height * 0.9776029);
    path_0.arcToPoint(
      Offset(size.width * 0.4767663, size.height * 0.9988966),
      radius: Radius.elliptical(size.width * 0.02036508, size.height * 0.02760478),
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.6837747, size.height * 0.9397512);
    path_0.arcToPoint(
      Offset(size.width * 0.6994838, size.height * 0.9070835),
      radius: Radius.elliptical(size.width * 0.02036508, size.height * 0.02760478),
      clockwise: false,
    );
    path_0.lineTo(size.width * 0.6639615, size.height * 0.6786471);
    path_0.arcToPoint(
      Offset(size.width * 0.6398613, size.height * 0.6573534),
      radius: Radius.elliptical(size.width * 0.02036508, size.height * 0.02760478),
      clockwise: false,
    );
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff3f3d56).withOpacity(1);
    canvas.drawPath(path_0, paint0Fill);

    final Path path_1 = Path();
    path_1.moveTo(size.width * 0.6264399, size.height * 0.7290780);
    path_1.lineTo(size.width * 0.5219655, size.height * 0.7589279);
    path_1.arcToPoint(
      Offset(size.width * 0.5175861, size.height * 0.7555031),
      radius: Radius.elliptical(size.width * 0.003703455, size.height * 0.005020018),
    );
    path_1.arcToPoint(
      Offset(size.width * 0.5202964, size.height * 0.7495213),
      radius: Radius.elliptical(size.width * 0.003567503, size.height * 0.004835735),
    );
    path_1.lineTo(size.width * 0.6266450, size.height * 0.7191360);
    path_1.cubicTo(
      size.width * 0.6307974,
      size.height * 0.7223080,
      size.width * 0.6294850,
      size.height * 0.7282080,
      size.width * 0.6264386,
      size.height * 0.7290784,
    );
    path_1.close();

    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_1, paint1Fill);

    final Path path_2 = Path();
    path_2.moveTo(size.width * 0.6303026, size.height * 0.7539181);
    path_2.lineTo(size.width * 0.5258282, size.height * 0.7837681);
    path_2.arcToPoint(
      Offset(size.width * 0.5214488, size.height * 0.7803433),
      radius: Radius.elliptical(size.width * 0.003703455, size.height * 0.005020018),
    );
    path_2.arcToPoint(
      Offset(size.width * 0.5241592, size.height * 0.7743615),
      radius: Radius.elliptical(size.width * 0.003567489, size.height * 0.004835717),
    );
    path_2.lineTo(size.width * 0.6305077, size.height * 0.7439761);
    path_2.cubicTo(
      size.width * 0.6346601,
      size.height * 0.7471481,
      size.width * 0.6333477,
      size.height * 0.7530481,
      size.width * 0.6303013,
      size.height * 0.7539185,
    );
    path_2.close();

    final Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_2, paint2Fill);

    final Path path_3 = Path();
    path_3.moveTo(size.width * 0.5054425, size.height * 0.8043642);
    path_3.lineTo(size.width * 0.4735580, size.height * 0.8134741);
    path_3.arcToPoint(
      Offset(size.width * 0.4688038, size.height * 0.8092735),
      radius: Radius.elliptical(size.width * 0.004016872, size.height * 0.005444853),
    );
    path_3.lineTo(size.width * 0.4608728, size.height * 0.7582711);
    path_3.arcToPoint(
      Offset(size.width * 0.4639717, size.height * 0.7518268),
      radius: Radius.elliptical(size.width * 0.004016872, size.height * 0.005444853),
    );
    path_3.lineTo(size.width * 0.4958563, size.height * 0.7427169);
    path_3.arcToPoint(
      Offset(size.width * 0.5006105, size.height * 0.7469174),
      radius: Radius.elliptical(size.width * 0.004018228, size.height * 0.005446691),
    );
    path_3.lineTo(size.width * 0.5085414, size.height * 0.7979199);
    path_3.arcToPoint(
      Offset(size.width * 0.5054425, size.height * 0.8043642),
      radius: Radius.elliptical(size.width * 0.004016872, size.height * 0.005444853),
    );
    path_3.close();

    final Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_3, paint3Fill);

    final Path path_4 = Path();
    path_4.moveTo(size.width * 0.6379076, size.height * 0.8048654);
    path_4.lineTo(size.width * 0.4784605, size.height * 0.8504218);
    path_4.arcToPoint(
      Offset(size.width * 0.4740811, size.height * 0.8469970),
      radius: Radius.elliptical(size.width * 0.003703415, size.height * 0.005019963),
    );
    path_4.arcToPoint(
      Offset(size.width * 0.4767915, size.height * 0.8410152),
      radius: Radius.elliptical(size.width * 0.003567489, size.height * 0.004835717),
    );
    path_4.lineTo(size.width * 0.6381140, size.height * 0.7949230);
    path_4.cubicTo(
      size.width * 0.6422664,
      size.height * 0.7980950,
      size.width * 0.6409540,
      size.height * 0.8039950,
      size.width * 0.6379076,
      size.height * 0.8048654,
    );
    path_4.close();

    final Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_4, paint4Fill);

    final Path path_5 = Path();
    path_5.moveTo(size.width * 0.6417715, size.height * 0.8297128);
    path_5.lineTo(size.width * 0.4823243, size.height * 0.8752692);
    path_5.arcToPoint(
      Offset(size.width * 0.4779449, size.height * 0.8718445),
      radius: Radius.elliptical(size.width * 0.003703428, size.height * 0.005019982),
    );
    path_5.arcToPoint(
      Offset(size.width * 0.4806553, size.height * 0.8658626),
      radius: Radius.elliptical(size.width * 0.003567489, size.height * 0.004835717),
    );
    path_5.lineTo(size.width * 0.6419778, size.height * 0.8197704);
    path_5.cubicTo(
      size.width * 0.6461303,
      size.height * 0.8229424,
      size.width * 0.6448178,
      size.height * 0.8288424,
      size.width * 0.6417714,
      size.height * 0.8297128,
    );
    path_5.close();

    final Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_5, paint5Fill);

    final Path path_6 = Path();
    path_6.moveTo(size.width * 0.6456328, size.height * 0.8545440);
    path_6.lineTo(size.width * 0.4861856, size.height * 0.9001004);
    path_6.arcToPoint(
      Offset(size.width * 0.4818063, size.height * 0.8966756),
      radius: Radius.elliptical(size.width * 0.003703442, size.height * 0.005020000),
    );
    path_6.arcToPoint(
      Offset(size.width * 0.4845166, size.height * 0.8906938),
      radius: Radius.elliptical(size.width * 0.003567476, size.height * 0.004835699),
    );
    path_6.lineTo(size.width * 0.6458392, size.height * 0.8446016);
    path_6.cubicTo(
      size.width * 0.6499916,
      size.height * 0.8477736,
      size.width * 0.6486791,
      size.height * 0.8536736,
      size.width * 0.6456328,
      size.height * 0.8545440,
    );
    path_6.close();

    final Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_6, paint6Fill);

    final Path path_7 = Path();
    path_7.moveTo(size.width * 0.6494963, size.height * 0.8793896);
    path_7.lineTo(size.width * 0.4900492, size.height * 0.9249460);
    path_7.arcToPoint(
      Offset(size.width * 0.4856698, size.height * 0.9215212),
      radius: Radius.elliptical(size.width * 0.003703428, size.height * 0.005019982),
    );
    path_7.arcToPoint(
      Offset(size.width * 0.4883801, size.height * 0.9155394),
      radius: Radius.elliptical(size.width * 0.003567462, size.height * 0.004835680),
    );
    path_7.lineTo(size.width * 0.6497027, size.height * 0.8694472);
    path_7.cubicTo(
      size.width * 0.6538551,
      size.height * 0.8726192,
      size.width * 0.6525427,
      size.height * 0.8785192,
      size.width * 0.6494963,
      size.height * 0.8793896,
    );
    path_7.close();

    final Paint paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_7, paint7Fill);

    final Path path_8 = Path();
    path_8.moveTo(size.width * 0.6533579, size.height * 0.9042226);
    path_8.lineTo(size.width * 0.4939108, size.height * 0.9497790);
    path_8.arcToPoint(
      Offset(size.width * 0.4895314, size.height * 0.9463543),
      radius: Radius.elliptical(size.width * 0.003703428, size.height * 0.005019982),
    );
    path_8.arcToPoint(
      Offset(size.width * 0.4922417, size.height * 0.9403725),
      radius: Radius.elliptical(size.width * 0.003567449, size.height * 0.004835662),
    );
    path_8.lineTo(size.width * 0.6535643, size.height * 0.8942802);
    path_8.cubicTo(
      size.width * 0.6577168,
      size.height * 0.8974522,
      size.width * 0.6564043,
      size.height * 0.9033522,
      size.width * 0.6533579,
      size.height * 0.9042226,
    );
    path_8.close();

    final Paint paint8Fill = Paint()..style = PaintingStyle.fill;
    paint8Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_8, paint8Fill);

    final Path path_9 = Path();
    path_9.moveTo(size.width * 0.6787916, size.height * 0.7904967);
    path_9.arcToPoint(
      Offset(size.width * 0.6778650, size.height * 0.7932727),
      radius: Radius.elliptical(size.width * 0.01427667, size.height * 0.01935197),
      clockwise: false,
    );
    path_9.lineTo(size.width * 0.6125897, size.height * 0.8152292);
    path_9.lineTo(size.width * 0.6012342, size.height * 0.7993053);
    path_9.lineTo(size.width * 0.5812651, size.height * 0.8193942);
    path_9.lineTo(size.width * 0.5993467, size.height * 0.8502323);
    path_9.arcToPoint(
      Offset(size.width * 0.6119438, size.height * 0.8546955),
      radius: Radius.elliptical(size.width * 0.01084908, size.height * 0.01470588),
      clockwise: false,
    );
    path_9.lineTo(size.width * 0.6827739, size.height * 0.8154635);
    path_9.arcToPoint(
      Offset(size.width * 0.6787917, size.height * 0.7904968),
      radius: Radius.elliptical(size.width * 0.01423547, size.height * 0.01929612),
      largeArc: true,
      clockwise: false,
    );
    path_9.close();

    final Paint paint9Fill = Paint()..style = PaintingStyle.fill;
    paint9Fill.color = const Color(0xffffb8b8).withOpacity(1);
    canvas.drawPath(path_9, paint9Fill);

    final Path path_10 = Path();
    path_10.moveTo(size.width * 0.4559832, size.height * 0.9858870);
    path_10.arcToPoint(
      Offset(size.width * 0.4646329, size.height * 0.9579685),
      radius: Radius.elliptical(size.width * 0.01456855, size.height * 0.01974761),
      clockwise: false,
    );
    path_10.lineTo(size.width * 0.5095538, size.height * 0.7887272);
    path_10.lineTo(size.width * 0.4783578, size.height * 0.7812333);
    path_10.lineTo(size.width * 0.4440114, size.height * 0.9499484);
    path_10.arcToPoint(
      Offset(size.width * 0.4559832, size.height * 0.9858870),
      radius: Radius.elliptical(size.width * 0.01464748, size.height * 0.01985460),
      clockwise: false,
    );
    path_10.close();

    final Paint paint10Fill = Paint()..style = PaintingStyle.fill;
    paint10Fill.color = const Color(0xffffb8b8).withOpacity(1);
    canvas.drawPath(path_10, paint10Fill);

    final Path path_11 = Path();
    path_11.moveTo(size.width * 0.5038489, size.height * 0.8187694);
    path_11.lineTo(size.width * 0.4730476, size.height * 0.8027458);
    path_11.arcToPoint(
      Offset(size.width * 0.4696983, size.height * 0.7901300),
      radius: Radius.elliptical(size.width * 0.006532326, size.height * 0.008854540),
    );
    path_11.lineTo(size.width * 0.4858567, size.height * 0.7512960);
    path_11.arcToPoint(
      Offset(size.width * 0.5196922, size.height * 0.7690525),
      radius: Radius.elliptical(size.width * 0.01814152, size.height * 0.02459075),
    );
    path_11.lineTo(size.width * 0.5125650, size.height * 0.8124303);
    path_11.arcToPoint(
      Offset(size.width * 0.5038489, size.height * 0.8187695),
      radius: Radius.elliptical(size.width * 0.006532326, size.height * 0.008854540),
    );
    path_11.close();

    final Paint paint11Fill = Paint()..style = PaintingStyle.fill;
    paint11Fill.color = const Color(0xff6c63ff).withOpacity(1);
    canvas.drawPath(path_11, paint11Fill);

    final Path path_12 = Path();
    path_12.moveTo(size.width * 0.2596903, size.height * 0.9764246);
    path_12.lineTo(size.width * 0.2763152, size.height * 0.9764246);
    path_12.lineTo(size.width * 0.2842255, size.height * 0.8894982);
    path_12.lineTo(size.width * 0.2596876, size.height * 0.8895000);
    path_12.lineTo(size.width * 0.2596903, size.height * 0.9764246);
    path_12.close();

    final Paint paint12Fill = Paint()..style = PaintingStyle.fill;
    paint12Fill.color = const Color(0xffffb8b8).withOpacity(1);
    canvas.drawPath(path_12, paint12Fill);

    final Path path_13 = Path();
    path_13.moveTo(size.width * 0.5691300, size.height * 1.296274);
    path_13.lineTo(size.width * 0.6018722, size.height * 1.296272);
    path_13.lineTo(size.width * 0.6018736, size.height * 1.296272);
    path_13.arcToPoint(
      Offset(size.width * 0.6227397, size.height * 1.324555),
      radius: Radius.elliptical(size.width * 0.02086556, size.height * 0.02828318),
    );
    path_13.lineTo(size.width * 0.6227397, size.height * 1.325474);
    path_13.lineTo(size.width * 0.5691310, size.height * 1.325477);
    path_13.close();

    final Paint paint13Fill = Paint()..style = PaintingStyle.fill;
    paint13Fill.color = const Color(0xff2f2e41).withOpacity(1);
    canvas.drawPath(path_13, paint13Fill);

    final Path path_14 = Path();
    path_14.moveTo(size.width * 0.1661170, size.height * 0.9764246);
    path_14.lineTo(size.width * 0.1827419, size.height * 0.9764246);
    path_14.lineTo(size.width * 0.1906522, size.height * 0.8894982);
    path_14.lineTo(size.width * 0.1661143, size.height * 0.8895000);
    path_14.lineTo(size.width * 0.1661170, size.height * 0.9764246);
    path_14.close();

    final Paint paint14Fill = Paint()..style = PaintingStyle.fill;
    paint14Fill.color = const Color(0xffffb8b8).withOpacity(1);
    canvas.drawPath(path_14, paint14Fill);

    final Path path_15 = Path();
    path_15.moveTo(size.width * 0.4755567, size.height * 1.296274);
    path_15.lineTo(size.width * 0.5082989, size.height * 1.296272);
    path_15.lineTo(size.width * 0.5083003, size.height * 1.296272);
    path_15.arcToPoint(
      Offset(size.width * 0.5291664, size.height * 1.324555),
      radius: Radius.elliptical(size.width * 0.02086556, size.height * 0.02828318),
    );
    path_15.lineTo(size.width * 0.5291664, size.height * 1.325474);
    path_15.lineTo(size.width * 0.4755577, size.height * 1.325477);
    path_15.close();

    final Paint paint15Fill = Paint()..style = PaintingStyle.fill;
    paint15Fill.color = const Color(0xff2f2e41).withOpacity(1);
    canvas.drawPath(path_15, paint15Fill);

    final Path path_16 = Path();
    path_16.moveTo(size.width * 0.4972274, size.height * 1.268644);
    path_16.lineTo(size.width * 0.4761875, size.height * 1.268644);
    path_16.arcToPoint(
      Offset(size.width * 0.4700918, size.height * 1.259979),
      radius: Radius.elliptical(size.width * 0.006103177, size.height * 0.008272831),
    );
    path_16.lineTo(size.width * 0.4800857, size.height * 0.9689276);
    path_16.lineTo(size.width * 0.4807154, size.height * 0.9689042);
    path_16.lineTo(size.width * 0.5823159, size.height * 0.9653140);
    path_16.lineTo(size.width * 0.6021974, size.height * 1.256532);
    path_16.arcToPoint(
      Offset(size.width * 0.5966090, size.height * 1.265560),
      radius: Radius.elliptical(size.width * 0.006102905, size.height * 0.008272463),
    );
    path_16.lineTo(size.width * 0.5729766, size.height * 1.268122);
    path_16.arcToPoint(
      Offset(size.width * 0.5665118, size.height * 1.261537),
      radius: Radius.elliptical(size.width * 0.006105658, size.height * 0.008276195),
    );
    path_16.lineTo(size.width * 0.5362832, size.height * 1.054228);
    path_16.arcToPoint(
      Offset(size.width * 0.5342910, size.height * 1.052023),
      radius: Radius.elliptical(size.width * 0.001971481, size.height * 0.002672335),
      clockwise: false,
    );
    path_16.lineTo(size.width * 0.5342827, size.height * 1.052023);
    path_16.arcToPoint(
      Offset(size.width * 0.5322942, size.height * 1.054249),
      radius: Radius.elliptical(size.width * 0.001972485, size.height * 0.002673695),
      clockwise: false,
    );
    path_16.lineTo(size.width * 0.5032151, size.height * 1.261970);
    path_16.arcToPoint(
      Offset(size.width * 0.4972274, size.height * 1.268644),
      radius: Radius.elliptical(size.width * 0.006115504, size.height * 0.008289540),
    );
    path_16.close();

    final Paint paint16Fill = Paint()..style = PaintingStyle.fill;
    paint16Fill.color = const Color(0xff2f2e41).withOpacity(1);
    canvas.drawPath(path_16, paint16Fill);

    final Paint paint17Fill = Paint()..style = PaintingStyle.fill;
    paint17Fill.color = const Color(0xffffb8b8).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.2220874, size.height * 0.3369919), size.width * 0.03330807, paint17Fill);

    final Path path_18 = Path();
    path_18.moveTo(size.width * 0.5245997, size.height * 1.003035);
    path_18.cubicTo(
      size.width * 0.5087244,
      size.height * 1.003035,
      size.width * 0.4924184,
      size.height * 0.9973789,
      size.width * 0.4789007,
      size.height * 0.9806553,
    );
    path_18.arcToPoint(
      Offset(size.width * 0.4769079, size.height * 0.9735788),
      radius: Radius.elliptical(size.width * 0.006172950, size.height * 0.008367408),
    );
    path_18.cubicTo(
      size.width * 0.4783547,
      size.height * 0.9559576,
      size.width * 0.4853731,
      size.height * 0.8649740,
      size.width * 0.4814206,
      size.height * 0.8041972,
    );
    path_18.arcToPoint(
      Offset(size.width * 0.4989901, size.height * 0.7429754),
      radius: Radius.elliptical(size.width * 0.05427191, size.height * 0.07356535),
    );
    path_18.arcToPoint(
      Offset(size.width * 0.5450474, size.height * 0.7248982),
      radius: Radius.elliptical(size.width * 0.05370042, size.height * 0.07279070),
    );
    path_18.lineTo(size.width * 0.5450477, size.height * 0.7248982);
    path_18.cubicTo(
      size.width * 0.5454626,
      size.height * 0.7249987,
      size.width * 0.5458771,
      size.height * 0.7251046,
      size.width * 0.5462923,
      size.height * 0.7252123,
    );
    path_18.cubicTo(
      size.width * 0.5729587,
      size.height * 0.7322080,
      size.width * 0.5914867,
      size.height * 0.7656607,
      size.width * 0.5893902,
      size.height * 0.8030268,
    );
    path_18.cubicTo(
      size.width * 0.5863310,
      size.height * 0.8575491,
      size.width * 0.5835886,
      size.height * 0.9312975,
      size.width * 0.5878947,
      size.height * 0.9730043,
    );
    path_18.arcToPoint(
      Offset(size.width * 0.5846199, size.height * 0.9815277),
      radius: Radius.elliptical(size.width * 0.006092599, size.height * 0.008258493),
    );
    path_18.cubicTo(
      size.width * 0.5748221,
      size.height * 0.9882380,
      size.width * 0.5502743,
      size.height * 1.003035,
      size.width * 0.5245997,
      size.height * 1.003035,
    );
    path_18.close();

    final Paint paint18Fill = Paint()..style = PaintingStyle.fill;
    paint18Fill.color = const Color(0xff6c63ff).withOpacity(1);
    canvas.drawPath(path_18, paint18Fill);

    final Path path_19 = Path();
    path_19.moveTo(size.width * 0.5680628, size.height * 0.8220181);
    path_19.arcToPoint(
      Offset(size.width * 0.5652021, size.height * 0.8157472),
      radius: Radius.elliptical(size.width * 0.006525287, size.height * 0.008845000),
    );
    path_19.lineTo(size.width * 0.5611441, size.height * 0.7716482);
    path_19.arcToPoint(
      Offset(size.width * 0.5960702, size.height * 0.7583245),
      radius: Radius.elliptical(size.width * 0.01814152, size.height * 0.02459075),
    );
    path_19.lineTo(size.width * 0.6094367, size.height * 0.7990619);
    path_19.arcToPoint(
      Offset(size.width * 0.6052192, size.height * 0.8111900),
      radius: Radius.elliptical(size.width * 0.006532339, size.height * 0.008854559),
    );
    path_19.lineTo(size.width * 0.5734351, size.height * 0.8231790);
    path_19.arcToPoint(
      Offset(size.width * 0.5680628, size.height * 0.8220181),
      radius: Radius.elliptical(size.width * 0.006524989, size.height * 0.008844596),
    );
    path_19.close();

    final Paint paint19Fill = Paint()..style = PaintingStyle.fill;
    paint19Fill.color = const Color(0xff6c63ff).withOpacity(1);
    canvas.drawPath(path_19, paint19Fill);

    final Path path_20 = Path();
    path_20.moveTo(size.width * 0.5241407, size.height * 0.7087092);
    path_20.arcToPoint(
      Offset(size.width * 0.5149228, size.height * 0.7064485),
      radius: Radius.elliptical(size.width * 0.02386517, size.height * 0.03234914),
    );
    path_20.cubicTo(
      size.width * 0.5136326,
      size.height * 0.7057746,
      size.width * 0.5122932,
      size.height * 0.7052206,
      size.width * 0.5110054,
      size.height * 0.7045462,
    );
    path_20.cubicTo(
      size.width * 0.4996320,
      size.height * 0.6985900,
      size.width * 0.4921400,
      size.height * 0.6821714,
      size.width * 0.4918716,
      size.height * 0.6656482,
    );
    path_20.cubicTo(
      size.width * 0.4916033,
      size.height * 0.6491251,
      size.width * 0.4979159,
      size.height * 0.6330878,
      size.width * 0.5072897,
      size.height * 0.6225189,
    );
    path_20.cubicTo(
      size.width * 0.5166635,
      size.height * 0.6119499,
      size.width * 0.5288048,
      size.height * 0.6065237,
      size.width * 0.5409623,
      size.height * 0.6052690,
    );
    path_20.cubicTo(
      size.width * 0.5540580,
      size.height * 0.6039174,
      size.width * 0.5688041,
      size.height * 0.6084190,
      size.width * 0.5761218,
      size.height * 0.6232021,
    );
    path_20.cubicTo(
      size.width * 0.5780697,
      size.height * 0.6271371,
      size.width * 0.5794320,
      size.height * 0.6319113,
      size.width * 0.5782778,
      size.height * 0.6366625,
    );
    path_20.arcToPoint(
      Offset(size.width * 0.5764873, size.height * 0.6403904),
      radius: Radius.elliptical(size.width * 0.006354360, size.height * 0.008613309),
    );
    path_20.cubicTo(
      size.width * 0.5732193,
      size.height * 0.6443316,
      size.width * 0.5699613,
      size.height * 0.6413682,
      size.width * 0.5666298,
      size.height * 0.6411064,
    );
    path_20.cubicTo(
      size.width * 0.5620508,
      size.height * 0.6407465,
      size.width * 0.5579380,
      size.height * 0.6457706,
      size.width * 0.5564598,
      size.height * 0.6516561,
    );
    path_20.cubicTo(
      size.width * 0.5549816,
      size.height * 0.6575417,
      size.width * 0.5556323,
      size.height * 0.6640212,
      size.width * 0.5568259,
      size.height * 0.6700243,
    );
    path_20.arcToPoint(
      Offset(size.width * 0.5585322, size.height * 0.6811932),
      radius: Radius.elliptical(size.width * 0.03385192, size.height * 0.04588614),
    );
    path_20.arcToPoint(
      Offset(size.width * 0.5550999, size.height * 0.6910802),
      radius: Radius.elliptical(size.width * 0.008283679, size.height * 0.01122849),
    );
    path_20.cubicTo(
      size.width * 0.5522386,
      size.height * 0.6934247,
      size.width * 0.5484809,
      size.height * 0.6920678,
      size.width * 0.5456179,
      size.height * 0.6897272,
    );
    path_20.cubicTo(
      size.width * 0.5427549,
      size.height * 0.6873865,
      size.width * 0.5402811,
      size.height * 0.6841321,
      size.width * 0.5371885,
      size.height * 0.6824097,
    );
    path_20.cubicTo(
      size.width * 0.5340959,
      size.height * 0.6806873,
      size.width * 0.5299410,
      size.height * 0.6810693,
      size.width * 0.5281410,
      size.height * 0.6848885,
    );
    path_20.arcToPoint(
      Offset(size.width * 0.5269972, size.height * 0.6893650),
      radius: Radius.elliptical(size.width * 0.01000692, size.height * 0.01356434),
      clockwise: false,
    );
    path_20.cubicTo(
      size.width * 0.5253835,
      size.height * 0.6993305,
      size.width * 0.5257544,
      size.height * 0.6987437,
      size.width * 0.5241407,
      size.height * 0.7087092,
    );
    path_20.close();

    final Paint paint20Fill = Paint()..style = PaintingStyle.fill;
    paint20Fill.color = const Color(0xff2f2e41).withOpacity(1);
    canvas.drawPath(path_20, paint20Fill);

    final Path path_21 = Path();
    path_21.moveTo(size.width * 0.9854963, size.height * 0.6470588);
    path_21.lineTo(size.width * 0.7739393, size.height * 0.6470588);
    path_21.arcToPoint(
      Offset(size.width * 0.7508850, size.height * 0.6158088),
      radius: Radius.elliptical(size.width * 0.02308029, size.height * 0.03128524),
    );
    path_21.lineTo(size.width * 0.7508850, size.height * 0.3823529);
    path_21.arcToPoint(
      Offset(size.width * 0.7739393, size.height * 0.3511029),
      radius: Radius.elliptical(size.width * 0.02308029, size.height * 0.03128524),
    );
    path_21.lineTo(size.width * 0.9854963, size.height * 0.3511029);
    path_21.arcToPoint(
      Offset(size.width * 1.008551, size.height * 0.3823529),
      radius: Radius.elliptical(size.width * 0.02308029, size.height * 0.03128524),
    );
    path_21.lineTo(size.width * 1.008551, size.height * 0.6158088);
    path_21.arcToPoint(
      Offset(size.width * 0.9854963, size.height * 0.6470588),
      radius: Radius.elliptical(size.width * 0.02308029, size.height * 0.03128524),
    );
    path_21.close();
    path_21.moveTo(size.width * 0.7739393, size.height * 0.3547794);
    path_21.arcToPoint(
      Offset(size.width * 0.7535972, size.height * 0.3823529),
      radius: Radius.elliptical(size.width * 0.02036508, size.height * 0.02760478),
      clockwise: false,
    );
    path_21.lineTo(size.width * 0.7535972, size.height * 0.6158088);
    path_21.arcToPoint(
      Offset(size.width * 0.7739393, size.height * 0.6433824),
      radius: Radius.elliptical(size.width * 0.02036508, size.height * 0.02760478),
      clockwise: false,
    );
    path_21.lineTo(size.width * 0.9854963, size.height * 0.6433824);
    path_21.arcToPoint(
      Offset(size.width * 1.005838, size.height * 0.6158088),
      radius: Radius.elliptical(size.width * 0.02036508, size.height * 0.02760478),
      clockwise: false,
    );
    path_21.lineTo(size.width * 1.005838, size.height * 0.3823529);
    path_21.arcToPoint(
      Offset(size.width * 0.9854963, size.height * 0.3547794),
      radius: Radius.elliptical(size.width * 0.02036508, size.height * 0.02760478),
      clockwise: false,
    );
    path_21.close();

    final Paint paint21Fill = Paint()..style = PaintingStyle.fill;
    paint21Fill.color = const Color(0xff3f3d56).withOpacity(1);
    canvas.drawPath(path_21, paint21Fill);

    final Path path_22 = Path();
    path_22.moveTo(size.width * 0.9614500, size.height * 0.4212096);
    path_22.lineTo(size.width * 0.8546799, size.height * 0.4212096);
    path_22.arcToPoint(
      Offset(size.width * 0.8509158, size.height * 0.4166341),
      radius: Radius.elliptical(size.width * 0.003703442, size.height * 0.005020000),
    );
    path_22.arcToPoint(
      Offset(size.width * 0.8544781, size.height * 0.4115386),
      radius: Radius.elliptical(size.width * 0.003567503, size.height * 0.004835735),
    );
    path_22.lineTo(size.width * 0.9631634, size.height * 0.4115386);
    path_22.cubicTo(
      size.width * 0.9667439,
      size.height * 0.4158033,
      size.width * 0.9645620,
      size.height * 0.4212096,
      size.width * 0.9614487,
      size.height * 0.4212096,
    );
    path_22.close();

    final Paint paint22Fill = Paint()..style = PaintingStyle.fill;
    paint22Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_22, paint22Fill);

    final Path path_23 = Path();
    path_23.moveTo(size.width * 0.9614500, size.height * 0.4465956);
    path_23.lineTo(size.width * 0.8546799, size.height * 0.4465956);
    path_23.arcToPoint(
      Offset(size.width * 0.8509158, size.height * 0.4420201),
      radius: Radius.elliptical(size.width * 0.003703442, size.height * 0.005020000),
    );
    path_23.arcToPoint(
      Offset(size.width * 0.8544781, size.height * 0.4369247),
      radius: Radius.elliptical(size.width * 0.003567503, size.height * 0.004835735),
    );
    path_23.lineTo(size.width * 0.9631634, size.height * 0.4369247);
    path_23.cubicTo(
      size.width * 0.9667439,
      size.height * 0.4411894,
      size.width * 0.9645620,
      size.height * 0.4465956,
      size.width * 0.9614487,
      size.height * 0.4465956,
    );
    path_23.close();

    final Paint paint23Fill = Paint()..style = PaintingStyle.fill;
    paint23Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_23, paint23Fill);

    final Path path_24 = Path();
    path_24.moveTo(size.width * 0.8315987, size.height * 0.4610496);
    path_24.lineTo(size.width * 0.7990135, size.height * 0.4610496);
    path_24.arcToPoint(
      Offset(size.width * 0.7950007, size.height * 0.4556103),
      radius: Radius.elliptical(size.width * 0.004016872, size.height * 0.005444853),
    );
    path_24.lineTo(size.width * 0.7950007, size.height * 0.4034871);
    path_24.arcToPoint(
      Offset(size.width * 0.7990135, size.height * 0.3980478),
      radius: Radius.elliptical(size.width * 0.004016872, size.height * 0.005444853),
    );
    path_24.lineTo(size.width * 0.8315987, size.height * 0.3980478);
    path_24.arcToPoint(
      Offset(size.width * 0.8356115, size.height * 0.4034871),
      radius: Radius.elliptical(size.width * 0.004018228, size.height * 0.005446691),
    );
    path_24.lineTo(size.width * 0.8356115, size.height * 0.4556103);
    path_24.arcToPoint(
      Offset(size.width * 0.8315987, size.height * 0.4610496),
      radius: Radius.elliptical(size.width * 0.004016872, size.height * 0.005444853),
    );
    path_24.close();

    final Paint paint24Fill = Paint()..style = PaintingStyle.fill;
    paint24Fill.color = const Color(0xff3f3d56).withOpacity(1);
    canvas.drawPath(path_24, paint24Fill);

    final Path path_25 = Path();
    path_25.moveTo(size.width * 0.9611394, size.height * 0.4985735);
    path_25.lineTo(size.width * 0.7981887, size.height * 0.4985735);
    path_25.arcToPoint(
      Offset(size.width * 0.7944246, size.height * 0.4939982),
      radius: Radius.elliptical(size.width * 0.003703428, size.height * 0.005019982),
    );
    path_25.arcToPoint(
      Offset(size.width * 0.7979869, size.height * 0.4889027),
      radius: Radius.elliptical(size.width * 0.003567462, size.height * 0.004835680),
    );
    path_25.lineTo(size.width * 0.9628542, size.height * 0.4889027);
    path_25.cubicTo(
      size.width * 0.9664347,
      size.height * 0.4931674,
      size.width * 0.9642528,
      size.height * 0.4985736,
      size.width * 0.9611394,
      size.height * 0.4985736,
    );
    path_25.close();

    final Paint paint25Fill = Paint()..style = PaintingStyle.fill;
    paint25Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_25, paint25Fill);

    final Path path_26 = Path();
    path_26.moveTo(size.width * 0.9611394, size.height * 0.5239669);
    path_26.lineTo(size.width * 0.7981887, size.height * 0.5239669);
    path_26.arcToPoint(
      Offset(size.width * 0.7944246, size.height * 0.5193915),
      radius: Radius.elliptical(size.width * 0.003703428, size.height * 0.005019982),
    );
    path_26.arcToPoint(
      Offset(size.width * 0.7979869, size.height * 0.5142960),
      radius: Radius.elliptical(size.width * 0.003567462, size.height * 0.004835680),
    );
    path_26.lineTo(size.width * 0.9628542, size.height * 0.5142960);
    path_26.cubicTo(
      size.width * 0.9664347,
      size.height * 0.5185607,
      size.width * 0.9642528,
      size.height * 0.5239669,
      size.width * 0.9611394,
      size.height * 0.5239669,
    );
    path_26.close();

    final Paint paint26Fill = Paint()..style = PaintingStyle.fill;
    paint26Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_26, paint26Fill);

    final Path path_27 = Path();
    path_27.moveTo(size.width * 0.9611394, size.height * 0.5493438);
    path_27.lineTo(size.width * 0.7981887, size.height * 0.5493438);
    path_27.arcToPoint(
      Offset(size.width * 0.7944246, size.height * 0.5447683),
      radius: Radius.elliptical(size.width * 0.003703415, size.height * 0.005019963),
    );
    path_27.arcToPoint(
      Offset(size.width * 0.7979869, size.height * 0.5396728),
      radius: Radius.elliptical(size.width * 0.003567462, size.height * 0.004835680),
    );
    path_27.lineTo(size.width * 0.9628542, size.height * 0.5396728);
    path_27.cubicTo(
      size.width * 0.9664347,
      size.height * 0.5439375,
      size.width * 0.9642528,
      size.height * 0.5493438,
      size.width * 0.9611394,
      size.height * 0.5493438,
    );
    path_27.close();

    final Paint paint27Fill = Paint()..style = PaintingStyle.fill;
    paint27Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_27, paint27Fill);

    final Path path_28 = Path();
    path_28.moveTo(size.width * 0.9611394, size.height * 0.5747353);
    path_28.lineTo(size.width * 0.7981887, size.height * 0.5747353);
    path_28.arcToPoint(
      Offset(size.width * 0.7944246, size.height * 0.5701599),
      radius: Radius.elliptical(size.width * 0.003703415, size.height * 0.005019963),
    );
    path_28.arcToPoint(
      Offset(size.width * 0.7979869, size.height * 0.5650644),
      radius: Radius.elliptical(size.width * 0.003567462, size.height * 0.004835680),
    );
    path_28.lineTo(size.width * 0.9628542, size.height * 0.5650644);
    path_28.cubicTo(
      size.width * 0.9664347,
      size.height * 0.5693292,
      size.width * 0.9642528,
      size.height * 0.5747354,
      size.width * 0.9611394,
      size.height * 0.5747354,
    );
    path_28.close();

    final Paint paint28Fill = Paint()..style = PaintingStyle.fill;
    paint28Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_28, paint28Fill);

    final Path path_29 = Path();
    path_29.moveTo(size.width * 0.9611394, size.height * 0.6001140);
    path_29.lineTo(size.width * 0.7981887, size.height * 0.6001140);
    path_29.arcToPoint(
      Offset(size.width * 0.7944246, size.height * 0.5955385),
      radius: Radius.elliptical(size.width * 0.003703428, size.height * 0.005019982),
    );
    path_29.arcToPoint(
      Offset(size.width * 0.7979869, size.height * 0.5904430),
      radius: Radius.elliptical(size.width * 0.003567476, size.height * 0.004835699),
    );
    path_29.lineTo(size.width * 0.9628542, size.height * 0.5904430);
    path_29.cubicTo(
      size.width * 0.9664347,
      size.height * 0.5947077,
      size.width * 0.9642528,
      size.height * 0.6001140,
      size.width * 0.9611394,
      size.height * 0.6001140,
    );
    path_29.close();

    final Paint paint29Fill = Paint()..style = PaintingStyle.fill;
    paint29Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_29, paint29Fill);

    final Path path_30 = Path();
    path_30.moveTo(size.width * 0.9393877, size.height * 0.3272059);
    path_30.arcToPoint(
      Offset(size.width * 0.9461684, size.height * 0.3363971),
      radius: Radius.elliptical(size.width * 0.006788445, size.height * 0.009201710),
    );
    path_30.lineTo(size.width * 0.9461684, size.height * 0.3658088);
    path_30.arcToPoint(
      Offset(size.width * 0.9393877, size.height * 0.3750000),
      radius: Radius.elliptical(size.width * 0.006788445, size.height * 0.009201710),
    );
    path_30.lineTo(size.width * 0.8200478, size.height * 0.3750000);
    path_30.arcToPoint(
      Offset(size.width * 0.8132672, size.height * 0.3658088),
      radius: Radius.elliptical(size.width * 0.006788445, size.height * 0.009201710),
    );
    path_30.lineTo(size.width * 0.8132672, size.height * 0.3363971);
    path_30.arcToPoint(
      Offset(size.width * 0.8200478, size.height * 0.3272059),
      radius: Radius.elliptical(size.width * 0.006788445, size.height * 0.009201710),
    );

    final Paint paint30Fill = Paint()..style = PaintingStyle.fill;
    paint30Fill.color = const Color(0xff6c63ff).withOpacity(1);
    canvas.drawPath(path_30, paint30Fill);

    final Path path_31 = Path();
    path_31.moveTo(size.width * 1.290627, size.height * 0.9356618);
    path_31.lineTo(size.width * 1.079070, size.height * 0.9356618);
    path_31.arcToPoint(
      Offset(size.width * 1.056015, size.height * 0.9044118),
      radius: Radius.elliptical(size.width * 0.02308029, size.height * 0.03128524),
    );
    path_31.lineTo(size.width * 1.056015, size.height * 0.6709559);
    path_31.arcToPoint(
      Offset(size.width * 1.079070, size.height * 0.6397059),
      radius: Radius.elliptical(size.width * 0.02308029, size.height * 0.03128524),
    );
    path_31.lineTo(size.width * 1.290627, size.height * 0.6397059);
    path_31.arcToPoint(
      Offset(size.width * 1.313681, size.height * 0.6709559),
      radius: Radius.elliptical(size.width * 0.02308029, size.height * 0.03128524),
    );
    path_31.lineTo(size.width * 1.313681, size.height * 0.9044118);
    path_31.arcToPoint(
      Offset(size.width * 1.290627, size.height * 0.9356618),
      radius: Radius.elliptical(size.width * 0.02308029, size.height * 0.03128524),
    );
    path_31.close();
    path_31.moveTo(size.width * 1.079070, size.height * 0.6433824);
    path_31.arcToPoint(
      Offset(size.width * 1.058728, size.height * 0.6709559),
      radius: Radius.elliptical(size.width * 0.02036508, size.height * 0.02760478),
      clockwise: false,
    );
    path_31.lineTo(size.width * 1.058728, size.height * 0.9044118);
    path_31.arcToPoint(
      Offset(size.width * 1.079070, size.height * 0.9319853),
      radius: Radius.elliptical(size.width * 0.02036508, size.height * 0.02760478),
      clockwise: false,
    );
    path_31.lineTo(size.width * 1.290627, size.height * 0.9319853);
    path_31.arcToPoint(
      Offset(size.width * 1.310969, size.height * 0.9044118),
      radius: Radius.elliptical(size.width * 0.02036508, size.height * 0.02760478),
      clockwise: false,
    );
    path_31.lineTo(size.width * 1.310969, size.height * 0.6709559);
    path_31.arcToPoint(
      Offset(size.width * 1.290627, size.height * 0.6433824),
      radius: Radius.elliptical(size.width * 0.02036508, size.height * 0.02760478),
      clockwise: false,
    );
    path_31.close();

    final Paint paint31Fill = Paint()..style = PaintingStyle.fill;
    paint31Fill.color = const Color(0xff3f3d56).withOpacity(1);
    canvas.drawPath(path_31, paint31Fill);

    final Path path_32 = Path();
    path_32.moveTo(size.width * 1.266580, size.height * 0.7098125);
    path_32.lineTo(size.width * 1.159810, size.height * 0.7098125);
    path_32.arcToPoint(
      Offset(size.width * 1.156046, size.height * 0.7052370),
      radius: Radius.elliptical(size.width * 0.003703442, size.height * 0.005020000),
    );
    path_32.arcToPoint(
      Offset(size.width * 1.159608, size.height * 0.7001416),
      radius: Radius.elliptical(size.width * 0.003567503, size.height * 0.004835735),
    );
    path_32.lineTo(size.width * 1.268294, size.height * 0.7001416);
    path_32.cubicTo(
      size.width * 1.271874,
      size.height * 0.7044063,
      size.width * 1.269692,
      size.height * 0.7098125,
      size.width * 1.266579,
      size.height * 0.7098125,
    );
    path_32.close();

    final Paint paint32Fill = Paint()..style = PaintingStyle.fill;
    paint32Fill.color = const Color(0xff3f3d56).withOpacity(1);
    canvas.drawPath(path_32, paint32Fill);

    final Path path_33 = Path();
    path_33.moveTo(size.width * 1.266580, size.height * 0.7351985);
    path_33.lineTo(size.width * 1.159810, size.height * 0.7351985);
    path_33.arcToPoint(
      Offset(size.width * 1.156046, size.height * 0.7306231),
      radius: Radius.elliptical(size.width * 0.003703442, size.height * 0.005020000),
    );
    path_33.arcToPoint(
      Offset(size.width * 1.159608, size.height * 0.7255276),
      radius: Radius.elliptical(size.width * 0.003567503, size.height * 0.004835735),
    );
    path_33.lineTo(size.width * 1.268294, size.height * 0.7255276);
    path_33.cubicTo(
      size.width * 1.271874,
      size.height * 0.7297923,
      size.width * 1.269692,
      size.height * 0.7351985,
      size.width * 1.266579,
      size.height * 0.7351985,
    );
    path_33.close();

    final Paint paint33Fill = Paint()..style = PaintingStyle.fill;
    paint33Fill.color = const Color(0xff3f3d56).withOpacity(1);
    canvas.drawPath(path_33, paint33Fill);

    final Path path_34 = Path();
    path_34.moveTo(size.width * 1.136729, size.height * 0.7496526);
    path_34.lineTo(size.width * 1.104144, size.height * 0.7496526);
    path_34.arcToPoint(
      Offset(size.width * 1.100131, size.height * 0.7442132),
      radius: Radius.elliptical(size.width * 0.004016872, size.height * 0.005444853),
    );
    path_34.lineTo(size.width * 1.100131, size.height * 0.6920901);
    path_34.arcToPoint(
      Offset(size.width * 1.104144, size.height * 0.6866507),
      radius: Radius.elliptical(size.width * 0.004016872, size.height * 0.005444853),
    );
    path_34.lineTo(size.width * 1.136729, size.height * 0.6866507);
    path_34.arcToPoint(
      Offset(size.width * 1.140742, size.height * 0.6920901),
      radius: Radius.elliptical(size.width * 0.004018228, size.height * 0.005446691),
    );
    path_34.lineTo(size.width * 1.140742, size.height * 0.7442132);
    path_34.arcToPoint(
      Offset(size.width * 1.136729, size.height * 0.7496526),
      radius: Radius.elliptical(size.width * 0.004016872, size.height * 0.005444853),
    );
    path_34.close();

    final Paint paint34Fill = Paint()..style = PaintingStyle.fill;
    paint34Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_34, paint34Fill);

    final Path path_35 = Path();
    path_35.moveTo(size.width * 1.265562, size.height * 0.8911967);
    path_35.lineTo(size.width * 1.232977, size.height * 0.8911967);
    path_35.arcToPoint(
      Offset(size.width * 1.228964, size.height * 0.8857574),
      radius: Radius.elliptical(size.width * 0.004016872, size.height * 0.005444853),
    );
    path_35.lineTo(size.width * 1.228964, size.height * 0.8556930);
    path_35.arcToPoint(
      Offset(size.width * 1.232977, size.height * 0.8502537),
      radius: Radius.elliptical(size.width * 0.004016872, size.height * 0.005444853),
    );
    path_35.lineTo(size.width * 1.265562, size.height * 0.8502537);
    path_35.arcToPoint(
      Offset(size.width * 1.269575, size.height * 0.8556930),
      radius: Radius.elliptical(size.width * 0.004018228, size.height * 0.005446691),
    );
    path_35.lineTo(size.width * 1.269575, size.height * 0.8857574);
    path_35.arcToPoint(
      Offset(size.width * 1.265562, size.height * 0.8911967),
      radius: Radius.elliptical(size.width * 0.004016872, size.height * 0.005444853),
    );
    path_35.close();

    final Paint paint35Fill = Paint()..style = PaintingStyle.fill;
    paint35Fill.color = const Color(0xff3f3d56).withOpacity(1);
    canvas.drawPath(path_35, paint35Fill);

    final Path path_36 = Path();
    path_36.moveTo(size.width * 1.266270, size.height * 0.7871765);
    path_36.lineTo(size.width * 1.103319, size.height * 0.7871765);
    path_36.arcToPoint(
      Offset(size.width * 1.099555, size.height * 0.7826011),
      radius: Radius.elliptical(size.width * 0.003703428, size.height * 0.005019982),
    );
    path_36.arcToPoint(
      Offset(size.width * 1.103117, size.height * 0.7775056),
      radius: Radius.elliptical(size.width * 0.003567462, size.height * 0.004835680),
    );
    path_36.lineTo(size.width * 1.267985, size.height * 0.7775056);
    path_36.cubicTo(
      size.width * 1.271565,
      size.height * 0.7817703,
      size.width * 1.269383,
      size.height * 0.7871766,
      size.width * 1.266270,
      size.height * 0.7871766,
    );
    path_36.close();

    final Paint paint36Fill = Paint()..style = PaintingStyle.fill;
    paint36Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_36, paint36Fill);

    final Path path_37 = Path();
    path_37.moveTo(size.width * 1.266270, size.height * 0.8125699);
    path_37.lineTo(size.width * 1.103319, size.height * 0.8125699);
    path_37.arcToPoint(
      Offset(size.width * 1.099555, size.height * 0.8079944),
      radius: Radius.elliptical(size.width * 0.003703428, size.height * 0.005019982),
    );
    path_37.arcToPoint(
      Offset(size.width * 1.103117, size.height * 0.8028989),
      radius: Radius.elliptical(size.width * 0.003567462, size.height * 0.004835680),
    );
    path_37.lineTo(size.width * 1.267985, size.height * 0.8028989);
    path_37.cubicTo(
      size.width * 1.271565,
      size.height * 0.8071636,
      size.width * 1.269383,
      size.height * 0.8125699,
      size.width * 1.266270,
      size.height * 0.8125699,
    );
    path_37.close();

    final Paint paint37Fill = Paint()..style = PaintingStyle.fill;
    paint37Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_37, paint37Fill);

    final Path path_38 = Path();
    path_38.moveTo(size.width * 1.266270, size.height * 0.8379467);
    path_38.lineTo(size.width * 1.103319, size.height * 0.8379467);
    path_38.arcToPoint(
      Offset(size.width * 1.099555, size.height * 0.8333712),
      radius: Radius.elliptical(size.width * 0.003703415, size.height * 0.005019963),
    );
    path_38.arcToPoint(
      Offset(size.width * 1.103117, size.height * 0.8282758),
      radius: Radius.elliptical(size.width * 0.003567462, size.height * 0.004835680),
    );
    path_38.lineTo(size.width * 1.267985, size.height * 0.8282758);
    path_38.cubicTo(
      size.width * 1.271565,
      size.height * 0.8325405,
      size.width * 1.269383,
      size.height * 0.8379467,
      size.width * 1.266270,
      size.height * 0.8379467,
    );
    path_38.close();

    final Paint paint38Fill = Paint()..style = PaintingStyle.fill;
    paint38Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_38, paint38Fill);

    final Path path_39 = Path();
    path_39.moveTo(size.width * 1.180833, size.height * 0.8633382);
    path_39.lineTo(size.width * 1.103319, size.height * 0.8633382);
    path_39.arcToPoint(
      Offset(size.width * 1.099555, size.height * 0.8587629),
      radius: Radius.elliptical(size.width * 0.003703415, size.height * 0.005019963),
    );
    path_39.arcToPoint(
      Offset(size.width * 1.103117, size.height * 0.8536674),
      radius: Radius.elliptical(size.width * 0.003567462, size.height * 0.004835680),
    );
    path_39.lineTo(size.width * 1.182548, size.height * 0.8536674);
    path_39.cubicTo(
      size.width * 1.186129,
      size.height * 0.8579321,
      size.width * 1.183947,
      size.height * 0.8633383,
      size.width * 1.180833,
      size.height * 0.8633383,
    );
    path_39.close();

    final Paint paint39Fill = Paint()..style = PaintingStyle.fill;
    paint39Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_39, paint39Fill);

    final Path path_40 = Path();
    path_40.moveTo(size.width * 1.180833, size.height * 0.8887169);
    path_40.lineTo(size.width * 1.103319, size.height * 0.8887169);
    path_40.arcToPoint(
      Offset(size.width * 1.099555, size.height * 0.8841415),
      radius: Radius.elliptical(size.width * 0.003703428, size.height * 0.005019982),
    );
    path_40.arcToPoint(
      Offset(size.width * 1.103117, size.height * 0.8790460),
      radius: Radius.elliptical(size.width * 0.003567476, size.height * 0.004835699),
    );
    path_40.lineTo(size.width * 1.182548, size.height * 0.8790460);
    path_40.cubicTo(
      size.width * 1.186129,
      size.height * 0.8833107,
      size.width * 1.183947,
      size.height * 0.8887169,
      size.width * 1.180833,
      size.height * 0.8887169,
    );
    path_40.close();

    final Paint paint40Fill = Paint()..style = PaintingStyle.fill;
    paint40Fill.color = const Color(0xffcccccc).withOpacity(1);
    canvas.drawPath(path_40, paint40Fill);

    final Path path_41 = Path();
    path_41.moveTo(size.width * 1.244518, size.height * 0.6636029);
    path_41.lineTo(size.width * 1.125178, size.height * 0.6636029);
    path_41.arcToPoint(
      Offset(size.width * 1.118398, size.height * 0.6544118),
      radius: Radius.elliptical(size.width * 0.006788445, size.height * 0.009201710),
    );
    path_41.lineTo(size.width * 1.118398, size.height * 0.6250000);
    path_41.arcToPoint(
      Offset(size.width * 1.125178, size.height * 0.6158088),
      radius: Radius.elliptical(size.width * 0.006788445, size.height * 0.009201710),
    );
    path_41.lineTo(size.width * 1.244518, size.height * 0.6158088);
    path_41.arcToPoint(
      Offset(size.width * 1.251299, size.height * 0.6250000),
      radius: Radius.elliptical(size.width * 0.006788445, size.height * 0.009201710),
    );
    path_41.lineTo(size.width * 1.251299, size.height * 0.6544118);
    path_41.arcToPoint(
      Offset(size.width * 1.244518, size.height * 0.6636029),
      radius: Radius.elliptical(size.width * 0.006788445, size.height * 0.009201710),
    );
    path_41.close();

    final Paint paint41Fill = Paint()..style = PaintingStyle.fill;
    paint41Fill.color = const Color(0xff6c63ff).withOpacity(1);
    canvas.drawPath(path_41, paint41Fill);

    final Path path_42 = Path();
    path_42.moveTo(size.width * 0.8317245, size.height * 1.327206);
    path_42.lineTo(size.width * 0.3150371, size.height * 1.327206);
    path_42.arcToPoint(
      Offset(size.width * 0.3150371, size.height * 1.323529),
      radius: Radius.elliptical(size.width * 0.001356135, size.height * 0.001838235),
    );
    path_42.lineTo(size.width * 0.8317245, size.height * 1.323529);
    path_42.arcToPoint(
      Offset(size.width * 0.8317245, size.height * 1.327206),
      radius: Radius.elliptical(size.width * 0.001356135, size.height * 0.001838235),
    );
    path_42.close();

    final Paint paint42Fill = Paint()..style = PaintingStyle.fill;
    paint42Fill.color = const Color(0xff3f3d56).withOpacity(1);
    canvas.drawPath(path_42, paint42Fill);

    final Paint paint43Fill = Paint()..style = PaintingStyle.fill;
    paint43Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(
      Offset(size.width * 0.1312247, size.height * 0.04287555),
      size.width * 0.008769975,
      paint43Fill,
    );

    final Paint paint44Fill = Paint()..style = PaintingStyle.fill;
    paint44Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(
      Offset(size.width * 0.1312247, size.height * 0.09025294),
      size.width * 0.008769975,
      paint44Fill,
    );

    final Paint paint45Fill = Paint()..style = PaintingStyle.fill;
    paint45Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.1312247, size.height * 0.1376303), size.width * 0.008769975, paint45Fill);

    final Paint paint46Fill = Paint()..style = PaintingStyle.fill;
    paint46Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.1312247, size.height * 0.1850077), size.width * 0.008769975, paint46Fill);

    final Paint paint47Fill = Paint()..style = PaintingStyle.fill;
    paint47Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(
      Offset(size.width * 0.1678404, size.height * 0.04287555),
      size.width * 0.008769975,
      paint47Fill,
    );

    final Paint paint48Fill = Paint()..style = PaintingStyle.fill;
    paint48Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(
      Offset(size.width * 0.1678404, size.height * 0.09025294),
      size.width * 0.008769975,
      paint48Fill,
    );

    final Paint paint49Fill = Paint()..style = PaintingStyle.fill;
    paint49Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.1678404, size.height * 0.1376303), size.width * 0.008769975, paint49Fill);

    final Paint paint50Fill = Paint()..style = PaintingStyle.fill;
    paint50Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.1678404, size.height * 0.1850077), size.width * 0.008769975, paint50Fill);

    final Paint paint51Fill = Paint()..style = PaintingStyle.fill;
    paint51Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(
      Offset(size.width * 0.2044560, size.height * 0.04287555),
      size.width * 0.008769975,
      paint51Fill,
    );

    final Paint paint52Fill = Paint()..style = PaintingStyle.fill;
    paint52Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(
      Offset(size.width * 0.2044560, size.height * 0.09025294),
      size.width * 0.008769975,
      paint52Fill,
    );

    final Paint paint53Fill = Paint()..style = PaintingStyle.fill;
    paint53Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.2044560, size.height * 0.1376303), size.width * 0.008769975, paint53Fill);

    final Paint paint54Fill = Paint()..style = PaintingStyle.fill;
    paint54Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.2044560, size.height * 0.1850077), size.width * 0.008769975, paint54Fill);

    final Paint paint55Fill = Paint()..style = PaintingStyle.fill;
    paint55Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(
      Offset(size.width * 0.2410717, size.height * 0.04287555),
      size.width * 0.008769975,
      paint55Fill,
    );

    final Paint paint56Fill = Paint()..style = PaintingStyle.fill;
    paint56Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(
      Offset(size.width * 0.2410717, size.height * 0.09025294),
      size.width * 0.008769975,
      paint56Fill,
    );

    final Paint paint57Fill = Paint()..style = PaintingStyle.fill;
    paint57Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.2410717, size.height * 0.1376303), size.width * 0.008769975, paint57Fill);

    final Paint paint58Fill = Paint()..style = PaintingStyle.fill;
    paint58Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.2410717, size.height * 0.1850077), size.width * 0.008769975, paint58Fill);

    final Paint paint59Fill = Paint()..style = PaintingStyle.fill;
    paint59Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(
      Offset(size.width * 0.2776873, size.height * 0.04287555),
      size.width * 0.008769975,
      paint59Fill,
    );

    final Paint paint60Fill = Paint()..style = PaintingStyle.fill;
    paint60Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(
      Offset(size.width * 0.2776873, size.height * 0.09025294),
      size.width * 0.008769975,
      paint60Fill,
    );

    final Paint paint61Fill = Paint()..style = PaintingStyle.fill;
    paint61Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.2776873, size.height * 0.1376303), size.width * 0.008769975, paint61Fill);

    final Paint paint62Fill = Paint()..style = PaintingStyle.fill;
    paint62Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.2776873, size.height * 0.1850077), size.width * 0.008769975, paint62Fill);

    final Paint paint63Fill = Paint()..style = PaintingStyle.fill;
    paint63Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(
      Offset(size.width * 0.3143030, size.height * 0.04287555),
      size.width * 0.008769975,
      paint63Fill,
    );

    final Paint paint64Fill = Paint()..style = PaintingStyle.fill;
    paint64Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(
      Offset(size.width * 0.3143030, size.height * 0.09025294),
      size.width * 0.008769975,
      paint64Fill,
    );

    final Paint paint65Fill = Paint()..style = PaintingStyle.fill;
    paint65Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.3143030, size.height * 0.1376303), size.width * 0.008769975, paint65Fill);

    final Paint paint66Fill = Paint()..style = PaintingStyle.fill;
    paint66Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.3143030, size.height * 0.1850077), size.width * 0.008769975, paint66Fill);

    final Paint paint67Fill = Paint()..style = PaintingStyle.fill;
    paint67Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.8160729, size.height * 0.7009638), size.width * 0.008769975, paint67Fill);

    final Paint paint68Fill = Paint()..style = PaintingStyle.fill;
    paint68Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.8160729, size.height * 0.7483412), size.width * 0.008769975, paint68Fill);

    final Paint paint69Fill = Paint()..style = PaintingStyle.fill;
    paint69Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.8160729, size.height * 0.7957186), size.width * 0.008769975, paint69Fill);

    final Paint paint70Fill = Paint()..style = PaintingStyle.fill;
    paint70Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.8526885, size.height * 0.7009638), size.width * 0.008769975, paint70Fill);

    final Paint paint71Fill = Paint()..style = PaintingStyle.fill;
    paint71Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.8526885, size.height * 0.7483412), size.width * 0.008769975, paint71Fill);

    final Paint paint72Fill = Paint()..style = PaintingStyle.fill;
    paint72Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.8526885, size.height * 0.7957186), size.width * 0.008769975, paint72Fill);

    final Paint paint73Fill = Paint()..style = PaintingStyle.fill;
    paint73Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.8893042, size.height * 0.7009638), size.width * 0.008769975, paint73Fill);

    final Paint paint74Fill = Paint()..style = PaintingStyle.fill;
    paint74Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.8893042, size.height * 0.7483412), size.width * 0.008769975, paint74Fill);

    final Paint paint75Fill = Paint()..style = PaintingStyle.fill;
    paint75Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.8893042, size.height * 0.7957186), size.width * 0.008769975, paint75Fill);

    final Paint paint76Fill = Paint()..style = PaintingStyle.fill;
    paint76Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.9259198, size.height * 0.7009638), size.width * 0.008769975, paint76Fill);

    final Paint paint77Fill = Paint()..style = PaintingStyle.fill;
    paint77Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.9259198, size.height * 0.7483412), size.width * 0.008769975, paint77Fill);

    final Paint paint78Fill = Paint()..style = PaintingStyle.fill;
    paint78Fill.color = const Color(0xfff2f2f2).withOpacity(1);
    canvas.drawCircle(Offset(size.width * 0.9259198, size.height * 0.7957186), size.width * 0.008769975, paint78Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
