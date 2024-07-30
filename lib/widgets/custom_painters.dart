import 'dart:math';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:syncfusion_flutter_core/theme.dart';
import '../config.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(16.3234, 0);
    path_0.cubicTo(11.7823, 0.802657, 8.46616, 2.24957, 5.85786, 4.85786);
    path_0.cubicTo(0, 10.7157, 0, 20.1438, 0, 39);
    path_0.lineTo(0, 215);
    path_0.cubicTo(0, 233.856, 0, 243.284, 5.85786, 249.142);
    path_0.cubicTo(11.7157, 255, 21.1438, 255, 40, 255);
    path_0.lineTo(295, 255);
    path_0.cubicTo(313.856, 255, 323.284, 255, 329.142, 249.142);
    path_0.cubicTo(335, 243.284, 335, 233.856, 335, 215);
    path_0.lineTo(335, 39);
    path_0.cubicTo(335, 20.1438, 335, 10.7157, 329.142, 4.85786);
    path_0.cubicTo(326.534, 2.24957, 323.218, 0.802657, 318.677, 0);
    path_0.lineTo(234.004, 0);
    path_0.cubicTo(222.779, 0, 211.878, 5.7477, 200.975, 11.4966);
    path_0.cubicTo(190.259, 17.1467, 179.542, 22.798, 168.511, 22.9954);
    path_0.cubicTo(168.341, 22.9985, 168.171, 23, 168, 23);
    path_0.cubicTo(167.829, 23, 167.659, 22.9985, 167.489, 22.9954);
    path_0.cubicTo(156.458, 22.798, 145.741, 17.1467, 135.025, 11.4966);
    path_0.cubicTo(124.122, 5.7477, 113.221, 0, 101.996, 0);
    path_0.lineTo(16.3234, 0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff00162E).withOpacity(0.04);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyClipper extends CustomClipper<Path> {
  final double space;

  MyClipper(this.space);

  @override
  Path getClip(Size size) {
    final path = Path();
    final halfWidth = size.width / 2;
    final halfSpace = space / 2;
    final curve = space / 6;
    final height = halfSpace / 1.4;
    path.lineTo(halfWidth - halfSpace, 0);
    path.cubicTo(halfWidth - halfSpace, 0, halfWidth - halfSpace + curve,
        height, halfWidth, height);

    path.cubicTo(halfWidth, height, halfWidth + halfSpace - curve, height,
        halfWidth + halfSpace, 0);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class CommonContainer extends CustomClipper<Path> {
  CommonContainer({required this.holeRadius});

  final double holeRadius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2 - holeRadius - 10, 0.0)
      ..quadraticBezierTo(
          size.width / 2 - holeRadius, 0.0, size.width / 2 - holeRadius, 10.0)
      ..arcToPoint(
        Offset(size.width / 2 + holeRadius, 0.0),
        clockwise: false,
        radius: const Radius.circular(2),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CommonContainer oldClipper) => true;
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xffE8E9EA);
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: 310,
        width: 305,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MyPainterWhite extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: 310,
        width: 305,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MyPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xffE8E9EA);
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: 290,
        width: 290,
      ),
      pi,
      pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

//Copy this CustomPainter code to the Bottom of the File
class CouponPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.7622951, 0);
    path_0.cubicTo(
        size.width * 0.7622951,
        size.height * 0.03944886,
        size.width * 0.7531189,
        size.height * 0.07142857,
        size.width * 0.7418033,
        size.height * 0.07142857);
    path_0.cubicTo(
        size.width * 0.7304877,
        size.height * 0.07142857,
        size.width * 0.7213115,
        size.height * 0.03944886,
        size.width * 0.7213115,
        0);
    path_0.lineTo(size.width * 0.09836066, 0);
    path_0.cubicTo(size.width * 0.05199303, 0, size.width * 0.02880918, 0,
        size.width * 0.01440459, size.height * 0.05021029);
    path_0.cubicTo(0, size.height * 0.1004206, 0, size.height * 0.1812329, 0,
        size.height * 0.3428571);
    path_0.lineTo(0, size.height * 0.6571429);
    path_0.cubicTo(0, size.height * 0.8187671, 0, size.height * 0.8995800,
        size.width * 0.01440459, size.height * 0.9497900);
    path_0.cubicTo(
        size.width * 0.02880918,
        size.height,
        size.width * 0.05199303,
        size.height,
        size.width * 0.09836066,
        size.height);
    path_0.lineTo(size.width * 0.7213115, size.height);
    path_0.cubicTo(
        size.width * 0.7213115,
        size.height * 0.9605514,
        size.width * 0.7304877,
        size.height * 0.9285714,
        size.width * 0.7418033,
        size.height * 0.9285714);
    path_0.cubicTo(
        size.width * 0.7531189,
        size.height * 0.9285714,
        size.width * 0.7622951,
        size.height * 0.9605514,
        size.width * 0.7622951,
        size.height);
    path_0.lineTo(size.width * 0.9016393, size.height);
    path_0.cubicTo(size.width * 0.9480082, size.height, size.width * 0.9711926,
        size.height, size.width * 0.9855943, size.height * 0.9497900);
    path_0.cubicTo(size.width, size.height * 0.8995800, size.width,
        size.height * 0.8187671, size.width, size.height * 0.6571429);
    path_0.lineTo(size.width, size.height * 0.3428571);
    path_0.cubicTo(
        size.width,
        size.height * 0.1812329,
        size.width,
        size.height * 0.1004206,
        size.width * 0.9855943,
        size.height * 0.05021029);
    path_0.cubicTo(size.width * 0.9711926, 0, size.width * 0.9480082, 0,
        size.width * 0.9016393, 0);
    path_0.lineTo(size.width * 0.7622951, 0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff5465FF).withOpacity(0.1);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.7622951, 0);
    path_1.cubicTo(
        size.width * 0.7622951,
        size.height * 0.03944886,
        size.width * 0.7531189,
        size.height * 0.07142857,
        size.width * 0.7418033,
        size.height * 0.07142857);
    path_1.cubicTo(
        size.width * 0.7304877,
        size.height * 0.07142857,
        size.width * 0.7213115,
        size.height * 0.03944886,
        size.width * 0.7213115,
        0);
    path_1.lineTo(size.width * 0.09836066, 0);
    path_1.cubicTo(size.width * 0.05199303, 0, size.width * 0.02880918, 0,
        size.width * 0.01440459, size.height * 0.05021029);
    path_1.cubicTo(0, size.height * 0.1004206, 0, size.height * 0.1812329, 0,
        size.height * 0.3428571);
    path_1.lineTo(0, size.height * 0.6571429);
    path_1.cubicTo(0, size.height * 0.8187671, 0, size.height * 0.8995800,
        size.width * 0.01440459, size.height * 0.9497900);
    path_1.cubicTo(
        size.width * 0.02880918,
        size.height,
        size.width * 0.05199303,
        size.height,
        size.width * 0.09836066,
        size.height);
    path_1.lineTo(size.width * 0.7213115, size.height);
    path_1.cubicTo(
        size.width * 0.7213115,
        size.height * 0.9605514,
        size.width * 0.7304877,
        size.height * 0.9285714,
        size.width * 0.7418033,
        size.height * 0.9285714);
    path_1.cubicTo(
        size.width * 0.7531189,
        size.height * 0.9285714,
        size.width * 0.7622951,
        size.height * 0.9605514,
        size.width * 0.7622951,
        size.height);
    path_1.lineTo(size.width * 0.9016393, size.height);
    path_1.cubicTo(size.width * 0.9480082, size.height, size.width * 0.9711926,
        size.height, size.width * 0.9855943, size.height * 0.9497900);
    path_1.cubicTo(size.width, size.height * 0.8995800, size.width,
        size.height * 0.8187671, size.width, size.height * 0.6571429);
    path_1.lineTo(size.width, size.height * 0.3428571);
    path_1.cubicTo(
        size.width,
        size.height * 0.1812329,
        size.width,
        size.height * 0.1004206,
        size.width * 0.9855943,
        size.height * 0.05021029);
    path_1.cubicTo(size.width * 0.9711926, 0, size.width * 0.9480082, 0,
        size.width * 0.9016393, 0);
    path_1.lineTo(size.width * 0.7622951, 0);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.transparent;
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.7622951, 0);
    path_2.lineTo(size.width * 0.7622951, size.height * -0.01428571);
    path_2.lineTo(size.width * 0.7581967, size.height * -0.01428571);
    path_2.lineTo(size.width * 0.7581967, 0);
    path_2.lineTo(size.width * 0.7622951, 0);
    path_2.close();
    path_2.moveTo(size.width * 0.7213115, 0);
    path_2.lineTo(size.width * 0.7254098, 0);
    path_2.lineTo(size.width * 0.7254098, size.height * -0.01428571);
    path_2.lineTo(size.width * 0.7213115, size.height * -0.01428571);
    path_2.lineTo(size.width * 0.7213115, 0);
    path_2.close();
    path_2.moveTo(size.width * 0.01440459, size.height * 0.9497900);
    path_2.lineTo(size.width * 0.01150660, size.height * 0.9598914);
    path_2.lineTo(size.width * 0.01150660, size.height * 0.9598914);
    path_2.lineTo(size.width * 0.01440459, size.height * 0.9497900);
    path_2.close();
    path_2.moveTo(size.width * 0.7213115, size.height);
    path_2.lineTo(size.width * 0.7213115, size.height * 1.014286);
    path_2.lineTo(size.width * 0.7254098, size.height * 1.014286);
    path_2.lineTo(size.width * 0.7254098, size.height);
    path_2.lineTo(size.width * 0.7213115, size.height);
    path_2.close();
    path_2.moveTo(size.width * 0.7622951, size.height);
    path_2.lineTo(size.width * 0.7581967, size.height);
    path_2.lineTo(size.width * 0.7581967, size.height * 1.014286);
    path_2.lineTo(size.width * 0.7622951, size.height * 1.014286);
    path_2.lineTo(size.width * 0.7622951, size.height);
    path_2.close();
    path_2.moveTo(size.width * 0.9855943, size.height * 0.9497900);
    path_2.lineTo(size.width * 0.9826967, size.height * 0.9396886);
    path_2.lineTo(size.width * 0.9826967, size.height * 0.9396886);
    path_2.lineTo(size.width * 0.9855943, size.height * 0.9497900);
    path_2.close();
    path_2.moveTo(size.width * 0.9855943, size.height * 0.05021029);
    path_2.lineTo(size.width * 0.9826967, size.height * 0.06031171);
    path_2.lineTo(size.width * 0.9826967, size.height * 0.06031186);
    path_2.lineTo(size.width * 0.9855943, size.height * 0.05021029);
    path_2.close();
    path_2.moveTo(size.width * 0.7418033, size.height * 0.08571429);
    path_2.cubicTo(
        size.width * 0.7553852,
        size.height * 0.08571429,
        size.width * 0.7663934,
        size.height * 0.04733871,
        size.width * 0.7663934,
        0);
    path_2.lineTo(size.width * 0.7581967, 0);
    path_2.cubicTo(
        size.width * 0.7581967,
        size.height * 0.03155914,
        size.width * 0.7508566,
        size.height * 0.05714286,
        size.width * 0.7418033,
        size.height * 0.05714286);
    path_2.lineTo(size.width * 0.7418033, size.height * 0.08571429);
    path_2.close();
    path_2.moveTo(size.width * 0.7172131, 0);
    path_2.cubicTo(
        size.width * 0.7172131,
        size.height * 0.04733871,
        size.width * 0.7282213,
        size.height * 0.08571429,
        size.width * 0.7418033,
        size.height * 0.08571429);
    path_2.lineTo(size.width * 0.7418033, size.height * 0.05714286);
    path_2.cubicTo(
        size.width * 0.7327500,
        size.height * 0.05714286,
        size.width * 0.7254098,
        size.height * 0.03155914,
        size.width * 0.7254098,
        0);
    path_2.lineTo(size.width * 0.7172131, 0);
    path_2.close();
    path_2.moveTo(size.width * 0.09836066, size.height * 0.01428571);
    path_2.lineTo(size.width * 0.7213115, size.height * 0.01428571);
    path_2.lineTo(size.width * 0.7213115, size.height * -0.01428571);
    path_2.lineTo(size.width * 0.09836066, size.height * -0.01428571);
    path_2.lineTo(size.width * 0.09836066, size.height * 0.01428571);
    path_2.close();
    path_2.moveTo(size.width * 0.01730258, size.height * 0.06031186);
    path_2.cubicTo(
        size.width * 0.02361648,
        size.height * 0.03830343,
        size.width * 0.03200455,
        size.height * 0.02649786,
        size.width * 0.04494262,
        size.height * 0.02043457);
    path_2.cubicTo(
        size.width * 0.05799836,
        size.height * 0.01431600,
        size.width * 0.07506107,
        size.height * 0.01428571,
        size.width * 0.09836066,
        size.height * 0.01428571);
    path_2.lineTo(size.width * 0.09836066, size.height * -0.01428571);
    path_2.cubicTo(
        size.width * 0.07529262,
        size.height * -0.01428571,
        size.width * 0.05757951,
        size.height * -0.01431600,
        size.width * 0.04385041,
        size.height * -0.007882043);
    path_2.cubicTo(
        size.width * 0.03000344,
        size.height * -0.001392780,
        size.width * 0.01959730,
        size.height * 0.01190690,
        size.width * 0.01150660,
        size.height * 0.04010871);
    path_2.lineTo(size.width * 0.01730258, size.height * 0.06031186);
    path_2.close();
    path_2.moveTo(size.width * 0.004098361, size.height * 0.3428571);
    path_2.cubicTo(
        size.width * 0.004098361,
        size.height * 0.2616414,
        size.width * 0.004107049,
        size.height * 0.2021657,
        size.width * 0.005862377,
        size.height * 0.1566571);
    path_2.cubicTo(
        size.width * 0.007601844,
        size.height * 0.1115587,
        size.width * 0.01098869,
        size.height * 0.08232029,
        size.width * 0.01730258,
        size.height * 0.06031186);
    path_2.lineTo(size.width * 0.01150660, size.height * 0.04010871);
    path_2.cubicTo(
        size.width * 0.003415918,
        size.height * 0.06831057,
        size.width * -0.0003995680,
        size.height * 0.1045833,
        size.width * -0.002261242,
        size.height * 0.1528500);
    path_2.cubicTo(
        size.width * -0.004107049,
        size.height * 0.2007057,
        size.width * -0.004098361,
        size.height * 0.2624486,
        size.width * -0.004098361,
        size.height * 0.3428571);
    path_2.lineTo(size.width * 0.004098361, size.height * 0.3428571);
    path_2.close();
    path_2.moveTo(size.width * 0.004098361, size.height * 0.6571429);
    path_2.lineTo(size.width * 0.004098361, size.height * 0.3428571);
    path_2.lineTo(size.width * -0.004098361, size.height * 0.3428571);
    path_2.lineTo(size.width * -0.004098361, size.height * 0.6571429);
    path_2.lineTo(size.width * 0.004098361, size.height * 0.6571429);
    path_2.close();
    path_2.moveTo(size.width * 0.01730258, size.height * 0.9396886);
    path_2.cubicTo(
        size.width * 0.01098869,
        size.height * 0.9176800,
        size.width * 0.007601844,
        size.height * 0.8884414,
        size.width * 0.005862377,
        size.height * 0.8433429);
    path_2.cubicTo(
        size.width * 0.004107049,
        size.height * 0.7978343,
        size.width * 0.004098361,
        size.height * 0.7383586,
        size.width * 0.004098361,
        size.height * 0.6571429);
    path_2.lineTo(size.width * -0.004098361, size.height * 0.6571429);
    path_2.cubicTo(
        size.width * -0.004098361,
        size.height * 0.7375514,
        size.width * -0.004107049,
        size.height * 0.7992943,
        size.width * -0.002261242,
        size.height * 0.8471500);
    path_2.cubicTo(
        size.width * -0.0003995680,
        size.height * 0.8954171,
        size.width * 0.003415918,
        size.height * 0.9316900,
        size.width * 0.01150660,
        size.height * 0.9598914);
    path_2.lineTo(size.width * 0.01730258, size.height * 0.9396886);
    path_2.close();
    path_2.moveTo(size.width * 0.09836066, size.height * 0.9857143);
    path_2.cubicTo(
        size.width * 0.07506107,
        size.height * 0.9857143,
        size.width * 0.05799836,
        size.height * 0.9856843,
        size.width * 0.04494262,
        size.height * 0.9795657);
    path_2.cubicTo(
        size.width * 0.03200455,
        size.height * 0.9735014,
        size.width * 0.02361648,
        size.height * 0.9616971,
        size.width * 0.01730258,
        size.height * 0.9396886);
    path_2.lineTo(size.width * 0.01150660, size.height * 0.9598914);
    path_2.cubicTo(
        size.width * 0.01959730,
        size.height * 0.9880929,
        size.width * 0.03000344,
        size.height * 1.001393,
        size.width * 0.04385041,
        size.height * 1.007881);
    path_2.cubicTo(
        size.width * 0.05757951,
        size.height * 1.014316,
        size.width * 0.07529262,
        size.height * 1.014286,
        size.width * 0.09836066,
        size.height * 1.014286);
    path_2.lineTo(size.width * 0.09836066, size.height * 0.9857143);
    path_2.close();
    path_2.moveTo(size.width * 0.7213115, size.height * 0.9857143);
    path_2.lineTo(size.width * 0.09836066, size.height * 0.9857143);
    path_2.lineTo(size.width * 0.09836066, size.height * 1.014286);
    path_2.lineTo(size.width * 0.7213115, size.height * 1.014286);
    path_2.lineTo(size.width * 0.7213115, size.height * 0.9857143);
    path_2.close();
    path_2.moveTo(size.width * 0.7254098, size.height);
    path_2.cubicTo(
        size.width * 0.7254098,
        size.height * 0.9684414,
        size.width * 0.7327500,
        size.height * 0.9428571,
        size.width * 0.7418033,
        size.height * 0.9428571);
    path_2.lineTo(size.width * 0.7418033, size.height * 0.9142857);
    path_2.cubicTo(
        size.width * 0.7282213,
        size.height * 0.9142857,
        size.width * 0.7172131,
        size.height * 0.9526614,
        size.width * 0.7172131,
        size.height);
    path_2.lineTo(size.width * 0.7254098, size.height);
    path_2.close();
    path_2.moveTo(size.width * 0.7418033, size.height * 0.9428571);
    path_2.cubicTo(
        size.width * 0.7508566,
        size.height * 0.9428571,
        size.width * 0.7581967,
        size.height * 0.9684414,
        size.width * 0.7581967,
        size.height);
    path_2.lineTo(size.width * 0.7663934, size.height);
    path_2.cubicTo(
        size.width * 0.7663934,
        size.height * 0.9526614,
        size.width * 0.7553852,
        size.height * 0.9142857,
        size.width * 0.7418033,
        size.height * 0.9142857);
    path_2.lineTo(size.width * 0.7418033, size.height * 0.9428571);
    path_2.close();
    path_2.moveTo(size.width * 0.9016393, size.height * 0.9857143);
    path_2.lineTo(size.width * 0.7622951, size.height * 0.9857143);
    path_2.lineTo(size.width * 0.7622951, size.height * 1.014286);
    path_2.lineTo(size.width * 0.9016393, size.height * 1.014286);
    path_2.lineTo(size.width * 0.9016393, size.height * 0.9857143);
    path_2.close();
    path_2.moveTo(size.width * 0.9826967, size.height * 0.9396886);
    path_2.cubicTo(
        size.width * 0.9763852,
        size.height * 0.9616971,
        size.width * 0.9679959,
        size.height * 0.9735014,
        size.width * 0.9550574,
        size.height * 0.9795657);
    path_2.cubicTo(
        size.width * 0.9420000,
        size.height * 0.9856843,
        size.width * 0.9249385,
        size.height * 0.9857143,
        size.width * 0.9016393,
        size.height * 0.9857143);
    path_2.lineTo(size.width * 0.9016393, size.height * 1.014286);
    path_2.cubicTo(
        size.width * 0.9247090,
        size.height * 1.014286,
        size.width * 0.9424221,
        size.height * 1.014316,
        size.width * 0.9561516,
        size.height * 1.007881);
    path_2.cubicTo(
        size.width * 0.9699959,
        size.height * 1.001393,
        size.width * 0.9804016,
        size.height * 0.9880929,
        size.width * 0.9884918,
        size.height * 0.9598914);
    path_2.lineTo(size.width * 0.9826967, size.height * 0.9396886);
    path_2.close();
    path_2.moveTo(size.width * 0.9959016, size.height * 0.6571429);
    path_2.cubicTo(
        size.width * 0.9959016,
        size.height * 0.7383586,
        size.width * 0.9958934,
        size.height * 0.7978343,
        size.width * 0.9941393,
        size.height * 0.8433429);
    path_2.cubicTo(
        size.width * 0.9923975,
        size.height * 0.8884414,
        size.width * 0.9890123,
        size.height * 0.9176800,
        size.width * 0.9826967,
        size.height * 0.9396886);
    path_2.lineTo(size.width * 0.9884918, size.height * 0.9598914);
    path_2.cubicTo(
        size.width * 0.9965861,
        size.height * 0.9316900,
        size.width * 1.000398,
        size.height * 0.8954171,
        size.width * 1.002262,
        size.height * 0.8471500);
    path_2.cubicTo(
        size.width * 1.004107,
        size.height * 0.7992943,
        size.width * 1.004098,
        size.height * 0.7375514,
        size.width * 1.004098,
        size.height * 0.6571429);
    path_2.lineTo(size.width * 0.9959016, size.height * 0.6571429);
    path_2.close();
    path_2.moveTo(size.width * 0.9959016, size.height * 0.3428571);
    path_2.lineTo(size.width * 0.9959016, size.height * 0.6571429);
    path_2.lineTo(size.width * 1.004098, size.height * 0.6571429);
    path_2.lineTo(size.width * 1.004098, size.height * 0.3428571);
    path_2.lineTo(size.width * 0.9959016, size.height * 0.3428571);
    path_2.close();
    path_2.moveTo(size.width * 0.9826967, size.height * 0.06031186);
    path_2.cubicTo(
        size.width * 0.9890123,
        size.height * 0.08232029,
        size.width * 0.9923975,
        size.height * 0.1115587,
        size.width * 0.9941393,
        size.height * 0.1566571);
    path_2.cubicTo(
        size.width * 0.9958934,
        size.height * 0.2021657,
        size.width * 0.9959016,
        size.height * 0.2616414,
        size.width * 0.9959016,
        size.height * 0.3428571);
    path_2.lineTo(size.width * 1.004098, size.height * 0.3428571);
    path_2.cubicTo(
        size.width * 1.004098,
        size.height * 0.2624486,
        size.width * 1.004107,
        size.height * 0.2007057,
        size.width * 1.002262,
        size.height * 0.1528500);
    path_2.cubicTo(
        size.width * 1.000398,
        size.height * 0.1045833,
        size.width * 0.9965861,
        size.height * 0.06831057,
        size.width * 0.9884918,
        size.height * 0.04010871);
    path_2.lineTo(size.width * 0.9826967, size.height * 0.06031186);
    path_2.close();
    path_2.moveTo(size.width * 0.9016393, size.height * 0.01428571);
    path_2.cubicTo(
        size.width * 0.9249385,
        size.height * 0.01428571,
        size.width * 0.9420000,
        size.height * 0.01431600,
        size.width * 0.9550574,
        size.height * 0.02043457);
    path_2.cubicTo(
        size.width * 0.9679959,
        size.height * 0.02649786,
        size.width * 0.9763852,
        size.height * 0.03830343,
        size.width * 0.9826967,
        size.height * 0.06031171);
    path_2.lineTo(size.width * 0.9884918, size.height * 0.04010871);
    path_2.cubicTo(
        size.width * 0.9804016,
        size.height * 0.01190690,
        size.width * 0.9699959,
        size.height * -0.001392780,
        size.width * 0.9561516,
        size.height * -0.007882043);
    path_2.cubicTo(
        size.width * 0.9424221,
        size.height * -0.01431600,
        size.width * 0.9247090,
        size.height * -0.01428571,
        size.width * 0.9016393,
        size.height * -0.01428571);
    path_2.lineTo(size.width * 0.9016393, size.height * 0.01428571);
    path_2.close();
    path_2.moveTo(size.width * 0.7622951, size.height * 0.01428571);
    path_2.lineTo(size.width * 0.9016393, size.height * 0.01428571);
    path_2.lineTo(size.width * 0.9016393, size.height * -0.01428571);
    path_2.lineTo(size.width * 0.7622951, size.height * -0.01428571);
    path_2.lineTo(size.width * 0.7622951, size.height * 0.01428571);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff5465FF).withOpacity(0.1);
    canvas.drawPath(path_2, paint2Fill);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomThumbShape extends SfThumbShape {
  final ui.Image image;

  CustomThumbShape(this.image);

  // Converts degree to radians.
  double? degreeToRadians(num deg) => deg * (pi / 180.0);

  @override
  void paint(PaintingContext context, Offset center,
      {required RenderBox parentBox,
        required RenderBox? child,
        required SfSliderThemeData themeData,
        SfRangeValues? currentValues,
        dynamic currentValue,
        required Paint? paint,
        required Animation<double> enableAnimation,
        required TextDirection textDirection,
        required SfThumb? thumb}){
    final canvas = context.canvas;
    final imageWidth = image.width;
    final imageHeight = image.height;

    Offset imageOffset = Offset(
      center.dx - (imageWidth / 2),
      center.dy - (imageHeight / 1.13),
    );

    Paint paint = Paint()..filterQuality = FilterQuality.high;

    canvas.drawImage(image, imageOffset, paint);
  }
}


//Copy this CustomPainter code to the Bottom of the File
class ProviderPainter extends CustomPainter {
@override
void paint(Canvas canvas, Size size) {

Path path_0 = Path();
path_0.moveTo(0,size.height*0.03616637);
path_0.cubicTo(0,size.height*0.01911736,0,size.height*0.01059288,size.width*0.008743075,size.height*0.005296438);
path_0.cubicTo(size.width*0.01748615,0,size.width*0.03155791,0,size.width*0.05970149,0);
path_0.lineTo(size.width*0.9402985,0);
path_0.cubicTo(size.width*0.9684418,0,size.width*0.9825134,0,size.width*0.9912567,size.height*0.005296438);
path_0.cubicTo(size.width,size.height*0.01059288,size.width,size.height*0.01911736,size.width,size.height*0.03616637);
path_0.lineTo(size.width,size.height*0.05700850);
path_0.cubicTo(size.width,size.height*0.05715172,size.width,size.height*0.05679349,size.width*0.9996209,size.height*0.05768445);
path_0.cubicTo(size.width*0.9992388,size.height*0.05857559,size.width*0.9934597,size.height*0.06489024,size.width*0.9818985,size.height*0.07751971);
path_0.cubicTo(size.width*0.9801194,size.height*0.07946528,size.width*0.9791045,size.height*0.08170434,size.width*0.9791045,size.height*0.08408680);
path_0.cubicTo(size.width*0.9791045,size.height*0.08646926,size.width*0.9801194,size.height*0.08870832,size.width*0.9818985,size.height*0.09065389);
path_0.cubicTo(size.width*0.9934597,size.height*0.1032834,size.width*0.9992388,size.height*0.1095980,size.width*0.9996209,size.height*0.1104892);
path_0.cubicTo(size.width,size.height*0.1113801,size.width,size.height*0.1110219,size.width,size.height*0.1111651);
path_0.lineTo(size.width,size.height*0.2776239);
path_0.cubicTo(size.width,size.height*0.2777667,size.width,size.height*0.2774087,size.width*0.9996209,size.height*0.2783002);
path_0.cubicTo(size.width*0.9992388,size.height*0.2791899,size.width*0.9934597,size.height*0.2855045,size.width*0.9818985,size.height*0.2981338);
path_0.cubicTo(size.width*0.9801194,size.height*0.3000796,size.width*0.9791045,size.height*0.3023201,size.width*0.9791045,size.height*0.3047016);
path_0.cubicTo(size.width*0.9791045,size.height*0.3070832,size.width*0.9801194,size.height*0.3093237,size.width*0.9818985,size.height*0.3112694);
path_0.cubicTo(size.width*0.9934597,size.height*0.3238987,size.width*0.9992388,size.height*0.3302134,size.width*0.9996209,size.height*0.3311031);
path_0.cubicTo(size.width,size.height*0.3319946,size.width,size.height*0.3316365,size.width,size.height*0.3317794);
path_0.lineTo(size.width,size.height*0.9638336);
path_0.cubicTo(size.width,size.height*0.9808825,size.width,size.height*0.9894069,size.width*0.9912567,size.height*0.9947034);
path_0.cubicTo(size.width*0.9825134,size.height,size.width*0.9684418,size.height,size.width*0.9402985,size.height);
path_0.lineTo(size.width*0.05970149,size.height);
path_0.cubicTo(size.width*0.03155791,size.height,size.width*0.01748615,size.height,size.width*0.008743075,size.height*0.9947034);
path_0.cubicTo(0,size.height*0.9894069,0,size.height*0.9808825,0,size.height*0.9638336);
path_0.lineTo(0,size.height*0.3298174);
path_0.cubicTo(0,size.height*0.3292893,0,size.height*0.3290253,size.width*0.0003690239,size.height*0.3281465);
path_0.cubicTo(size.width*0.0007380478,size.height*0.3272676,size.width*0.005558299,size.height*0.3219042,size.width*0.01519878,size.height*0.3111772);
path_0.cubicTo(size.width*0.01692797,size.height*0.3092532,size.width*0.01791045,size.height*0.3070470,size.width*0.01791045,size.height*0.3047016);
path_0.cubicTo(size.width*0.01791045,size.height*0.3023562,size.width*0.01692797,size.height*0.3001501,size.width*0.01519878,size.height*0.2982260);
path_0.cubicTo(size.width*0.005558299,size.height*0.2874991,size.width*0.0007380478,size.height*0.2821356,size.width*0.0003690239,size.height*0.2812568);
path_0.cubicTo(0,size.height*0.2803779,0,size.height*0.2801139,0,size.height*0.2795859);
path_0.lineTo(0,size.height*0.1092029);
path_0.cubicTo(0,size.height*0.1086743,0,size.height*0.1084099,size.width*0.0003690239,size.height*0.1075318);
path_0.cubicTo(size.width*0.0007380507,size.height*0.1066535,size.width*0.005558299,size.height*0.1012897,size.width*0.01519878,size.height*0.09056203);
path_0.cubicTo(size.width*0.01692797,size.height*0.08863779,size.width*0.01791045,size.height*0.08643183,size.width*0.01791045,size.height*0.08408680);
path_0.cubicTo(size.width*0.01791045,size.height*0.08174177,size.width*0.01692797,size.height*0.07953580,size.width*0.01519878,size.height*0.07761157);
path_0.cubicTo(size.width*0.005558299,size.height*0.06688391,size.width*0.0007380507,size.height*0.06152007,size.width*0.0003690269,size.height*0.06064177);
path_0.cubicTo(0,size.height*0.05976365,0,size.height*0.05949928,0,size.height*0.05897071);
path_0.lineTo(0,size.height*0.03616637);
path_0.close();

Paint paint0Fill = Paint()..style=PaintingStyle.fill;
paint0Fill.color = const Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_0,paint0Fill);

Path path_1 = Path();
path_1.moveTo(0,size.height*0.03616637);
path_1.cubicTo(0,size.height*0.01911736,0,size.height*0.01059288,size.width*0.008743075,size.height*0.005296438);
path_1.cubicTo(size.width*0.01748615,0,size.width*0.03155791,0,size.width*0.05970149,0);
path_1.lineTo(size.width*0.9402985,0);
path_1.cubicTo(size.width*0.9684418,0,size.width*0.9825134,0,size.width*0.9912567,size.height*0.005296438);
path_1.cubicTo(size.width,size.height*0.01059288,size.width,size.height*0.01911736,size.width,size.height*0.03616637);
path_1.lineTo(size.width,size.height*0.05700850);
path_1.cubicTo(size.width,size.height*0.05715172,size.width,size.height*0.05679349,size.width*0.9996209,size.height*0.05768445);
path_1.cubicTo(size.width*0.9992388,size.height*0.05857559,size.width*0.9934597,size.height*0.06489024,size.width*0.9818985,size.height*0.07751971);
path_1.cubicTo(size.width*0.9801194,size.height*0.07946528,size.width*0.9791045,size.height*0.08170434,size.width*0.9791045,size.height*0.08408680);
path_1.cubicTo(size.width*0.9791045,size.height*0.08646926,size.width*0.9801194,size.height*0.08870832,size.width*0.9818985,size.height*0.09065389);
path_1.cubicTo(size.width*0.9934597,size.height*0.1032834,size.width*0.9992388,size.height*0.1095980,size.width*0.9996209,size.height*0.1104892);
path_1.cubicTo(size.width,size.height*0.1113801,size.width,size.height*0.1110219,size.width,size.height*0.1111651);
path_1.lineTo(size.width,size.height*0.2776239);
path_1.cubicTo(size.width,size.height*0.2777667,size.width,size.height*0.2774087,size.width*0.9996209,size.height*0.2783002);
path_1.cubicTo(size.width*0.9992388,size.height*0.2791899,size.width*0.9934597,size.height*0.2855045,size.width*0.9818985,size.height*0.2981338);
path_1.cubicTo(size.width*0.9801194,size.height*0.3000796,size.width*0.9791045,size.height*0.3023201,size.width*0.9791045,size.height*0.3047016);
path_1.cubicTo(size.width*0.9791045,size.height*0.3070832,size.width*0.9801194,size.height*0.3093237,size.width*0.9818985,size.height*0.3112694);
path_1.cubicTo(size.width*0.9934597,size.height*0.3238987,size.width*0.9992388,size.height*0.3302134,size.width*0.9996209,size.height*0.3311031);
path_1.cubicTo(size.width,size.height*0.3319946,size.width,size.height*0.3316365,size.width,size.height*0.3317794);
path_1.lineTo(size.width,size.height*0.9638336);
path_1.cubicTo(size.width,size.height*0.9808825,size.width,size.height*0.9894069,size.width*0.9912567,size.height*0.9947034);
path_1.cubicTo(size.width*0.9825134,size.height,size.width*0.9684418,size.height,size.width*0.9402985,size.height);
path_1.lineTo(size.width*0.05970149,size.height);
path_1.cubicTo(size.width*0.03155791,size.height,size.width*0.01748615,size.height,size.width*0.008743075,size.height*0.9947034);
path_1.cubicTo(0,size.height*0.9894069,0,size.height*0.9808825,0,size.height*0.9638336);
path_1.lineTo(0,size.height*0.3298174);
path_1.cubicTo(0,size.height*0.3292893,0,size.height*0.3290253,size.width*0.0003690239,size.height*0.3281465);
path_1.cubicTo(size.width*0.0007380478,size.height*0.3272676,size.width*0.005558299,size.height*0.3219042,size.width*0.01519878,size.height*0.3111772);
path_1.cubicTo(size.width*0.01692797,size.height*0.3092532,size.width*0.01791045,size.height*0.3070470,size.width*0.01791045,size.height*0.3047016);
path_1.cubicTo(size.width*0.01791045,size.height*0.3023562,size.width*0.01692797,size.height*0.3001501,size.width*0.01519878,size.height*0.2982260);
path_1.cubicTo(size.width*0.005558299,size.height*0.2874991,size.width*0.0007380478,size.height*0.2821356,size.width*0.0003690239,size.height*0.2812568);
path_1.cubicTo(0,size.height*0.2803779,0,size.height*0.2801139,0,size.height*0.2795859);
path_1.lineTo(0,size.height*0.1092029);
path_1.cubicTo(0,size.height*0.1086743,0,size.height*0.1084099,size.width*0.0003690239,size.height*0.1075318);
path_1.cubicTo(size.width*0.0007380507,size.height*0.1066535,size.width*0.005558299,size.height*0.1012897,size.width*0.01519878,size.height*0.09056203);
path_1.cubicTo(size.width*0.01692797,size.height*0.08863779,size.width*0.01791045,size.height*0.08643183,size.width*0.01791045,size.height*0.08408680);
path_1.cubicTo(size.width*0.01791045,size.height*0.08174177,size.width*0.01692797,size.height*0.07953580,size.width*0.01519878,size.height*0.07761157);
path_1.cubicTo(size.width*0.005558299,size.height*0.06688391,size.width*0.0007380507,size.height*0.06152007,size.width*0.0003690269,size.height*0.06064177);
path_1.cubicTo(0,size.height*0.05976365,0,size.height*0.05949928,0,size.height*0.05897071);
path_1.lineTo(0,size.height*0.03616637);
path_1.close();

Paint paint1Fill = Paint()..style=PaintingStyle.fill;
paint1Fill.color = const Color(0xffF5F6F7).withOpacity(1.0);
canvas.drawPath(path_1,paint1Fill);

Path path_2 = Path();
path_2.moveTo(size.width*0.9912567,size.height*0.9947034);
path_2.lineTo(size.width*0.9896746,size.height*0.9937450);
path_2.lineTo(size.width*0.9896746,size.height*0.9937450);
path_2.lineTo(size.width*0.9912567,size.height*0.9947034);
path_2.close();
path_2.moveTo(size.width*0.008743075,size.height*0.9947034);
path_2.lineTo(size.width*0.01032615,size.height*0.9937450);
path_2.lineTo(size.width*0.01032615,size.height*0.9937450);
path_2.lineTo(size.width*0.008743075,size.height*0.9947034);
path_2.close();
path_2.moveTo(size.width*0.01519878,size.height*0.07761157);
path_2.lineTo(size.width*0.01323245,size.height*0.07826004);
path_2.lineTo(size.width*0.01519878,size.height*0.07761157);
path_2.close();
path_2.moveTo(size.width*0.0003690269,size.height*0.06064177);
path_2.lineTo(size.width*0.002538639,size.height*0.06030723);
path_2.lineTo(size.width*0.0003690269,size.height*0.06064177);
path_2.close();
path_2.moveTo(size.width*0.01519878,size.height*0.09056203);
path_2.lineTo(size.width*0.01323245,size.height*0.08991356);
path_2.lineTo(size.width*0.01519878,size.height*0.09056203);
path_2.close();
path_2.moveTo(size.width*0.0003690239,size.height*0.1075318);
path_2.lineTo(size.width*0.002538639,size.height*0.1078664);
path_2.lineTo(size.width*0.0003690239,size.height*0.1075318);
path_2.close();
path_2.moveTo(size.width*0.01519878,size.height*0.2982260);
path_2.lineTo(size.width*0.01323245,size.height*0.2988752);
path_2.lineTo(size.width*0.01519878,size.height*0.2982260);
path_2.close();
path_2.moveTo(size.width*0.0003690239,size.height*0.2812568);
path_2.lineTo(size.width*0.002538639,size.height*0.2809222);
path_2.lineTo(size.width*0.002538639,size.height*0.2809222);
path_2.lineTo(size.width*0.0003690239,size.height*0.2812568);
path_2.close();
path_2.moveTo(size.width*0.9818985,size.height*0.2981338);
path_2.lineTo(size.width*0.9799403,size.height*0.2974774);
path_2.lineTo(size.width*0.9818985,size.height*0.2981338);
path_2.close();
path_2.moveTo(size.width*0.9996209,size.height*0.2783002);
path_2.lineTo(size.width*1.001788,size.height*0.2786383);
path_2.lineTo(size.width*0.9996209,size.height*0.2783002);
path_2.close();
path_2.moveTo(size.width*0.01519878,size.height*0.3111772);
path_2.lineTo(size.width*0.01323245,size.height*0.3105280);
path_2.lineTo(size.width*0.01519878,size.height*0.3111772);
path_2.close();
path_2.moveTo(size.width*0.0003690239,size.height*0.3281465);
path_2.lineTo(size.width*0.002538639,size.height*0.3284810);
path_2.lineTo(size.width*0.0003690239,size.height*0.3281465);
path_2.close();
path_2.moveTo(size.width*0.9818985,size.height*0.09065389);
path_2.lineTo(size.width*0.9838567,size.height*0.08999638);
path_2.lineTo(size.width*0.9818985,size.height*0.09065389);
path_2.close();
path_2.moveTo(size.width*0.9996209,size.height*0.1104892);
path_2.lineTo(size.width*1.001788,size.height*0.1101494);
path_2.lineTo(size.width*0.9996209,size.height*0.1104892);
path_2.close();
path_2.moveTo(size.width*0.9818985,size.height*0.3112694);
path_2.lineTo(size.width*0.9838567,size.height*0.3106112);
path_2.lineTo(size.width*0.9818985,size.height*0.3112694);
path_2.close();
path_2.moveTo(size.width*0.9996209,size.height*0.3311031);
path_2.lineTo(size.width*0.9974507,size.height*0.3314430);
path_2.lineTo(size.width*0.9996209,size.height*0.3311031);
path_2.close();
path_2.moveTo(size.width*0.9996209,size.height*0.05768445);
path_2.lineTo(size.width*0.9974507,size.height*0.05734485);
path_2.lineTo(size.width*0.9996209,size.height*0.05768445);
path_2.close();
path_2.moveTo(size.width*0.007160000,size.height*0.004337432);
path_2.cubicTo(size.width*0.005427254,size.height*0.005387125,size.width*0.004006000,size.height*0.006553273,size.width*0.002846176,size.height*0.007861881);
path_2.lineTo(size.width*0.006791134,size.height*0.009144991);
path_2.cubicTo(size.width*0.007748448,size.height*0.008064901,size.width*0.008909433,size.height*0.007113689,size.width*0.01032615,size.height*0.006255443);
path_2.lineTo(size.width*0.007160000,size.height*0.004337432);
path_2.close();
path_2.moveTo(size.width*-0.001086582,size.height*0.01596870);
path_2.cubicTo(size.width*-0.001630997,size.height*0.01834973,size.width*-0.001915887,size.height*0.02104322,size.width*-0.002066934,size.height*0.02410090);
path_2.lineTo(size.width*0.002408675,size.height*0.02418192);
path_2.cubicTo(size.width*0.002557540,size.height*0.02116854,size.width*0.002835773,size.height*0.01858409,size.width*0.003348687,size.height*0.01634085);
path_2.lineTo(size.width*-0.001086582,size.height*0.01596870);
path_2.close();
path_2.moveTo(size.width*-0.002234027,size.height*0.03215063);
path_2.cubicTo(size.width*-0.002238806,size.height*0.03343508,size.width*-0.002238806,size.height*0.03477324,size.width*-0.002238806,size.height*0.03616637);
path_2.lineTo(size.width*0.002238806,size.height*0.03616637);
path_2.cubicTo(size.width*0.002238806,size.height*0.03477251,size.width*0.002238806,size.height*0.03343761,size.width*0.002243573,size.height*0.03215678);
path_2.lineTo(size.width*-0.002234027,size.height*0.03215063);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.03616637);
path_2.lineTo(size.width*-0.002238806,size.height*0.03901682);
path_2.lineTo(size.width*0.002238806,size.height*0.03901682);
path_2.lineTo(size.width*0.002238806,size.height*0.03616637);
path_2.lineTo(size.width*-0.002238806,size.height*0.03616637);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.04471790);
path_2.lineTo(size.width*-0.002238806,size.height*0.05041899);
path_2.lineTo(size.width*0.002238806,size.height*0.05041899);
path_2.lineTo(size.width*0.002238806,size.height*0.04471790);
path_2.lineTo(size.width*-0.002238806,size.height*0.04471790);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.05612007);
path_2.lineTo(size.width*-0.002238806,size.height*0.05897071);
path_2.lineTo(size.width*0.002238806,size.height*0.05897071);
path_2.lineTo(size.width*0.002238806,size.height*0.05612007);
path_2.lineTo(size.width*-0.002238806,size.height*0.05612007);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.05897071);
path_2.cubicTo(size.width*-0.002238806,size.height*0.05912098,size.width*-0.002239191,size.height*0.05928499,size.width*-0.002227081,size.height*0.05945298);
path_2.lineTo(size.width*0.002246266,size.height*0.05933454);
path_2.cubicTo(size.width*0.002239191,size.height*0.05923635,size.width*0.002238806,size.height*0.05913345,size.width*0.002238806,size.height*0.05897071);
path_2.lineTo(size.width*-0.002238806,size.height*0.05897071);
path_2.close();
path_2.moveTo(size.width*-0.001980122,size.height*0.06052170);
path_2.cubicTo(size.width*-0.001929624,size.height*0.06066058,size.width*-0.001870116,size.height*0.06081103,size.width*-0.001800588,size.height*0.06097649);
path_2.lineTo(size.width*0.002538639,size.height*0.06030723);
path_2.cubicTo(size.width*0.002478137,size.height*0.06016329,size.width*0.002430522,size.height*0.06004231,size.width*0.002392770,size.height*0.05993852);
path_2.lineTo(size.width*-0.001980122,size.height*0.06052170);
path_2.close();
path_2.moveTo(size.width*-0.001800588,size.height*0.06097649);
path_2.cubicTo(size.width*-0.001642654,size.height*0.06135226,size.width*-0.001181101,size.height*0.06194937,size.width*-0.0006349463,size.height*0.06261718);
path_2.cubicTo(size.width*-0.00003756597,size.height*0.06334792,size.width*0.0008079224,size.height*0.06433363,size.width*0.001899382,size.height*0.06557902);
path_2.lineTo(size.width*0.005854239,size.height*0.06430723);
path_2.cubicTo(size.width*0.004767851,size.height*0.06306745,size.width*0.003946149,size.height*0.06210886,size.width*0.003377463,size.height*0.06141338);
path_2.cubicTo(size.width*0.003092627,size.height*0.06106492,size.width*0.002879633,size.height*0.06079277,size.width*0.002731385,size.height*0.06058987);
path_2.cubicTo(size.width*0.002565603,size.height*0.06036275,size.width*0.002531173,size.height*0.06028951,size.width*0.002538639,size.height*0.06030723);
path_2.lineTo(size.width*-0.001800588,size.height*0.06097649);
path_2.close();
path_2.moveTo(size.width*0.009439522,size.height*0.07403797);
path_2.cubicTo(size.width*0.01060875,size.height*0.07534033,size.width*0.01187281,size.height*0.07674702,size.width*0.01323245,size.height*0.07826004);
path_2.lineTo(size.width*0.01716507,size.height*0.07696311);
path_2.cubicTo(size.width*0.01580531,size.height*0.07544991,size.width*0.01454173,size.height*0.07404394,size.width*0.01337304,size.height*0.07274213);
path_2.lineTo(size.width*0.009439522,size.height*0.07403797);
path_2.close();
path_2.moveTo(size.width*0.01323245,size.height*0.07826004);
path_2.cubicTo(size.width*0.01363021,size.height*0.07870253,size.width*0.01398394,size.height*0.07916166,size.width*0.01429018,size.height*0.07963508);
path_2.lineTo(size.width*0.01845910,size.height*0.07864539);
path_2.cubicTo(size.width*0.01808427,size.height*0.07806582,size.width*0.01765146,size.height*0.07750434,size.width*0.01716507,size.height*0.07696311);
path_2.lineTo(size.width*0.01323245,size.height*0.07826004);
path_2.close();
path_2.moveTo(size.width*0.01551782,size.height*0.08256998);
path_2.cubicTo(size.width*0.01561928,size.height*0.08306637,size.width*0.01567164,size.height*0.08357251,size.width*0.01567164,size.height*0.08408680);
path_2.lineTo(size.width*0.02014925,size.height*0.08408680);
path_2.cubicTo(size.width*0.02014925,size.height*0.08346094,size.width*0.02008552,size.height*0.08284340,size.width*0.01996152,size.height*0.08223671);
path_2.lineTo(size.width*0.01551782,size.height*0.08256998);
path_2.close();
path_2.moveTo(size.width*0.01567164,size.height*0.08408680);
path_2.cubicTo(size.width*0.01567164,size.height*0.08460108,size.width*0.01561928,size.height*0.08510723,size.width*0.01551782,size.height*0.08560362);
path_2.lineTo(size.width*0.01996152,size.height*0.08593689);
path_2.cubicTo(size.width*0.02008552,size.height*0.08533020,size.width*0.02014925,size.height*0.08471266,size.width*0.02014925,size.height*0.08408680);
path_2.lineTo(size.width*0.01567164,size.height*0.08408680);
path_2.close();
path_2.moveTo(size.width*0.01429018,size.height*0.08853852);
path_2.cubicTo(size.width*0.01398397,size.height*0.08901193,size.width*0.01363021,size.height*0.08947107,size.width*0.01323245,size.height*0.08991356);
path_2.lineTo(size.width*0.01716507,size.height*0.09121049);
path_2.cubicTo(size.width*0.01765146,size.height*0.09066926,size.width*0.01808427,size.height*0.09010778,size.width*0.01845910,size.height*0.08952821);
path_2.lineTo(size.width*0.01429018,size.height*0.08853852);
path_2.close();
path_2.moveTo(size.width*0.01323245,size.height*0.08991356);
path_2.cubicTo(size.width*0.01187281,size.height*0.09142658,size.width*0.01060875,size.height*0.09283327,size.width*0.009439522,size.height*0.09413562);
path_2.lineTo(size.width*0.01337304,size.height*0.09543146);
path_2.cubicTo(size.width*0.01454173,size.height*0.09412966,size.width*0.01580531,size.height*0.09272369,size.width*0.01716507,size.height*0.09121049);
path_2.lineTo(size.width*0.01323245,size.height*0.08991356);
path_2.close();
path_2.moveTo(size.width*0.001899382,size.height*0.1025946);
path_2.cubicTo(size.width*0.0008079224,size.height*0.1038400,size.width*-0.00003756597,size.height*0.1048257,size.width*-0.0006349463,size.height*0.1055564);
path_2.cubicTo(size.width*-0.001181101,size.height*0.1062244,size.width*-0.001642654,size.height*0.1068213,size.width*-0.001800588,size.height*0.1071971);
path_2.lineTo(size.width*0.002538639,size.height*0.1078664);
path_2.cubicTo(size.width*0.002531173,size.height*0.1078841,size.width*0.002565603,size.height*0.1078108,size.width*0.002731385,size.height*0.1075837);
path_2.cubicTo(size.width*0.002879633,size.height*0.1073808,size.width*0.003092627,size.height*0.1071087,size.width*0.003377463,size.height*0.1067602);
path_2.cubicTo(size.width*0.003946149,size.height*0.1060647,size.width*0.004767851,size.height*0.1051061,size.width*0.005854239,size.height*0.1038664);
path_2.lineTo(size.width*0.001899382,size.height*0.1025946);
path_2.close();
path_2.moveTo(size.width*-0.001800588,size.height*0.1071971);
path_2.cubicTo(size.width*-0.001870116,size.height*0.1073626,size.width*-0.001929624,size.height*0.1075130,size.width*-0.001980122,size.height*0.1076519);
path_2.lineTo(size.width*0.002392770,size.height*0.1082351);
path_2.cubicTo(size.width*0.002430522,size.height*0.1081313,size.width*0.002478137,size.height*0.1080103,size.width*0.002538639,size.height*0.1078664);
path_2.lineTo(size.width*-0.001800588,size.height*0.1071971);
path_2.close();
path_2.moveTo(size.width*-0.002227081,size.height*0.1087206);
path_2.cubicTo(size.width*-0.002239191,size.height*0.1088886,size.width*-0.002238806,size.height*0.1090526,size.width*-0.002238806,size.height*0.1092029);
path_2.lineTo(size.width*0.002238806,size.height*0.1092029);
path_2.cubicTo(size.width*0.002238806,size.height*0.1090401,size.width*0.002239191,size.height*0.1089373,size.width*0.002246266,size.height*0.1088391);
path_2.lineTo(size.width*-0.002227081,size.height*0.1087206);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.1092029);
path_2.lineTo(size.width*-0.002238806,size.height*0.1127526);
path_2.lineTo(size.width*0.002238806,size.height*0.1127526);
path_2.lineTo(size.width*0.002238806,size.height*0.1092029);
path_2.lineTo(size.width*-0.002238806,size.height*0.1092029);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.1198519);
path_2.lineTo(size.width*-0.002238806,size.height*0.1269512);
path_2.lineTo(size.width*0.002238806,size.height*0.1269512);
path_2.lineTo(size.width*0.002238806,size.height*0.1198519);
path_2.lineTo(size.width*-0.002238806,size.height*0.1198519);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.1340505);
path_2.lineTo(size.width*-0.002238806,size.height*0.1411497);
path_2.lineTo(size.width*0.002238806,size.height*0.1411497);
path_2.lineTo(size.width*0.002238806,size.height*0.1340505);
path_2.lineTo(size.width*-0.002238806,size.height*0.1340505);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.1482490);
path_2.lineTo(size.width*-0.002238806,size.height*0.1553483);
path_2.lineTo(size.width*0.002238806,size.height*0.1553483);
path_2.lineTo(size.width*0.002238806,size.height*0.1482490);
path_2.lineTo(size.width*-0.002238806,size.height*0.1482490);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.1624474);
path_2.lineTo(size.width*-0.002238806,size.height*0.1695467);
path_2.lineTo(size.width*0.002238806,size.height*0.1695467);
path_2.lineTo(size.width*0.002238806,size.height*0.1624474);
path_2.lineTo(size.width*-0.002238806,size.height*0.1624474);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.1766459);
path_2.lineTo(size.width*-0.002238806,size.height*0.1837450);
path_2.lineTo(size.width*0.002238806,size.height*0.1837450);
path_2.lineTo(size.width*0.002238806,size.height*0.1766459);
path_2.lineTo(size.width*-0.002238806,size.height*0.1766459);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.1908445);
path_2.lineTo(size.width*-0.002238806,size.height*0.1979439);
path_2.lineTo(size.width*0.002238806,size.height*0.1979439);
path_2.lineTo(size.width*0.002238806,size.height*0.1908445);
path_2.lineTo(size.width*-0.002238806,size.height*0.1908445);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.2050434);
path_2.lineTo(size.width*-0.002238806,size.height*0.2121429);
path_2.lineTo(size.width*0.002238806,size.height*0.2121429);
path_2.lineTo(size.width*0.002238806,size.height*0.2050434);
path_2.lineTo(size.width*-0.002238806,size.height*0.2050434);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.2192423);
path_2.lineTo(size.width*-0.002238806,size.height*0.2263418);
path_2.lineTo(size.width*0.002238806,size.height*0.2263418);
path_2.lineTo(size.width*0.002238806,size.height*0.2192423);
path_2.lineTo(size.width*-0.002238806,size.height*0.2192423);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.2334394);
path_2.lineTo(size.width*-0.002238806,size.height*0.2405389);
path_2.lineTo(size.width*0.002238806,size.height*0.2405389);
path_2.lineTo(size.width*0.002238806,size.height*0.2334394);
path_2.lineTo(size.width*-0.002238806,size.height*0.2334394);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.2476383);
path_2.lineTo(size.width*-0.002238806,size.height*0.2547378);
path_2.lineTo(size.width*0.002238806,size.height*0.2547378);
path_2.lineTo(size.width*0.002238806,size.height*0.2476383);
path_2.lineTo(size.width*-0.002238806,size.height*0.2476383);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.2618373);
path_2.lineTo(size.width*-0.002238806,size.height*0.2689367);
path_2.lineTo(size.width*0.002238806,size.height*0.2689367);
path_2.lineTo(size.width*0.002238806,size.height*0.2618373);
path_2.lineTo(size.width*-0.002238806,size.height*0.2618373);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.2760362);
path_2.lineTo(size.width*-0.002238806,size.height*0.2795859);
path_2.lineTo(size.width*0.002238806,size.height*0.2795859);
path_2.lineTo(size.width*0.002238806,size.height*0.2760362);
path_2.lineTo(size.width*-0.002238806,size.height*0.2760362);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.2795859);
path_2.cubicTo(size.width*-0.002238806,size.height*0.2797360,size.width*-0.002239191,size.height*0.2799005,size.width*-0.002227081,size.height*0.2800669);
path_2.lineTo(size.width*0.002246266,size.height*0.2799494);
path_2.cubicTo(size.width*0.002239191,size.height*0.2798517,size.width*0.002238806,size.height*0.2797486,size.width*0.002238806,size.height*0.2795859);
path_2.lineTo(size.width*-0.002238806,size.height*0.2795859);
path_2.close();
path_2.moveTo(size.width*-0.001980122,size.height*0.2811356);
path_2.cubicTo(size.width*-0.001929624,size.height*0.2812749,size.width*-0.001870119,size.height*0.2814250,size.width*-0.001800591,size.height*0.2815913);
path_2.lineTo(size.width*0.002538639,size.height*0.2809222);
path_2.cubicTo(size.width*0.002478137,size.height*0.2807776,size.width*0.002430519,size.height*0.2806564,size.width*0.002392770,size.height*0.2805533);
path_2.lineTo(size.width*-0.001980122,size.height*0.2811356);
path_2.close();
path_2.moveTo(size.width*-0.001800591,size.height*0.2815913);
path_2.cubicTo(size.width*-0.001642654,size.height*0.2819675,size.width*-0.001181104,size.height*0.2825642,size.width*-0.0006349493,size.height*0.2832315);
path_2.cubicTo(size.width*-0.00003756806,size.height*0.2839620,size.width*0.0008079224,size.height*0.2849476,size.width*0.001899382,size.height*0.2861935);
path_2.lineTo(size.width*0.005854239,size.height*0.2849222);
path_2.cubicTo(size.width*0.004767851,size.height*0.2836817,size.width*0.003946149,size.height*0.2827233,size.width*0.003377463,size.height*0.2820289);
path_2.cubicTo(size.width*0.003092627,size.height*0.2816799,size.width*0.002879633,size.height*0.2814069,size.width*0.002731385,size.height*0.2812043);
path_2.cubicTo(size.width*0.002565600,size.height*0.2809783,size.width*0.002531170,size.height*0.2809042,size.width*0.002538639,size.height*0.2809222);
path_2.lineTo(size.width*-0.001800591,size.height*0.2815913);
path_2.close();
path_2.moveTo(size.width*0.009439522,size.height*0.2946528);
path_2.cubicTo(size.width*0.01060875,size.height*0.2959548,size.width*0.01187281,size.height*0.2973617,size.width*0.01323245,size.height*0.2988752);
path_2.lineTo(size.width*0.01716507,size.height*0.2975787);
path_2.cubicTo(size.width*0.01580531,size.height*0.2960651,size.width*0.01454176,size.height*0.2946582,size.width*0.01337304,size.height*0.2933562);
path_2.lineTo(size.width*0.009439522,size.height*0.2946528);
path_2.close();
path_2.moveTo(size.width*0.01323245,size.height*0.2988752);
path_2.cubicTo(size.width*0.01363021,size.height*0.2993183,size.width*0.01398397,size.height*0.2997758,size.width*0.01429018,size.height*0.3002495);
path_2.lineTo(size.width*0.01845910,size.height*0.2992604);
path_2.cubicTo(size.width*0.01808427,size.height*0.2986799,size.width*0.01765146,size.height*0.2981193,size.width*0.01716507,size.height*0.2975787);
path_2.lineTo(size.width*0.01323245,size.height*0.2988752);
path_2.close();
path_2.moveTo(size.width*0.01551782,size.height*0.3031844);
path_2.cubicTo(size.width*0.01561928,size.height*0.3036817,size.width*0.01567164,size.height*0.3041881,size.width*0.01567164,size.height*0.3047016);
path_2.lineTo(size.width*0.02014925,size.height*0.3047016);
path_2.cubicTo(size.width*0.02014925,size.height*0.3040759,size.width*0.02008552,size.height*0.3034575,size.width*0.01996152,size.height*0.3028517);
path_2.lineTo(size.width*0.01551782,size.height*0.3031844);
path_2.close();
path_2.moveTo(size.width*0.01567164,size.height*0.3047016);
path_2.cubicTo(size.width*0.01567164,size.height*0.3052152,size.width*0.01561928,size.height*0.3057215,size.width*0.01551782,size.height*0.3062188);
path_2.lineTo(size.width*0.01996152,size.height*0.3065515);
path_2.cubicTo(size.width*0.02008552,size.height*0.3059458,size.width*0.02014925,size.height*0.3053273,size.width*0.02014925,size.height*0.3047016);
path_2.lineTo(size.width*0.01567164,size.height*0.3047016);
path_2.close();
path_2.moveTo(size.width*0.01429018,size.height*0.3091537);
path_2.cubicTo(size.width*0.01398397,size.height*0.3096275,size.width*0.01363021,size.height*0.3100850,size.width*0.01323245,size.height*0.3105280);
path_2.lineTo(size.width*0.01716507,size.height*0.3118246);
path_2.cubicTo(size.width*0.01765146,size.height*0.3112839,size.width*0.01808427,size.height*0.3107233,size.width*0.01845910,size.height*0.3101429);
path_2.lineTo(size.width*0.01429018,size.height*0.3091537);
path_2.close();
path_2.moveTo(size.width*0.01323245,size.height*0.3105280);
path_2.cubicTo(size.width*0.01187281,size.height*0.3120416,size.width*0.01060875,size.height*0.3134485,size.width*0.009439522,size.height*0.3147505);
path_2.lineTo(size.width*0.01337304,size.height*0.3160470);
path_2.cubicTo(size.width*0.01454176,size.height*0.3147450,size.width*0.01580531,size.height*0.3133382,size.width*0.01716507,size.height*0.3118246);
path_2.lineTo(size.width*0.01323245,size.height*0.3105280);
path_2.close();
path_2.moveTo(size.width*0.001899382,size.height*0.3232098);
path_2.cubicTo(size.width*0.0008079224,size.height*0.3244557,size.width*-0.00003756716,size.height*0.3254412,size.width*-0.0006349493,size.height*0.3261718);
path_2.cubicTo(size.width*-0.001181104,size.height*0.3268391,size.width*-0.001642654,size.height*0.3274358,size.width*-0.001800591,size.height*0.3278119);
path_2.lineTo(size.width*0.002538639,size.height*0.3284810);
path_2.cubicTo(size.width*0.002531173,size.height*0.3284991,size.width*0.002565600,size.height*0.3284250,size.width*0.002731385,size.height*0.3281989);
path_2.cubicTo(size.width*0.002879633,size.height*0.3279964,size.width*0.003092627,size.height*0.3277233,size.width*0.003377463,size.height*0.3273743);
path_2.cubicTo(size.width*0.003946149,size.height*0.3266799,size.width*0.004767851,size.height*0.3257215,size.width*0.005854239,size.height*0.3244810);
path_2.lineTo(size.width*0.001899382,size.height*0.3232098);
path_2.close();
path_2.moveTo(size.width*-0.001800591,size.height*0.3278119);
path_2.cubicTo(size.width*-0.001870119,size.height*0.3279783,size.width*-0.001929624,size.height*0.3281284,size.width*-0.001980122,size.height*0.3282676);
path_2.lineTo(size.width*0.002392770,size.height*0.3288499);
path_2.cubicTo(size.width*0.002430522,size.height*0.3287468,size.width*0.002478137,size.height*0.3286257,size.width*0.002538639,size.height*0.3284810);
path_2.lineTo(size.width*-0.001800591,size.height*0.3278119);
path_2.close();
path_2.moveTo(size.width*-0.002227081,size.height*0.3293363);
path_2.cubicTo(size.width*-0.002239191,size.height*0.3295027,size.width*-0.002238806,size.height*0.3296673,size.width*-0.002238806,size.height*0.3298174);
path_2.lineTo(size.width*0.002238806,size.height*0.3298174);
path_2.cubicTo(size.width*0.002238806,size.height*0.3296546,size.width*0.002239191,size.height*0.3295515,size.width*0.002246266,size.height*0.3294539);
path_2.lineTo(size.width*-0.002227081,size.height*0.3293363);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.3298174);
path_2.lineTo(size.width*-0.002238806,size.height*0.3334195);
path_2.lineTo(size.width*0.002238806,size.height*0.3334195);
path_2.lineTo(size.width*0.002238806,size.height*0.3298174);
path_2.lineTo(size.width*-0.002238806,size.height*0.3298174);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.3406257);
path_2.lineTo(size.width*-0.002238806,size.height*0.3478300);
path_2.lineTo(size.width*0.002238806,size.height*0.3478300);
path_2.lineTo(size.width*0.002238806,size.height*0.3406257);
path_2.lineTo(size.width*-0.002238806,size.height*0.3406257);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.3550344);
path_2.lineTo(size.width*-0.002238806,size.height*0.3622387);
path_2.lineTo(size.width*0.002238806,size.height*0.3622387);
path_2.lineTo(size.width*0.002238806,size.height*0.3550344);
path_2.lineTo(size.width*-0.002238806,size.height*0.3550344);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.3694430);
path_2.lineTo(size.width*-0.002238806,size.height*0.3766492);
path_2.lineTo(size.width*0.002238806,size.height*0.3766492);
path_2.lineTo(size.width*0.002238806,size.height*0.3694430);
path_2.lineTo(size.width*-0.002238806,size.height*0.3694430);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.3838535);
path_2.lineTo(size.width*-0.002238806,size.height*0.3910579);
path_2.lineTo(size.width*0.002238806,size.height*0.3910579);
path_2.lineTo(size.width*0.002238806,size.height*0.3838535);
path_2.lineTo(size.width*-0.002238806,size.height*0.3838535);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.3982622);
path_2.lineTo(size.width*-0.002238806,size.height*0.4054665);
path_2.lineTo(size.width*0.002238806,size.height*0.4054665);
path_2.lineTo(size.width*0.002238806,size.height*0.3982622);
path_2.lineTo(size.width*-0.002238806,size.height*0.3982622);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.4126727);
path_2.lineTo(size.width*-0.002238806,size.height*0.4198770);
path_2.lineTo(size.width*0.002238806,size.height*0.4198770);
path_2.lineTo(size.width*0.002238806,size.height*0.4126727);
path_2.lineTo(size.width*-0.002238806,size.height*0.4126727);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.4270814);
path_2.lineTo(size.width*-0.002238806,size.height*0.4342857);
path_2.lineTo(size.width*0.002238806,size.height*0.4342857);
path_2.lineTo(size.width*0.002238806,size.height*0.4270814);
path_2.lineTo(size.width*-0.002238806,size.height*0.4270814);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.4414919);
path_2.lineTo(size.width*-0.002238806,size.height*0.4486962);
path_2.lineTo(size.width*0.002238806,size.height*0.4486962);
path_2.lineTo(size.width*0.002238806,size.height*0.4414919);
path_2.lineTo(size.width*-0.002238806,size.height*0.4414919);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.4559005);
path_2.lineTo(size.width*-0.002238806,size.height*0.4631049);
path_2.lineTo(size.width*0.002238806,size.height*0.4631049);
path_2.lineTo(size.width*0.002238806,size.height*0.4559005);
path_2.lineTo(size.width*-0.002238806,size.height*0.4559005);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.4703092);
path_2.lineTo(size.width*-0.002238806,size.height*0.4775154);
path_2.lineTo(size.width*0.002238806,size.height*0.4775154);
path_2.lineTo(size.width*0.002238806,size.height*0.4703092);
path_2.lineTo(size.width*-0.002238806,size.height*0.4703092);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.4847197);
path_2.lineTo(size.width*-0.002238806,size.height*0.4919241);
path_2.lineTo(size.width*0.002238806,size.height*0.4919241);
path_2.lineTo(size.width*0.002238806,size.height*0.4847197);
path_2.lineTo(size.width*-0.002238806,size.height*0.4847197);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.4991284);
path_2.lineTo(size.width*-0.002238806,size.height*0.5063327);
path_2.lineTo(size.width*0.002238806,size.height*0.5063327);
path_2.lineTo(size.width*0.002238806,size.height*0.4991284);
path_2.lineTo(size.width*-0.002238806,size.height*0.4991284);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.5135389);
path_2.lineTo(size.width*-0.002238806,size.height*0.5207432);
path_2.lineTo(size.width*0.002238806,size.height*0.5207432);
path_2.lineTo(size.width*0.002238806,size.height*0.5135389);
path_2.lineTo(size.width*-0.002238806,size.height*0.5135389);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.5279476);
path_2.lineTo(size.width*-0.002238806,size.height*0.5351519);
path_2.lineTo(size.width*0.002238806,size.height*0.5351519);
path_2.lineTo(size.width*0.002238806,size.height*0.5279476);
path_2.lineTo(size.width*-0.002238806,size.height*0.5279476);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.5423580);
path_2.lineTo(size.width*-0.002238806,size.height*0.5495624);
path_2.lineTo(size.width*0.002238806,size.height*0.5495624);
path_2.lineTo(size.width*0.002238806,size.height*0.5423580);
path_2.lineTo(size.width*-0.002238806,size.height*0.5423580);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.5567667);
path_2.lineTo(size.width*-0.002238806,size.height*0.5639711);
path_2.lineTo(size.width*0.002238806,size.height*0.5639711);
path_2.lineTo(size.width*0.002238806,size.height*0.5567667);
path_2.lineTo(size.width*-0.002238806,size.height*0.5567667);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.5711754);
path_2.lineTo(size.width*-0.002238806,size.height*0.5783816);
path_2.lineTo(size.width*0.002238806,size.height*0.5783816);
path_2.lineTo(size.width*0.002238806,size.height*0.5711754);
path_2.lineTo(size.width*-0.002238806,size.height*0.5711754);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.5855859);
path_2.lineTo(size.width*-0.002238806,size.height*0.5927902);
path_2.lineTo(size.width*0.002238806,size.height*0.5927902);
path_2.lineTo(size.width*0.002238806,size.height*0.5855859);
path_2.lineTo(size.width*-0.002238806,size.height*0.5855859);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.5999946);
path_2.lineTo(size.width*-0.002238806,size.height*0.6071989);
path_2.lineTo(size.width*0.002238806,size.height*0.6071989);
path_2.lineTo(size.width*0.002238806,size.height*0.5999946);
path_2.lineTo(size.width*-0.002238806,size.height*0.5999946);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.6144051);
path_2.lineTo(size.width*-0.002238806,size.height*0.6216094);
path_2.lineTo(size.width*0.002238806,size.height*0.6216094);
path_2.lineTo(size.width*0.002238806,size.height*0.6144051);
path_2.lineTo(size.width*-0.002238806,size.height*0.6144051);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.6288137);
path_2.lineTo(size.width*-0.002238806,size.height*0.6360181);
path_2.lineTo(size.width*0.002238806,size.height*0.6360181);
path_2.lineTo(size.width*0.002238806,size.height*0.6288137);
path_2.lineTo(size.width*-0.002238806,size.height*0.6288137);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.6432224);
path_2.lineTo(size.width*-0.002238806,size.height*0.6504286);
path_2.lineTo(size.width*0.002238806,size.height*0.6504286);
path_2.lineTo(size.width*0.002238806,size.height*0.6432224);
path_2.lineTo(size.width*-0.002238806,size.height*0.6432224);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.6576329);
path_2.lineTo(size.width*-0.002238806,size.height*0.6648373);
path_2.lineTo(size.width*0.002238806,size.height*0.6648373);
path_2.lineTo(size.width*0.002238806,size.height*0.6576329);
path_2.lineTo(size.width*-0.002238806,size.height*0.6576329);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.6720416);
path_2.lineTo(size.width*-0.002238806,size.height*0.6792459);
path_2.lineTo(size.width*0.002238806,size.height*0.6792459);
path_2.lineTo(size.width*0.002238806,size.height*0.6720416);
path_2.lineTo(size.width*-0.002238806,size.height*0.6720416);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.6864521);
path_2.lineTo(size.width*-0.002238806,size.height*0.6936564);
path_2.lineTo(size.width*0.002238806,size.height*0.6936564);
path_2.lineTo(size.width*0.002238806,size.height*0.6864521);
path_2.lineTo(size.width*-0.002238806,size.height*0.6864521);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.7008608);
path_2.lineTo(size.width*-0.002238806,size.height*0.7080651);
path_2.lineTo(size.width*0.002238806,size.height*0.7080651);
path_2.lineTo(size.width*0.002238806,size.height*0.7008608);
path_2.lineTo(size.width*-0.002238806,size.height*0.7008608);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.7152712);
path_2.lineTo(size.width*-0.002238806,size.height*0.7224756);
path_2.lineTo(size.width*0.002238806,size.height*0.7224756);
path_2.lineTo(size.width*0.002238806,size.height*0.7152712);
path_2.lineTo(size.width*-0.002238806,size.height*0.7152712);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.7296799);
path_2.lineTo(size.width*-0.002238806,size.height*0.7368843);
path_2.lineTo(size.width*0.002238806,size.height*0.7368843);
path_2.lineTo(size.width*0.002238806,size.height*0.7296799);
path_2.lineTo(size.width*-0.002238806,size.height*0.7296799);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.7440886);
path_2.lineTo(size.width*-0.002238806,size.height*0.7512948);
path_2.lineTo(size.width*0.002238806,size.height*0.7512948);
path_2.lineTo(size.width*0.002238806,size.height*0.7440886);
path_2.lineTo(size.width*-0.002238806,size.height*0.7440886);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.7584991);
path_2.lineTo(size.width*-0.002238806,size.height*0.7657034);
path_2.lineTo(size.width*0.002238806,size.height*0.7657034);
path_2.lineTo(size.width*0.002238806,size.height*0.7584991);
path_2.lineTo(size.width*-0.002238806,size.height*0.7584991);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.7729078);
path_2.lineTo(size.width*-0.002238806,size.height*0.7801121);
path_2.lineTo(size.width*0.002238806,size.height*0.7801121);
path_2.lineTo(size.width*0.002238806,size.height*0.7729078);
path_2.lineTo(size.width*-0.002238806,size.height*0.7729078);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.7873183);
path_2.lineTo(size.width*-0.002238806,size.height*0.7945226);
path_2.lineTo(size.width*0.002238806,size.height*0.7945226);
path_2.lineTo(size.width*0.002238806,size.height*0.7873183);
path_2.lineTo(size.width*-0.002238806,size.height*0.7873183);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.8017269);
path_2.lineTo(size.width*-0.002238806,size.height*0.8089313);
path_2.lineTo(size.width*0.002238806,size.height*0.8089313);
path_2.lineTo(size.width*0.002238806,size.height*0.8017269);
path_2.lineTo(size.width*-0.002238806,size.height*0.8017269);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.8161356);
path_2.lineTo(size.width*-0.002238806,size.height*0.8233418);
path_2.lineTo(size.width*0.002238806,size.height*0.8233418);
path_2.lineTo(size.width*0.002238806,size.height*0.8161356);
path_2.lineTo(size.width*-0.002238806,size.height*0.8161356);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.8305461);
path_2.lineTo(size.width*-0.002238806,size.height*0.8377505);
path_2.lineTo(size.width*0.002238806,size.height*0.8377505);
path_2.lineTo(size.width*0.002238806,size.height*0.8305461);
path_2.lineTo(size.width*-0.002238806,size.height*0.8305461);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.8449548);
path_2.lineTo(size.width*-0.002238806,size.height*0.8521609);
path_2.lineTo(size.width*0.002238806,size.height*0.8521609);
path_2.lineTo(size.width*0.002238806,size.height*0.8449548);
path_2.lineTo(size.width*-0.002238806,size.height*0.8449548);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.8593653);
path_2.lineTo(size.width*-0.002238806,size.height*0.8665696);
path_2.lineTo(size.width*0.002238806,size.height*0.8665696);
path_2.lineTo(size.width*0.002238806,size.height*0.8593653);
path_2.lineTo(size.width*-0.002238806,size.height*0.8593653);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.8737740);
path_2.lineTo(size.width*-0.002238806,size.height*0.8809783);
path_2.lineTo(size.width*0.002238806,size.height*0.8809783);
path_2.lineTo(size.width*0.002238806,size.height*0.8737740);
path_2.lineTo(size.width*-0.002238806,size.height*0.8737740);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.8881844);
path_2.lineTo(size.width*-0.002238806,size.height*0.8953888);
path_2.lineTo(size.width*0.002238806,size.height*0.8953888);
path_2.lineTo(size.width*0.002238806,size.height*0.8881844);
path_2.lineTo(size.width*-0.002238806,size.height*0.8881844);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.9025931);
path_2.lineTo(size.width*-0.002238806,size.height*0.9097975);
path_2.lineTo(size.width*0.002238806,size.height*0.9097975);
path_2.lineTo(size.width*0.002238806,size.height*0.9025931);
path_2.lineTo(size.width*-0.002238806,size.height*0.9025931);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.9170036);
path_2.lineTo(size.width*-0.002238806,size.height*0.9242080);
path_2.lineTo(size.width*0.002238806,size.height*0.9242080);
path_2.lineTo(size.width*0.002238806,size.height*0.9170036);
path_2.lineTo(size.width*-0.002238806,size.height*0.9170036);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.9314123);
path_2.lineTo(size.width*-0.002238806,size.height*0.9386166);
path_2.lineTo(size.width*0.002238806,size.height*0.9386166);
path_2.lineTo(size.width*0.002238806,size.height*0.9314123);
path_2.lineTo(size.width*-0.002238806,size.height*0.9314123);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.9458210);
path_2.lineTo(size.width*-0.002238806,size.height*0.9530271);
path_2.lineTo(size.width*0.002238806,size.height*0.9530271);
path_2.lineTo(size.width*0.002238806,size.height*0.9458210);
path_2.lineTo(size.width*-0.002238806,size.height*0.9458210);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.9602315);
path_2.lineTo(size.width*-0.002238806,size.height*0.9638336);
path_2.lineTo(size.width*0.002238806,size.height*0.9638336);
path_2.lineTo(size.width*0.002238806,size.height*0.9602315);
path_2.lineTo(size.width*-0.002238806,size.height*0.9602315);
path_2.close();
path_2.moveTo(size.width*-0.002238806,size.height*0.9638336);
path_2.cubicTo(size.width*-0.002238806,size.height*0.9652260,size.width*-0.002238806,size.height*0.9665642,size.width*-0.002234027,size.height*0.9678499);
path_2.lineTo(size.width*0.002243573,size.height*0.9678427);
path_2.cubicTo(size.width*0.002238806,size.height*0.9665624,size.width*0.002238806,size.height*0.9652278,size.width*0.002238806,size.height*0.9638336);
path_2.lineTo(size.width*-0.002238806,size.height*0.9638336);
path_2.close();
path_2.moveTo(size.width*-0.002066934,size.height*0.9758987);
path_2.cubicTo(size.width*-0.001915887,size.height*0.9789566,size.width*-0.001631000,size.height*0.9816510,size.width*-0.001086591,size.height*0.9840307);
path_2.lineTo(size.width*0.003348687,size.height*0.9836600);
path_2.cubicTo(size.width*0.002835770,size.height*0.9814159,size.width*0.002557537,size.height*0.9788318,size.width*0.002408672,size.height*0.9758174);
path_2.lineTo(size.width*-0.002066934,size.height*0.9758987);
path_2.close();
path_2.moveTo(size.width*0.002846161,size.height*0.9921374);
path_2.cubicTo(size.width*0.004006000,size.height*0.9934467,size.width*0.005427224,size.height*0.9946130,size.width*0.007160030,size.height*0.9956618);
path_2.lineTo(size.width*0.01032615,size.height*0.9937450);
path_2.cubicTo(size.width*0.008909403,size.height*0.9928861,size.width*0.007748418,size.height*0.9919349,size.width*0.006791104,size.height*0.9908553);
path_2.lineTo(size.width*0.002846161,size.height*0.9921374);
path_2.close();
path_2.moveTo(size.width*0.007160000,size.height*0.9956618);
path_2.cubicTo(size.width*0.008892776,size.height*0.9967125,size.width*0.01081779,size.height*0.9975732,size.width*0.01297794,size.height*0.9982767);
path_2.lineTo(size.width*0.01509606,size.height*0.9958861);
path_2.cubicTo(size.width*0.01331310,size.height*0.9953056,size.width*0.01174290,size.height*0.9946022,size.width*0.01032615,size.height*0.9937450);
path_2.lineTo(size.width*0.007160000,size.height*0.9956618);
path_2.close();
path_2.moveTo(size.width*0.02636027,size.height*1.000658);
path_2.cubicTo(size.width*0.03029075,size.height*1.000987,size.width*0.03473701,size.height*1.001161,size.width*0.03978418,size.height*1.001251);
path_2.lineTo(size.width*0.03991821,size.height*0.9985407);
path_2.cubicTo(size.width*0.03494388,size.height*0.9984503,size.width*0.03067761,size.height*0.9982821,size.width*0.02697460,size.height*0.9979711);
path_2.lineTo(size.width*0.02636027,size.height*1.000658);
path_2.close();
path_2.moveTo(size.width*0.05307254,size.height*1.001353);
path_2.cubicTo(size.width*0.05519284,size.height*1.001356,size.width*0.05740179,size.height*1.001356,size.width*0.05970149,size.height*1.001356);
path_2.lineTo(size.width*0.05970149,size.height*0.9986438);
path_2.cubicTo(size.width*0.05740060,size.height*0.9986438,size.width*0.05519701,size.height*0.9986438,size.width*0.05308269,size.height*0.9986401);
path_2.lineTo(size.width*0.05307254,size.height*1.001353);
path_2.close();
path_2.moveTo(size.width*0.05970149,size.height*1.001356);
path_2.lineTo(size.width*0.06565134,size.height*1.001356);
path_2.lineTo(size.width*0.06565134,size.height*0.9986438);
path_2.lineTo(size.width*0.05970149,size.height*0.9986438);
path_2.lineTo(size.width*0.05970149,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.07755134,size.height*1.001356);
path_2.lineTo(size.width*0.08945134,size.height*1.001356);
path_2.lineTo(size.width*0.08945134,size.height*0.9986438);
path_2.lineTo(size.width*0.07755134,size.height*0.9986438);
path_2.lineTo(size.width*0.07755134,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.1013513,size.height*1.001356);
path_2.lineTo(size.width*0.1132513,size.height*1.001356);
path_2.lineTo(size.width*0.1132513,size.height*0.9986438);
path_2.lineTo(size.width*0.1013513,size.height*0.9986438);
path_2.lineTo(size.width*0.1013513,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.1251513,size.height*1.001356);
path_2.lineTo(size.width*0.1370513,size.height*1.001356);
path_2.lineTo(size.width*0.1370513,size.height*0.9986438);
path_2.lineTo(size.width*0.1251513,size.height*0.9986438);
path_2.lineTo(size.width*0.1251513,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.1489513,size.height*1.001356);
path_2.lineTo(size.width*0.1608510,size.height*1.001356);
path_2.lineTo(size.width*0.1608510,size.height*0.9986438);
path_2.lineTo(size.width*0.1489513,size.height*0.9986438);
path_2.lineTo(size.width*0.1489513,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.1727510,size.height*1.001356);
path_2.lineTo(size.width*0.1846510,size.height*1.001356);
path_2.lineTo(size.width*0.1846510,size.height*0.9986438);
path_2.lineTo(size.width*0.1727510,size.height*0.9986438);
path_2.lineTo(size.width*0.1727510,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.1965510,size.height*1.001356);
path_2.lineTo(size.width*0.2084510,size.height*1.001356);
path_2.lineTo(size.width*0.2084510,size.height*0.9986438);
path_2.lineTo(size.width*0.1965510,size.height*0.9986438);
path_2.lineTo(size.width*0.1965510,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.2203510,size.height*1.001356);
path_2.lineTo(size.width*0.2322510,size.height*1.001356);
path_2.lineTo(size.width*0.2322510,size.height*0.9986438);
path_2.lineTo(size.width*0.2203510,size.height*0.9986438);
path_2.lineTo(size.width*0.2203510,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.2441510,size.height*1.001356);
path_2.lineTo(size.width*0.2560507,size.height*1.001356);
path_2.lineTo(size.width*0.2560507,size.height*0.9986438);
path_2.lineTo(size.width*0.2441510,size.height*0.9986438);
path_2.lineTo(size.width*0.2441510,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.2679507,size.height*1.001356);
path_2.lineTo(size.width*0.2798507,size.height*1.001356);
path_2.lineTo(size.width*0.2798507,size.height*0.9986438);
path_2.lineTo(size.width*0.2679507,size.height*0.9986438);
path_2.lineTo(size.width*0.2679507,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.2917507,size.height*1.001356);
path_2.lineTo(size.width*0.3036507,size.height*1.001356);
path_2.lineTo(size.width*0.3036507,size.height*0.9986438);
path_2.lineTo(size.width*0.2917507,size.height*0.9986438);
path_2.lineTo(size.width*0.2917507,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.3155493,size.height*1.001356);
path_2.lineTo(size.width*0.3274507,size.height*1.001356);
path_2.lineTo(size.width*0.3274507,size.height*0.9986438);
path_2.lineTo(size.width*0.3155493,size.height*0.9986438);
path_2.lineTo(size.width*0.3155493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.3393493,size.height*1.001356);
path_2.lineTo(size.width*0.3512507,size.height*1.001356);
path_2.lineTo(size.width*0.3512507,size.height*0.9986438);
path_2.lineTo(size.width*0.3393493,size.height*0.9986438);
path_2.lineTo(size.width*0.3393493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.3631493,size.height*1.001356);
path_2.lineTo(size.width*0.3750507,size.height*1.001356);
path_2.lineTo(size.width*0.3750507,size.height*0.9986438);
path_2.lineTo(size.width*0.3631493,size.height*0.9986438);
path_2.lineTo(size.width*0.3631493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.3869493,size.height*1.001356);
path_2.lineTo(size.width*0.3988507,size.height*1.001356);
path_2.lineTo(size.width*0.3988507,size.height*0.9986438);
path_2.lineTo(size.width*0.3869493,size.height*0.9986438);
path_2.lineTo(size.width*0.3869493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.4107493,size.height*1.001356);
path_2.lineTo(size.width*0.4226507,size.height*1.001356);
path_2.lineTo(size.width*0.4226507,size.height*0.9986438);
path_2.lineTo(size.width*0.4107493,size.height*0.9986438);
path_2.lineTo(size.width*0.4107493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.4345493,size.height*1.001356);
path_2.lineTo(size.width*0.4464507,size.height*1.001356);
path_2.lineTo(size.width*0.4464507,size.height*0.9986438);
path_2.lineTo(size.width*0.4345493,size.height*0.9986438);
path_2.lineTo(size.width*0.4345493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.4583493,size.height*1.001356);
path_2.lineTo(size.width*0.4702507,size.height*1.001356);
path_2.lineTo(size.width*0.4702507,size.height*0.9986438);
path_2.lineTo(size.width*0.4583493,size.height*0.9986438);
path_2.lineTo(size.width*0.4583493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.4821493,size.height*1.001356);
path_2.lineTo(size.width*0.4940507,size.height*1.001356);
path_2.lineTo(size.width*0.4940507,size.height*0.9986438);
path_2.lineTo(size.width*0.4821493,size.height*0.9986438);
path_2.lineTo(size.width*0.4821493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.5059493,size.height*1.001356);
path_2.lineTo(size.width*0.5178507,size.height*1.001356);
path_2.lineTo(size.width*0.5178507,size.height*0.9986438);
path_2.lineTo(size.width*0.5059493,size.height*0.9986438);
path_2.lineTo(size.width*0.5059493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.5297493,size.height*1.001356);
path_2.lineTo(size.width*0.5416507,size.height*1.001356);
path_2.lineTo(size.width*0.5416507,size.height*0.9986438);
path_2.lineTo(size.width*0.5297493,size.height*0.9986438);
path_2.lineTo(size.width*0.5297493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.5535493,size.height*1.001356);
path_2.lineTo(size.width*0.5654507,size.height*1.001356);
path_2.lineTo(size.width*0.5654507,size.height*0.9986438);
path_2.lineTo(size.width*0.5535493,size.height*0.9986438);
path_2.lineTo(size.width*0.5535493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.5773493,size.height*1.001356);
path_2.lineTo(size.width*0.5892507,size.height*1.001356);
path_2.lineTo(size.width*0.5892507,size.height*0.9986438);
path_2.lineTo(size.width*0.5773493,size.height*0.9986438);
path_2.lineTo(size.width*0.5773493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.6011493,size.height*1.001356);
path_2.lineTo(size.width*0.6130507,size.height*1.001356);
path_2.lineTo(size.width*0.6130507,size.height*0.9986438);
path_2.lineTo(size.width*0.6011493,size.height*0.9986438);
path_2.lineTo(size.width*0.6011493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.6249493,size.height*1.001356);
path_2.lineTo(size.width*0.6368507,size.height*1.001356);
path_2.lineTo(size.width*0.6368507,size.height*0.9986438);
path_2.lineTo(size.width*0.6249493,size.height*0.9986438);
path_2.lineTo(size.width*0.6249493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.6487493,size.height*1.001356);
path_2.lineTo(size.width*0.6606507,size.height*1.001356);
path_2.lineTo(size.width*0.6606507,size.height*0.9986438);
path_2.lineTo(size.width*0.6487493,size.height*0.9986438);
path_2.lineTo(size.width*0.6487493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.6725493,size.height*1.001356);
path_2.lineTo(size.width*0.6844478,size.height*1.001356);
path_2.lineTo(size.width*0.6844478,size.height*0.9986438);
path_2.lineTo(size.width*0.6725493,size.height*0.9986438);
path_2.lineTo(size.width*0.6725493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.6963493,size.height*1.001356);
path_2.lineTo(size.width*0.7082478,size.height*1.001356);
path_2.lineTo(size.width*0.7082478,size.height*0.9986438);
path_2.lineTo(size.width*0.6963493,size.height*0.9986438);
path_2.lineTo(size.width*0.6963493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.7201493,size.height*1.001356);
path_2.lineTo(size.width*0.7320478,size.height*1.001356);
path_2.lineTo(size.width*0.7320478,size.height*0.9986438);
path_2.lineTo(size.width*0.7201493,size.height*0.9986438);
path_2.lineTo(size.width*0.7201493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.7439493,size.height*1.001356);
path_2.lineTo(size.width*0.7558478,size.height*1.001356);
path_2.lineTo(size.width*0.7558478,size.height*0.9986438);
path_2.lineTo(size.width*0.7439493,size.height*0.9986438);
path_2.lineTo(size.width*0.7439493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.7677493,size.height*1.001356);
path_2.lineTo(size.width*0.7796478,size.height*1.001356);
path_2.lineTo(size.width*0.7796478,size.height*0.9986438);
path_2.lineTo(size.width*0.7677493,size.height*0.9986438);
path_2.lineTo(size.width*0.7677493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.7915493,size.height*1.001356);
path_2.lineTo(size.width*0.8034478,size.height*1.001356);
path_2.lineTo(size.width*0.8034478,size.height*0.9986438);
path_2.lineTo(size.width*0.7915493,size.height*0.9986438);
path_2.lineTo(size.width*0.7915493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.8153493,size.height*1.001356);
path_2.lineTo(size.width*0.8272478,size.height*1.001356);
path_2.lineTo(size.width*0.8272478,size.height*0.9986438);
path_2.lineTo(size.width*0.8153493,size.height*0.9986438);
path_2.lineTo(size.width*0.8153493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.8391493,size.height*1.001356);
path_2.lineTo(size.width*0.8510478,size.height*1.001356);
path_2.lineTo(size.width*0.8510478,size.height*0.9986438);
path_2.lineTo(size.width*0.8391493,size.height*0.9986438);
path_2.lineTo(size.width*0.8391493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.8629493,size.height*1.001356);
path_2.lineTo(size.width*0.8748478,size.height*1.001356);
path_2.lineTo(size.width*0.8748478,size.height*0.9986438);
path_2.lineTo(size.width*0.8629493,size.height*0.9986438);
path_2.lineTo(size.width*0.8629493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.8867493,size.height*1.001356);
path_2.lineTo(size.width*0.8986478,size.height*1.001356);
path_2.lineTo(size.width*0.8986478,size.height*0.9986438);
path_2.lineTo(size.width*0.8867493,size.height*0.9986438);
path_2.lineTo(size.width*0.8867493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.9105493,size.height*1.001356);
path_2.lineTo(size.width*0.9224478,size.height*1.001356);
path_2.lineTo(size.width*0.9224478,size.height*0.9986438);
path_2.lineTo(size.width*0.9105493,size.height*0.9986438);
path_2.lineTo(size.width*0.9105493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.9343493,size.height*1.001356);
path_2.lineTo(size.width*0.9402985,size.height*1.001356);
path_2.lineTo(size.width*0.9402985,size.height*0.9986438);
path_2.lineTo(size.width*0.9343493,size.height*0.9986438);
path_2.lineTo(size.width*0.9343493,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.9402985,size.height*1.001356);
path_2.cubicTo(size.width*0.9425970,size.height*1.001356,size.width*0.9448060,size.height*1.001356,size.width*0.9469284,size.height*1.001353);
path_2.lineTo(size.width*0.9469164,size.height*0.9986401);
path_2.cubicTo(size.width*0.9448030,size.height*0.9986438,size.width*0.9426000,size.height*0.9986438,size.width*0.9402985,size.height*0.9986438);
path_2.lineTo(size.width*0.9402985,size.height*1.001356);
path_2.close();
path_2.moveTo(size.width*0.9602149,size.height*1.001251);
path_2.cubicTo(size.width*0.9652627,size.height*1.001161,size.width*0.9697104,size.height*1.000987,size.width*0.9736388,size.height*1.000658);
path_2.lineTo(size.width*0.9730269,size.height*0.9979711);
path_2.cubicTo(size.width*0.9693224,size.height*0.9982821,size.width*0.9650567,size.height*0.9984503,size.width*0.9600806,size.height*0.9985407);
path_2.lineTo(size.width*0.9602149,size.height*1.001251);
path_2.close();
path_2.moveTo(size.width*0.9870209,size.height*0.9982767);
path_2.cubicTo(size.width*0.9891821,size.height*0.9975732,size.width*0.9911075,size.height*0.9967125,size.width*0.9928388,size.height*0.9956618);
path_2.lineTo(size.width*0.9896746,size.height*0.9937450);
path_2.cubicTo(size.width*0.9882567,size.height*0.9946022,size.width*0.9866866,size.height*0.9953056,size.width*0.9849045,size.height*0.9958861);
path_2.lineTo(size.width*0.9870209,size.height*0.9982767);
path_2.close();
path_2.moveTo(size.width*0.9928388,size.height*0.9956618);
path_2.cubicTo(size.width*0.9945731,size.height*0.9946130,size.width*0.9959940,size.height*0.9934467,size.width*0.9971552,size.height*0.9921374);
path_2.lineTo(size.width*0.9932090,size.height*0.9908553);
path_2.cubicTo(size.width*0.9922507,size.height*0.9919349,size.width*0.9910896,size.height*0.9928861,size.width*0.9896746,size.height*0.9937450);
path_2.lineTo(size.width*0.9928388,size.height*0.9956618);
path_2.close();
path_2.moveTo(size.width*1.001087,size.height*0.9840307);
path_2.cubicTo(size.width*1.001630,size.height*0.9816510,size.width*1.001916,size.height*0.9789566,size.width*1.002066,size.height*0.9758987);
path_2.lineTo(size.width*0.9975910,size.height*0.9758174);
path_2.cubicTo(size.width*0.9974418,size.height*0.9788318,size.width*0.9971642,size.height*0.9814159,size.width*0.9966507,size.height*0.9836582);
path_2.lineTo(size.width*1.001087,size.height*0.9840307);
path_2.close();
path_2.moveTo(size.width*1.002233,size.height*0.9678499);
path_2.cubicTo(size.width*1.002239,size.height*0.9665642,size.width*1.002239,size.height*0.9652260,size.width*1.002239,size.height*0.9638336);
path_2.lineTo(size.width*0.9977612,size.height*0.9638336);
path_2.cubicTo(size.width*0.9977612,size.height*0.9652278,size.width*0.9977612,size.height*0.9665624,size.width*0.9977552,size.height*0.9678427);
path_2.lineTo(size.width*1.002233,size.height*0.9678499);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.9638336);
path_2.lineTo(size.width*1.002239,size.height*0.9602423);
path_2.lineTo(size.width*0.9977612,size.height*0.9602423);
path_2.lineTo(size.width*0.9977612,size.height*0.9638336);
path_2.lineTo(size.width*1.002239,size.height*0.9638336);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.9530597);
path_2.lineTo(size.width*1.002239,size.height*0.9458770);
path_2.lineTo(size.width*0.9977612,size.height*0.9458770);
path_2.lineTo(size.width*0.9977612,size.height*0.9530597);
path_2.lineTo(size.width*1.002239,size.height*0.9530597);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.9386944);
path_2.lineTo(size.width*1.002239,size.height*0.9315136);
path_2.lineTo(size.width*0.9977612,size.height*0.9315136);
path_2.lineTo(size.width*0.9977612,size.height*0.9386944);
path_2.lineTo(size.width*1.002239,size.height*0.9386944);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.9243309);
path_2.lineTo(size.width*1.002239,size.height*0.9171483);
path_2.lineTo(size.width*0.9977612,size.height*0.9171483);
path_2.lineTo(size.width*0.9977612,size.height*0.9243309);
path_2.lineTo(size.width*1.002239,size.height*0.9243309);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.9099656);
path_2.lineTo(size.width*1.002239,size.height*0.9027830);
path_2.lineTo(size.width*0.9977612,size.height*0.9027830);
path_2.lineTo(size.width*0.9977612,size.height*0.9099656);
path_2.lineTo(size.width*1.002239,size.height*0.9099656);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.8956004);
path_2.lineTo(size.width*1.002239,size.height*0.8884177);
path_2.lineTo(size.width*0.9977612,size.height*0.8884177);
path_2.lineTo(size.width*0.9977612,size.height*0.8956004);
path_2.lineTo(size.width*1.002239,size.height*0.8956004);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.8812351);
path_2.lineTo(size.width*1.002239,size.height*0.8740524);
path_2.lineTo(size.width*0.9977612,size.height*0.8740524);
path_2.lineTo(size.width*0.9977612,size.height*0.8812351);
path_2.lineTo(size.width*1.002239,size.height*0.8812351);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.8668716);
path_2.lineTo(size.width*1.002239,size.height*0.8596890);
path_2.lineTo(size.width*0.9977612,size.height*0.8596890);
path_2.lineTo(size.width*0.9977612,size.height*0.8668716);
path_2.lineTo(size.width*1.002239,size.height*0.8668716);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.8525063);
path_2.lineTo(size.width*1.002239,size.height*0.8453237);
path_2.lineTo(size.width*0.9977612,size.height*0.8453237);
path_2.lineTo(size.width*0.9977612,size.height*0.8525063);
path_2.lineTo(size.width*1.002239,size.height*0.8525063);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.8381410);
path_2.lineTo(size.width*1.002239,size.height*0.8309584);
path_2.lineTo(size.width*0.9977612,size.height*0.8309584);
path_2.lineTo(size.width*0.9977612,size.height*0.8381410);
path_2.lineTo(size.width*1.002239,size.height*0.8381410);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.8237758);
path_2.lineTo(size.width*1.002239,size.height*0.8165931);
path_2.lineTo(size.width*0.9977612,size.height*0.8165931);
path_2.lineTo(size.width*0.9977612,size.height*0.8237758);
path_2.lineTo(size.width*1.002239,size.height*0.8237758);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.8094123);
path_2.lineTo(size.width*1.002239,size.height*0.8022297);
path_2.lineTo(size.width*0.9977612,size.height*0.8022297);
path_2.lineTo(size.width*0.9977612,size.height*0.8094123);
path_2.lineTo(size.width*1.002239,size.height*0.8094123);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.7950470);
path_2.lineTo(size.width*1.002239,size.height*0.7878644);
path_2.lineTo(size.width*0.9977612,size.height*0.7878644);
path_2.lineTo(size.width*0.9977612,size.height*0.7950470);
path_2.lineTo(size.width*1.002239,size.height*0.7950470);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.7806817);
path_2.lineTo(size.width*1.002239,size.height*0.7734991);
path_2.lineTo(size.width*0.9977612,size.height*0.7734991);
path_2.lineTo(size.width*0.9977612,size.height*0.7806817);
path_2.lineTo(size.width*1.002239,size.height*0.7806817);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.7663165);
path_2.lineTo(size.width*1.002239,size.height*0.7591338);
path_2.lineTo(size.width*0.9977612,size.height*0.7591338);
path_2.lineTo(size.width*0.9977612,size.height*0.7663165);
path_2.lineTo(size.width*1.002239,size.height*0.7663165);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.7519512);
path_2.lineTo(size.width*1.002239,size.height*0.7447703);
path_2.lineTo(size.width*0.9977612,size.height*0.7447703);
path_2.lineTo(size.width*0.9977612,size.height*0.7519512);
path_2.lineTo(size.width*1.002239,size.height*0.7519512);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.7375877);
path_2.lineTo(size.width*1.002239,size.height*0.7304051);
path_2.lineTo(size.width*0.9977612,size.height*0.7304051);
path_2.lineTo(size.width*0.9977612,size.height*0.7375877);
path_2.lineTo(size.width*1.002239,size.height*0.7375877);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.7232224);
path_2.lineTo(size.width*1.002239,size.height*0.7160398);
path_2.lineTo(size.width*0.9977612,size.height*0.7160398);
path_2.lineTo(size.width*0.9977612,size.height*0.7232224);
path_2.lineTo(size.width*1.002239,size.height*0.7232224);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.7088571);
path_2.lineTo(size.width*1.002239,size.height*0.7016745);
path_2.lineTo(size.width*0.9977612,size.height*0.7016745);
path_2.lineTo(size.width*0.9977612,size.height*0.7088571);
path_2.lineTo(size.width*1.002239,size.height*0.7088571);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.6944919);
path_2.lineTo(size.width*1.002239,size.height*0.6873092);
path_2.lineTo(size.width*0.9977612,size.height*0.6873092);
path_2.lineTo(size.width*0.9977612,size.height*0.6944919);
path_2.lineTo(size.width*1.002239,size.height*0.6944919);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.6801284);
path_2.lineTo(size.width*1.002239,size.height*0.6729458);
path_2.lineTo(size.width*0.9977612,size.height*0.6729458);
path_2.lineTo(size.width*0.9977612,size.height*0.6801284);
path_2.lineTo(size.width*1.002239,size.height*0.6801284);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.6657631);
path_2.lineTo(size.width*1.002239,size.height*0.6585805);
path_2.lineTo(size.width*0.9977612,size.height*0.6585805);
path_2.lineTo(size.width*0.9977612,size.height*0.6657631);
path_2.lineTo(size.width*1.002239,size.height*0.6657631);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.6513978);
path_2.lineTo(size.width*1.002239,size.height*0.6442152);
path_2.lineTo(size.width*0.9977612,size.height*0.6442152);
path_2.lineTo(size.width*0.9977612,size.height*0.6513978);
path_2.lineTo(size.width*1.002239,size.height*0.6513978);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.6370325);
path_2.lineTo(size.width*1.002239,size.height*0.6298499);
path_2.lineTo(size.width*0.9977612,size.height*0.6298499);
path_2.lineTo(size.width*0.9977612,size.height*0.6370325);
path_2.lineTo(size.width*1.002239,size.height*0.6370325);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.6226691);
path_2.lineTo(size.width*1.002239,size.height*0.6154864);
path_2.lineTo(size.width*0.9977612,size.height*0.6154864);
path_2.lineTo(size.width*0.9977612,size.height*0.6226691);
path_2.lineTo(size.width*1.002239,size.height*0.6226691);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.6083038);
path_2.lineTo(size.width*1.002239,size.height*0.6011212);
path_2.lineTo(size.width*0.9977612,size.height*0.6011212);
path_2.lineTo(size.width*0.9977612,size.height*0.6083038);
path_2.lineTo(size.width*1.002239,size.height*0.6083038);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.5939385);
path_2.lineTo(size.width*1.002239,size.height*0.5867559);
path_2.lineTo(size.width*0.9977612,size.height*0.5867559);
path_2.lineTo(size.width*0.9977612,size.height*0.5939385);
path_2.lineTo(size.width*1.002239,size.height*0.5939385);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.5795732);
path_2.lineTo(size.width*1.002239,size.height*0.5723906);
path_2.lineTo(size.width*0.9977612,size.height*0.5723906);
path_2.lineTo(size.width*0.9977612,size.height*0.5795732);
path_2.lineTo(size.width*1.002239,size.height*0.5795732);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.5652098);
path_2.lineTo(size.width*1.002239,size.height*0.5580271);
path_2.lineTo(size.width*0.9977612,size.height*0.5580271);
path_2.lineTo(size.width*0.9977612,size.height*0.5652098);
path_2.lineTo(size.width*1.002239,size.height*0.5652098);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.5508445);
path_2.lineTo(size.width*1.002239,size.height*0.5436618);
path_2.lineTo(size.width*0.9977612,size.height*0.5436618);
path_2.lineTo(size.width*0.9977612,size.height*0.5508445);
path_2.lineTo(size.width*1.002239,size.height*0.5508445);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.5364792);
path_2.lineTo(size.width*1.002239,size.height*0.5292966);
path_2.lineTo(size.width*0.9977612,size.height*0.5292966);
path_2.lineTo(size.width*0.9977612,size.height*0.5364792);
path_2.lineTo(size.width*1.002239,size.height*0.5364792);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.5221139);
path_2.lineTo(size.width*1.002239,size.height*0.5149313);
path_2.lineTo(size.width*0.9977612,size.height*0.5149313);
path_2.lineTo(size.width*0.9977612,size.height*0.5221139);
path_2.lineTo(size.width*1.002239,size.height*0.5221139);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.5077505);
path_2.lineTo(size.width*1.002239,size.height*0.5005678);
path_2.lineTo(size.width*0.9977612,size.height*0.5005678);
path_2.lineTo(size.width*0.9977612,size.height*0.5077505);
path_2.lineTo(size.width*1.002239,size.height*0.5077505);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.4933852);
path_2.lineTo(size.width*1.002239,size.height*0.4862025);
path_2.lineTo(size.width*0.9977612,size.height*0.4862025);
path_2.lineTo(size.width*0.9977612,size.height*0.4933852);
path_2.lineTo(size.width*1.002239,size.height*0.4933852);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.4790199);
path_2.lineTo(size.width*1.002239,size.height*0.4718373);
path_2.lineTo(size.width*0.9977612,size.height*0.4718373);
path_2.lineTo(size.width*0.9977612,size.height*0.4790199);
path_2.lineTo(size.width*1.002239,size.height*0.4790199);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.4646546);
path_2.lineTo(size.width*1.002239,size.height*0.4574720);
path_2.lineTo(size.width*0.9977612,size.height*0.4574720);
path_2.lineTo(size.width*0.9977612,size.height*0.4646546);
path_2.lineTo(size.width*1.002239,size.height*0.4646546);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.4502893);
path_2.lineTo(size.width*1.002239,size.height*0.4431085);
path_2.lineTo(size.width*0.9977612,size.height*0.4431085);
path_2.lineTo(size.width*0.9977612,size.height*0.4502893);
path_2.lineTo(size.width*1.002239,size.height*0.4502893);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.4359259);
path_2.lineTo(size.width*1.002239,size.height*0.4287432);
path_2.lineTo(size.width*0.9977612,size.height*0.4287432);
path_2.lineTo(size.width*0.9977612,size.height*0.4359259);
path_2.lineTo(size.width*1.002239,size.height*0.4359259);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.4215606);
path_2.lineTo(size.width*1.002239,size.height*0.4143779);
path_2.lineTo(size.width*0.9977612,size.height*0.4143779);
path_2.lineTo(size.width*0.9977612,size.height*0.4215606);
path_2.lineTo(size.width*1.002239,size.height*0.4215606);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.4071953);
path_2.lineTo(size.width*1.002239,size.height*0.4000127);
path_2.lineTo(size.width*0.9977612,size.height*0.4000127);
path_2.lineTo(size.width*0.9977612,size.height*0.4071953);
path_2.lineTo(size.width*1.002239,size.height*0.4071953);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.3928300);
path_2.lineTo(size.width*1.002239,size.height*0.3856474);
path_2.lineTo(size.width*0.9977612,size.height*0.3856474);
path_2.lineTo(size.width*0.9977612,size.height*0.3928300);
path_2.lineTo(size.width*1.002239,size.height*0.3928300);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.3784647);
path_2.lineTo(size.width*1.002239,size.height*0.3712839);
path_2.lineTo(size.width*0.9977612,size.height*0.3712839);
path_2.lineTo(size.width*0.9977612,size.height*0.3784647);
path_2.lineTo(size.width*1.002239,size.height*0.3784647);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.3641013);
path_2.lineTo(size.width*1.002239,size.height*0.3569186);
path_2.lineTo(size.width*0.9977612,size.height*0.3569186);
path_2.lineTo(size.width*0.9977612,size.height*0.3641013);
path_2.lineTo(size.width*1.002239,size.height*0.3641013);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.3497360);
path_2.lineTo(size.width*1.002239,size.height*0.3425533);
path_2.lineTo(size.width*0.9977612,size.height*0.3425533);
path_2.lineTo(size.width*0.9977612,size.height*0.3497360);
path_2.lineTo(size.width*1.002239,size.height*0.3497360);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.3353707);
path_2.lineTo(size.width*1.002239,size.height*0.3317794);
path_2.lineTo(size.width*0.9977612,size.height*0.3317794);
path_2.lineTo(size.width*0.9977612,size.height*0.3353707);
path_2.lineTo(size.width*1.002239,size.height*0.3353707);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.3317794);
path_2.cubicTo(size.width*1.002239,size.height*0.3317758,size.width*1.002239,size.height*0.3317468,size.width*1.002239,size.height*0.3317197);
path_2.cubicTo(size.width*1.002239,size.height*0.3317052,size.width*1.002236,size.height*0.3316691,size.width*1.002230,size.height*0.3316257);
path_2.cubicTo(size.width*1.002224,size.height*0.3315913,size.width*1.002209,size.height*0.3314810,size.width*1.002140,size.height*0.3313472);
path_2.cubicTo(size.width*1.002072,size.height*0.3312116,size.width*1.001887,size.height*0.3309186,size.width*1.001391,size.height*0.3306781);
path_2.cubicTo(size.width*1.000878,size.height*0.3304304,size.width*1.000343,size.height*0.3303942,size.width*1.000140,size.height*0.3303852);
path_2.cubicTo(size.width*1.000042,size.height*0.3303816,size.width*0.9999612,size.height*0.3303834,size.width*0.9999522,size.height*0.3303834);
path_2.cubicTo(size.width*0.9999194,size.height*0.3303834,size.width*0.9999642,size.height*0.3303834,size.width*0.9999910,size.height*0.3303834);
path_2.cubicTo(size.width*1.000075,size.height*0.3303834,size.width*1.000233,size.height*0.3303852,size.width*1.000424,size.height*0.3304087);
path_2.cubicTo(size.width*1.000845,size.height*0.3304593,size.width*1.001173,size.height*0.3305750,size.width*1.001409,size.height*0.3306962);
path_2.cubicTo(size.width*1.001621,size.height*0.3308029,size.width*1.001749,size.height*0.3309096,size.width*1.001812,size.height*0.3309656);
path_2.cubicTo(size.width*1.001878,size.height*0.3310271,size.width*1.001916,size.height*0.3310759,size.width*1.001934,size.height*0.3310976);
path_2.cubicTo(size.width*1.001946,size.height*0.3311103,size.width*1.001952,size.height*0.3311212,size.width*1.001958,size.height*0.3311266);
path_2.cubicTo(size.width*1.001961,size.height*0.3311338,size.width*1.001964,size.height*0.3311356,size.width*1.001964,size.height*0.3311374);
path_2.lineTo(size.width*0.9977881,size.height*0.3321139);
path_2.cubicTo(size.width*0.9978179,size.height*0.3321627,size.width*0.9978537,size.height*0.3322152,size.width*0.9978985,size.height*0.3322712);
path_2.cubicTo(size.width*0.9979403,size.height*0.3323237,size.width*0.9980000,size.height*0.3323942,size.width*0.9980836,size.height*0.3324702);
path_2.cubicTo(size.width*0.9981642,size.height*0.3325425,size.width*0.9983075,size.height*0.3326582,size.width*0.9985284,size.height*0.3327722);
path_2.cubicTo(size.width*0.9986448,size.height*0.3328318,size.width*0.9987910,size.height*0.3328933,size.width*0.9989701,size.height*0.3329476);
path_2.cubicTo(size.width*0.9991522,size.height*0.3330036,size.width*0.9993463,size.height*0.3330452,size.width*0.9995433,size.height*0.3330687);
path_2.cubicTo(size.width*0.9997403,size.height*0.3330922,size.width*0.9999015,size.height*0.3330958,size.width*0.9999910,size.height*0.3330958);
path_2.cubicTo(size.width*1.000015,size.height*0.3330958,size.width*1.000063,size.height*0.3330940,size.width*1.000030,size.height*0.3330958);
path_2.cubicTo(size.width*1.000024,size.height*0.3330958,size.width*0.9999463,size.height*0.3330958,size.width*0.9998478,size.height*0.3330922);
path_2.cubicTo(size.width*0.9997463,size.height*0.3330886,size.width*0.9995612,size.height*0.3330778,size.width*0.9993403,size.height*0.3330362);
path_2.cubicTo(size.width*0.9991075,size.height*0.3329928,size.width*0.9988478,size.height*0.3329204,size.width*0.9986000,size.height*0.3328011);
path_2.cubicTo(size.width*0.9981075,size.height*0.3325624,size.width*0.9979224,size.height*0.3322694,size.width*0.9978567,size.height*0.3321356);
path_2.cubicTo(size.width*0.9978209,size.height*0.3320633,size.width*0.9978000,size.height*0.3320018,size.width*0.9977881,size.height*0.3319620);
path_2.cubicTo(size.width*0.9977791,size.height*0.3319222,size.width*0.9977731,size.height*0.3318879,size.width*0.9977701,size.height*0.3318662);
path_2.cubicTo(size.width*0.9977642,size.height*0.3318264,size.width*0.9977612,size.height*0.3317939,size.width*0.9977612,size.height*0.3317866);
path_2.cubicTo(size.width*0.9977612,size.height*0.3317722,size.width*0.9977612,size.height*0.3317595,size.width*0.9977612,size.height*0.3317794);
path_2.lineTo(size.width*1.002239,size.height*0.3317794);
path_2.close();
path_2.moveTo(size.width*1.001854,size.height*0.3309186);
path_2.cubicTo(size.width*1.001836,size.height*0.3308752,size.width*1.001812,size.height*0.3308228,size.width*1.001788,size.height*0.3307649);
path_2.lineTo(size.width*0.9974507,size.height*0.3314430);
path_2.cubicTo(size.width*0.9974836,size.height*0.3315154,size.width*0.9975104,size.height*0.3315805,size.width*0.9975403,size.height*0.3316401);
path_2.lineTo(size.width*1.001854,size.height*0.3309186);
path_2.close();
path_2.moveTo(size.width*1.001788,size.height*0.3307649);
path_2.cubicTo(size.width*1.001660,size.height*0.3304684,size.width*1.001355,size.height*0.3300633,size.width*1.001039,size.height*0.3296709);
path_2.cubicTo(size.width*1.000687,size.height*0.3292278,size.width*1.000197,size.height*0.3286510,size.width*0.9995791,size.height*0.3279385);
path_2.lineTo(size.width*0.9956179,size.height*0.3292025);
path_2.cubicTo(size.width*0.9962269,size.height*0.3299042,size.width*0.9966896,size.height*0.3304521,size.width*0.9970090,size.height*0.3308517);
path_2.cubicTo(size.width*0.9973672,size.height*0.3313002,size.width*0.9974567,size.height*0.3314557,size.width*0.9974507,size.height*0.3314430);
path_2.lineTo(size.width*1.001788,size.height*0.3307649);
path_2.close();
path_2.moveTo(size.width*0.9951254,size.height*0.3229548);
path_2.cubicTo(size.width*0.9938269,size.height*0.3215190,size.width*0.9923254,size.height*0.3198734,size.width*0.9906269,size.height*0.3180127);
path_2.lineTo(size.width*0.9867104,size.height*0.3193255);
path_2.cubicTo(size.width*0.9884060,size.height*0.3211844,size.width*0.9899045,size.height*0.3228282,size.width*0.9912000,size.height*0.3242604);
path_2.lineTo(size.width*0.9951254,size.height*0.3229548);
path_2.close();
path_2.moveTo(size.width*0.9861164,size.height*0.3130796);
path_2.cubicTo(size.width*0.9853910,size.height*0.3122857,size.width*0.9846358,size.height*0.3114629,size.width*0.9838567,size.height*0.3106112);
path_2.lineTo(size.width*0.9799403,size.height*0.3119259);
path_2.cubicTo(size.width*0.9807224,size.height*0.3127776,size.width*0.9814746,size.height*0.3136004,size.width*0.9822000,size.height*0.3143942);
path_2.lineTo(size.width*0.9861164,size.height*0.3130796);
path_2.close();
path_2.moveTo(size.width*0.9838567,size.height*0.3106112);
path_2.cubicTo(size.width*0.9834478,size.height*0.3101627,size.width*0.9830836,size.height*0.3096980,size.width*0.9827672,size.height*0.3092188);
path_2.lineTo(size.width*0.9786090,size.height*0.3102242);
path_2.cubicTo(size.width*0.9789940,size.height*0.3108101,size.width*0.9794418,size.height*0.3113797,size.width*0.9799403,size.height*0.3119259);
path_2.lineTo(size.width*0.9838567,size.height*0.3106112);
path_2.close();
path_2.moveTo(size.width*0.9815015,size.height*0.3062423);
path_2.cubicTo(size.width*0.9813970,size.height*0.3057378,size.width*0.9813433,size.height*0.3052242,size.width*0.9813433,size.height*0.3047016);
path_2.lineTo(size.width*0.9768657,size.height*0.3047016);
path_2.cubicTo(size.width*0.9768657,size.height*0.3053382,size.width*0.9769313,size.height*0.3059638,size.width*0.9770597,size.height*0.3065805);
path_2.lineTo(size.width*0.9815015,size.height*0.3062423);
path_2.close();
path_2.moveTo(size.width*0.9813433,size.height*0.3047016);
path_2.cubicTo(size.width*0.9813433,size.height*0.3041790,size.width*0.9813970,size.height*0.3036655,size.width*0.9815015,size.height*0.3031609);
path_2.lineTo(size.width*0.9770597,size.height*0.3028228);
path_2.cubicTo(size.width*0.9769313,size.height*0.3034394,size.width*0.9768657,size.height*0.3040651,size.width*0.9768657,size.height*0.3047016);
path_2.lineTo(size.width*0.9813433,size.height*0.3047016);
path_2.close();
path_2.moveTo(size.width*0.9827672,size.height*0.3001844);
path_2.cubicTo(size.width*0.9830836,size.height*0.2997052,size.width*0.9834478,size.height*0.2992405,size.width*0.9838567,size.height*0.2987920);
path_2.lineTo(size.width*0.9799403,size.height*0.2974774);
path_2.cubicTo(size.width*0.9794418,size.height*0.2980235,size.width*0.9789940,size.height*0.2985931,size.width*0.9786090,size.height*0.2991790);
path_2.lineTo(size.width*0.9827672,size.height*0.3001844);
path_2.close();
path_2.moveTo(size.width*0.9838567,size.height*0.2987920);
path_2.cubicTo(size.width*0.9846358,size.height*0.2979403,size.width*0.9853910,size.height*0.2971175,size.width*0.9861164,size.height*0.2963237);
path_2.lineTo(size.width*0.9822000,size.height*0.2950090);
path_2.cubicTo(size.width*0.9814746,size.height*0.2958029,size.width*0.9807224,size.height*0.2966257,size.width*0.9799403,size.height*0.2974774);
path_2.lineTo(size.width*0.9838567,size.height*0.2987920);
path_2.close();
path_2.moveTo(size.width*0.9906269,size.height*0.2913906);
path_2.cubicTo(size.width*0.9923254,size.height*0.2895298,size.width*0.9938269,size.height*0.2878843,size.width*0.9951254,size.height*0.2864485);
path_2.lineTo(size.width*0.9912000,size.height*0.2851429);
path_2.cubicTo(size.width*0.9899045,size.height*0.2865750,size.width*0.9884060,size.height*0.2882188,size.width*0.9867104,size.height*0.2900778);
path_2.lineTo(size.width*0.9906269,size.height*0.2913906);
path_2.close();
path_2.moveTo(size.width*0.9995791,size.height*0.2814647);
path_2.cubicTo(size.width*1.000197,size.height*0.2807523,size.width*1.000687,size.height*0.2801754,size.width*1.001039,size.height*0.2797324);
path_2.cubicTo(size.width*1.001355,size.height*0.2793400,size.width*1.001660,size.height*0.2789349,size.width*1.001788,size.height*0.2786383);
path_2.lineTo(size.width*0.9974507,size.height*0.2779602);
path_2.cubicTo(size.width*0.9974567,size.height*0.2779476,size.width*0.9973672,size.height*0.2781031,size.width*0.9970090,size.height*0.2785515);
path_2.cubicTo(size.width*0.9966896,size.height*0.2789512,size.width*0.9962269,size.height*0.2794991,size.width*0.9956179,size.height*0.2802007);
path_2.lineTo(size.width*0.9995791,size.height*0.2814647);
path_2.close();
path_2.moveTo(size.width*1.001788,size.height*0.2786383);
path_2.cubicTo(size.width*1.001812,size.height*0.2785805,size.width*1.001836,size.height*0.2785280,size.width*1.001854,size.height*0.2784846);
path_2.lineTo(size.width*0.9975403,size.height*0.2777631);
path_2.cubicTo(size.width*0.9975104,size.height*0.2778228,size.width*0.9974836,size.height*0.2778879,size.width*0.9974507,size.height*0.2779602);
path_2.lineTo(size.width*1.001788,size.height*0.2786383);
path_2.close();
path_2.moveTo(size.width*1.001964,size.height*0.2782658);
path_2.cubicTo(size.width*1.001964,size.height*0.2782676,size.width*1.001961,size.height*0.2782694,size.width*1.001958,size.height*0.2782767);
path_2.cubicTo(size.width*1.001952,size.height*0.2782821,size.width*1.001946,size.height*0.2782929,size.width*1.001934,size.height*0.2783056);
path_2.cubicTo(size.width*1.001916,size.height*0.2783273,size.width*1.001878,size.height*0.2783761,size.width*1.001812,size.height*0.2784376);
path_2.cubicTo(size.width*1.001749,size.height*0.2784937,size.width*1.001621,size.height*0.2786004,size.width*1.001409,size.height*0.2787071);
path_2.cubicTo(size.width*1.001173,size.height*0.2788282,size.width*1.000842,size.height*0.2789439,size.width*1.000424,size.height*0.2789946);
path_2.cubicTo(size.width*1.000230,size.height*0.2790181,size.width*1.000075,size.height*0.2790199,size.width*0.9999881,size.height*0.2790199);
path_2.cubicTo(size.width*0.9999642,size.height*0.2790199,size.width*0.9999194,size.height*0.2790199,size.width*0.9999522,size.height*0.2790199);
path_2.cubicTo(size.width*0.9999612,size.height*0.2790199,size.width*1.000039,size.height*0.2790217,size.width*1.000140,size.height*0.2790181);
path_2.cubicTo(size.width*1.000343,size.height*0.2790090,size.width*1.000875,size.height*0.2789729,size.width*1.001391,size.height*0.2787251);
path_2.cubicTo(size.width*1.001887,size.height*0.2784846,size.width*1.002072,size.height*0.2781917,size.width*1.002140,size.height*0.2780561);
path_2.cubicTo(size.width*1.002209,size.height*0.2779222,size.width*1.002224,size.height*0.2778119,size.width*1.002230,size.height*0.2777776);
path_2.cubicTo(size.width*1.002236,size.height*0.2777342,size.width*1.002239,size.height*0.2776980,size.width*1.002239,size.height*0.2776835);
path_2.cubicTo(size.width*1.002239,size.height*0.2776564,size.width*1.002239,size.height*0.2776275,size.width*1.002239,size.height*0.2776239);
path_2.lineTo(size.width*0.9977612,size.height*0.2776239);
path_2.cubicTo(size.width*0.9977612,size.height*0.2776438,size.width*0.9977612,size.height*0.2776311,size.width*0.9977612,size.height*0.2776166);
path_2.cubicTo(size.width*0.9977612,size.height*0.2776094,size.width*0.9977642,size.height*0.2775769,size.width*0.9977701,size.height*0.2775371);
path_2.cubicTo(size.width*0.9977731,size.height*0.2775154,size.width*0.9977791,size.height*0.2774810,size.width*0.9977881,size.height*0.2774412);
path_2.cubicTo(size.width*0.9978000,size.height*0.2774014,size.width*0.9978209,size.height*0.2773400,size.width*0.9978567,size.height*0.2772676);
path_2.cubicTo(size.width*0.9979224,size.height*0.2771338,size.width*0.9981075,size.height*0.2768409,size.width*0.9986030,size.height*0.2766022);
path_2.cubicTo(size.width*0.9988478,size.height*0.2764828,size.width*0.9991075,size.height*0.2764105,size.width*0.9993433,size.height*0.2763671);
path_2.cubicTo(size.width*0.9995612,size.height*0.2763255,size.width*0.9997463,size.height*0.2763146,size.width*0.9998478,size.height*0.2763110);
path_2.cubicTo(size.width*0.9999463,size.height*0.2763074,size.width*1.000024,size.height*0.2763074,size.width*1.000030,size.height*0.2763074);
path_2.cubicTo(size.width*1.000063,size.height*0.2763092,size.width*1.000015,size.height*0.2763074,size.width*0.9999910,size.height*0.2763074);
path_2.cubicTo(size.width*0.9999045,size.height*0.2763074,size.width*0.9997433,size.height*0.2763110,size.width*0.9995463,size.height*0.2763345);
path_2.cubicTo(size.width*0.9993463,size.height*0.2763580,size.width*0.9991522,size.height*0.2763996,size.width*0.9989701,size.height*0.2764539);
path_2.cubicTo(size.width*0.9987910,size.height*0.2765081,size.width*0.9986448,size.height*0.2765714,size.width*0.9985284,size.height*0.2766311);
path_2.cubicTo(size.width*0.9983075,size.height*0.2767450,size.width*0.9981642,size.height*0.2768608,size.width*0.9980836,size.height*0.2769331);
path_2.cubicTo(size.width*0.9980000,size.height*0.2770090,size.width*0.9979403,size.height*0.2770796,size.width*0.9978985,size.height*0.2771320);
path_2.cubicTo(size.width*0.9978537,size.height*0.2771881,size.width*0.9978179,size.height*0.2772405,size.width*0.9977881,size.height*0.2772893);
path_2.lineTo(size.width*1.001964,size.height*0.2782658);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.2776239);
path_2.lineTo(size.width*1.002239,size.height*0.2741555);
path_2.lineTo(size.width*0.9977612,size.height*0.2741555);
path_2.lineTo(size.width*0.9977612,size.height*0.2776239);
path_2.lineTo(size.width*1.002239,size.height*0.2776239);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.2672188);
path_2.lineTo(size.width*1.002239,size.height*0.2602839);
path_2.lineTo(size.width*0.9977612,size.height*0.2602839);
path_2.lineTo(size.width*0.9977612,size.height*0.2672188);
path_2.lineTo(size.width*1.002239,size.height*0.2672188);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.2533490);
path_2.lineTo(size.width*1.002239,size.height*0.2464123);
path_2.lineTo(size.width*0.9977612,size.height*0.2464123);
path_2.lineTo(size.width*0.9977612,size.height*0.2533490);
path_2.lineTo(size.width*1.002239,size.height*0.2533490);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.2394774);
path_2.lineTo(size.width*1.002239,size.height*0.2325407);
path_2.lineTo(size.width*0.9977612,size.height*0.2325407);
path_2.lineTo(size.width*0.9977612,size.height*0.2394774);
path_2.lineTo(size.width*1.002239,size.height*0.2394774);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.2256058);
path_2.lineTo(size.width*1.002239,size.height*0.2186691);
path_2.lineTo(size.width*0.9977612,size.height*0.2186691);
path_2.lineTo(size.width*0.9977612,size.height*0.2256058);
path_2.lineTo(size.width*1.002239,size.height*0.2256058);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.2117342);
path_2.lineTo(size.width*1.002239,size.height*0.2047975);
path_2.lineTo(size.width*0.9977612,size.height*0.2047975);
path_2.lineTo(size.width*0.9977612,size.height*0.2117342);
path_2.lineTo(size.width*1.002239,size.height*0.2117342);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.1978626);
path_2.lineTo(size.width*1.002239,size.height*0.1909259);
path_2.lineTo(size.width*0.9977612,size.height*0.1909259);
path_2.lineTo(size.width*0.9977612,size.height*0.1978626);
path_2.lineTo(size.width*1.002239,size.height*0.1978626);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.1839910);
path_2.lineTo(size.width*1.002239,size.height*0.1770548);
path_2.lineTo(size.width*0.9977612,size.height*0.1770548);
path_2.lineTo(size.width*0.9977612,size.height*0.1839910);
path_2.lineTo(size.width*1.002239,size.height*0.1839910);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.1701190);
path_2.lineTo(size.width*1.002239,size.height*0.1631834);
path_2.lineTo(size.width*0.9977612,size.height*0.1631834);
path_2.lineTo(size.width*0.9977612,size.height*0.1701190);
path_2.lineTo(size.width*1.002239,size.height*0.1701190);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.1562476);
path_2.lineTo(size.width*1.002239,size.height*0.1493118);
path_2.lineTo(size.width*0.9977612,size.height*0.1493118);
path_2.lineTo(size.width*0.9977612,size.height*0.1562476);
path_2.lineTo(size.width*1.002239,size.height*0.1562476);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.1423761);
path_2.lineTo(size.width*1.002239,size.height*0.1354403);
path_2.lineTo(size.width*0.9977612,size.height*0.1354403);
path_2.lineTo(size.width*0.9977612,size.height*0.1423761);
path_2.lineTo(size.width*1.002239,size.height*0.1423761);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.1285045);
path_2.lineTo(size.width*1.002239,size.height*0.1215687);
path_2.lineTo(size.width*0.9977612,size.height*0.1215687);
path_2.lineTo(size.width*0.9977612,size.height*0.1285045);
path_2.lineTo(size.width*1.002239,size.height*0.1285045);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.1146331);
path_2.lineTo(size.width*1.002239,size.height*0.1111651);
path_2.lineTo(size.width*0.9977612,size.height*0.1111651);
path_2.lineTo(size.width*0.9977612,size.height*0.1146331);
path_2.lineTo(size.width*1.002239,size.height*0.1146331);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.1111651);
path_2.cubicTo(size.width*1.002239,size.height*0.1111613,size.width*1.002239,size.height*0.1111320,size.width*1.002239,size.height*0.1111051);
path_2.cubicTo(size.width*1.002239,size.height*0.1110911,size.width*1.002236,size.height*0.1110550,size.width*1.002230,size.height*0.1110101);
path_2.cubicTo(size.width*1.002224,size.height*0.1109769,size.width*1.002209,size.height*0.1108667,size.width*1.002140,size.height*0.1107325);
path_2.cubicTo(size.width*1.002072,size.height*0.1105973,size.width*1.001887,size.height*0.1103036,size.width*1.001391,size.height*0.1100640);
path_2.cubicTo(size.width*1.000875,size.height*0.1098156,size.width*1.000343,size.height*0.1097790,size.width*1.000140,size.height*0.1097711);
path_2.cubicTo(size.width*1.000039,size.height*0.1097671,size.width*0.9999612,size.height*0.1097682,size.width*0.9999522,size.height*0.1097684);
path_2.cubicTo(size.width*0.9999194,size.height*0.1097687,size.width*0.9999642,size.height*0.1097682,size.width*0.9999881,size.height*0.1097682);
path_2.cubicTo(size.width*1.000075,size.height*0.1097682,size.width*1.000230,size.height*0.1097709,size.width*1.000424,size.height*0.1097942);
path_2.cubicTo(size.width*1.000845,size.height*0.1098452,size.width*1.001173,size.height*0.1099609,size.width*1.001409,size.height*0.1100812);
path_2.cubicTo(size.width*1.001621,size.height*0.1101882,size.width*1.001749,size.height*0.1102948,size.width*1.001812,size.height*0.1103512);
path_2.cubicTo(size.width*1.001878,size.height*0.1104119,size.width*1.001916,size.height*0.1104606,size.width*1.001934,size.height*0.1104832);
path_2.cubicTo(size.width*1.001946,size.height*0.1104960,size.width*1.001952,size.height*0.1105060,size.width*1.001958,size.height*0.1105119);
path_2.cubicTo(size.width*1.001961,size.height*0.1105181,size.width*1.001964,size.height*0.1105217,size.width*1.001964,size.height*0.1105219);
path_2.lineTo(size.width*0.9977881,size.height*0.1114998);
path_2.cubicTo(size.width*0.9978179,size.height*0.1115479,size.width*0.9978537,size.height*0.1116009,size.width*0.9978985,size.height*0.1116557);
path_2.cubicTo(size.width*0.9979403,size.height*0.1117083,size.width*0.9980000,size.height*0.1117788,size.width*0.9980836,size.height*0.1118555);
path_2.cubicTo(size.width*0.9981642,size.height*0.1119277,size.width*0.9983075,size.height*0.1120441,size.width*0.9985284,size.height*0.1121575);
path_2.cubicTo(size.width*0.9986448,size.height*0.1122170,size.width*0.9987910,size.height*0.1122794,size.width*0.9989701,size.height*0.1123336);
path_2.cubicTo(size.width*0.9991522,size.height*0.1123893,size.width*0.9993463,size.height*0.1124297,size.width*0.9995433,size.height*0.1124539);
path_2.cubicTo(size.width*0.9997403,size.height*0.1124778,size.width*0.9999015,size.height*0.1124807,size.width*0.9999910,size.height*0.1124807);
path_2.cubicTo(size.width*1.000015,size.height*0.1124807,size.width*1.000063,size.height*0.1124801,size.width*1.000030,size.height*0.1124803);
path_2.cubicTo(size.width*1.000024,size.height*0.1124805,size.width*0.9999463,size.height*0.1124816,size.width*0.9998478,size.height*0.1124778);
path_2.cubicTo(size.width*0.9997463,size.height*0.1124736,size.width*0.9995612,size.height*0.1124624,size.width*0.9993403,size.height*0.1124217);
path_2.cubicTo(size.width*0.9991075,size.height*0.1123783,size.width*0.9988478,size.height*0.1123049,size.width*0.9986000,size.height*0.1121857);
path_2.cubicTo(size.width*0.9981075,size.height*0.1119468,size.width*0.9979224,size.height*0.1116544,size.width*0.9978567,size.height*0.1115212);
path_2.cubicTo(size.width*0.9978209,size.height*0.1114485,size.width*0.9978000,size.height*0.1113875,size.width*0.9977881,size.height*0.1113479);
path_2.cubicTo(size.width*0.9977791,size.height*0.1113072,size.width*0.9977731,size.height*0.1112736,size.width*0.9977701,size.height*0.1112519);
path_2.cubicTo(size.width*0.9977642,size.height*0.1112107,size.width*0.9977612,size.height*0.1111794,size.width*0.9977612,size.height*0.1111712);
path_2.cubicTo(size.width*0.9977612,size.height*0.1111566,size.width*0.9977612,size.height*0.1111445,size.width*0.9977612,size.height*0.1111651);
path_2.lineTo(size.width*1.002239,size.height*0.1111651);
path_2.close();
path_2.moveTo(size.width*1.001854,size.height*0.1103045);
path_2.cubicTo(size.width*1.001836,size.height*0.1102599,size.width*1.001812,size.height*0.1102085,size.width*1.001788,size.height*0.1101494);
path_2.lineTo(size.width*0.9974507,size.height*0.1108288);
path_2.cubicTo(size.width*0.9974836,size.height*0.1109000,size.width*0.9975104,size.height*0.1109656,size.width*0.9975403,size.height*0.1110259);
path_2.lineTo(size.width*1.001854,size.height*0.1103045);
path_2.close();
path_2.moveTo(size.width*1.001788,size.height*0.1101494);
path_2.cubicTo(size.width*1.001660,size.height*0.1098532,size.width*1.001355,size.height*0.1094490,size.width*1.001039,size.height*0.1090553);
path_2.cubicTo(size.width*1.000687,size.height*0.1086136,size.width*1.000197,size.height*0.1080353,size.width*0.9995791,size.height*0.1073230);
path_2.lineTo(size.width*0.9956179,size.height*0.1085873);
path_2.cubicTo(size.width*0.9962269,size.height*0.1092899,size.width*0.9966896,size.height*0.1098365,size.width*0.9970090,size.height*0.1102371);
path_2.cubicTo(size.width*0.9973672,size.height*0.1106855,size.width*0.9974567,size.height*0.1108409,size.width*0.9974507,size.height*0.1108288);
path_2.lineTo(size.width*1.001788,size.height*0.1101494);
path_2.close();
path_2.moveTo(size.width*0.9951254,size.height*0.1023403);
path_2.cubicTo(size.width*0.9938269,size.height*0.1009040,size.width*0.9923254,size.height*0.09925823,size.width*0.9906269,size.height*0.09739747);
path_2.lineTo(size.width*0.9867104,size.height*0.09871049);
path_2.cubicTo(size.width*0.9884060,size.height*0.1005700,size.width*0.9899045,size.height*0.1022128,size.width*0.9912000,size.height*0.1036454);
path_2.lineTo(size.width*0.9951254,size.height*0.1023403);
path_2.close();
path_2.moveTo(size.width*0.9861164,size.height*0.09246510);
path_2.cubicTo(size.width*0.9853910,size.height*0.09167071,size.width*0.9846358,size.height*0.09084774,size.width*0.9838567,size.height*0.08999638);
path_2.lineTo(size.width*0.9799403,size.height*0.09131157);
path_2.cubicTo(size.width*0.9807224,size.height*0.09216311,size.width*0.9814746,size.height*0.09298590,size.width*0.9822000,size.height*0.09378029);
path_2.lineTo(size.width*0.9861164,size.height*0.09246510);
path_2.close();
path_2.moveTo(size.width*0.9838567,size.height*0.08999638);
path_2.cubicTo(size.width*0.9834478,size.height*0.08954864,size.width*0.9830836,size.height*0.08908391,size.width*0.9827672,size.height*0.08860434);
path_2.lineTo(size.width*0.9786090,size.height*0.08960886);
path_2.cubicTo(size.width*0.9789940,size.height*0.09019584,size.width*0.9794418,size.height*0.09076438,size.width*0.9799403,size.height*0.09131157);
path_2.lineTo(size.width*0.9838567,size.height*0.08999638);
path_2.close();
path_2.moveTo(size.width*0.9815015,size.height*0.08562694);
path_2.cubicTo(size.width*0.9813970,size.height*0.08512315,size.width*0.9813433,size.height*0.08460904,size.width*0.9813433,size.height*0.08408680);
path_2.lineTo(size.width*0.9768657,size.height*0.08408680);
path_2.cubicTo(size.width*0.9768657,size.height*0.08472242,size.width*0.9769313,size.height*0.08534955,size.width*0.9770597,size.height*0.08596546);
path_2.lineTo(size.width*0.9815015,size.height*0.08562694);
path_2.close();
path_2.moveTo(size.width*0.9813433,size.height*0.08408680);
path_2.cubicTo(size.width*0.9813433,size.height*0.08356456,size.width*0.9813970,size.height*0.08305045,size.width*0.9815015,size.height*0.08254665);
path_2.lineTo(size.width*0.9770597,size.height*0.08220814);
path_2.cubicTo(size.width*0.9769313,size.height*0.08282405,size.width*0.9768657,size.height*0.08345118,size.width*0.9768657,size.height*0.08408680);
path_2.lineTo(size.width*0.9813433,size.height*0.08408680);
path_2.close();
path_2.moveTo(size.width*0.9827672,size.height*0.07956926);
path_2.cubicTo(size.width*0.9830836,size.height*0.07908969,size.width*0.9834478,size.height*0.07862495,size.width*0.9838567,size.height*0.07817722);
path_2.lineTo(size.width*0.9799403,size.height*0.07686203);
path_2.cubicTo(size.width*0.9794418,size.height*0.07740922,size.width*0.9789940,size.height*0.07797776,size.width*0.9786090,size.height*0.07856492);
path_2.lineTo(size.width*0.9827672,size.height*0.07956926);
path_2.close();
path_2.moveTo(size.width*0.9838567,size.height*0.07817722);
path_2.cubicTo(size.width*0.9846358,size.height*0.07732586,size.width*0.9853910,size.height*0.07650289,size.width*0.9861164,size.height*0.07570850);
path_2.lineTo(size.width*0.9822000,size.height*0.07439331);
path_2.cubicTo(size.width*0.9814746,size.height*0.07518770,size.width*0.9807224,size.height*0.07601049,size.width*0.9799403,size.height*0.07686203);
path_2.lineTo(size.width*0.9838567,size.height*0.07817722);
path_2.close();
path_2.moveTo(size.width*0.9906269,size.height*0.07077613);
path_2.cubicTo(size.width*0.9923254,size.height*0.06891537,size.width*0.9938269,size.height*0.06726962,size.width*0.9951254,size.height*0.06583327);
path_2.lineTo(size.width*0.9912000,size.height*0.06452821);
path_2.cubicTo(size.width*0.9899045,size.height*0.06596076,size.width*0.9884060,size.height*0.06760362,size.width*0.9867104,size.height*0.06946311);
path_2.lineTo(size.width*0.9906269,size.height*0.07077613);
path_2.close();
path_2.moveTo(size.width*0.9995791,size.height*0.06085063);
path_2.cubicTo(size.width*1.000197,size.height*0.06013834,size.width*1.000687,size.height*0.05956004,size.width*1.001039,size.height*0.05911826);
path_2.cubicTo(size.width*1.001355,size.height*0.05872441,size.width*1.001660,size.height*0.05832043,size.width*1.001788,size.height*0.05802423);
path_2.lineTo(size.width*0.9974507,size.height*0.05734485);
path_2.cubicTo(size.width*0.9974567,size.height*0.05733273,size.width*0.9973672,size.height*0.05748807,size.width*0.9970090,size.height*0.05793653);
path_2.cubicTo(size.width*0.9966896,size.height*0.05833707,size.width*0.9962269,size.height*0.05888373,size.width*0.9956179,size.height*0.05958626);
path_2.lineTo(size.width*0.9995791,size.height*0.06085063);
path_2.close();
path_2.moveTo(size.width*1.001788,size.height*0.05802423);
path_2.cubicTo(size.width*1.001812,size.height*0.05796510,size.width*1.001836,size.height*0.05791374,size.width*1.001854,size.height*0.05786908);
path_2.lineTo(size.width*0.9975403,size.height*0.05714774);
path_2.cubicTo(size.width*0.9975104,size.height*0.05720796,size.width*0.9974836,size.height*0.05727360,size.width*0.9974507,size.height*0.05734485);
path_2.lineTo(size.width*1.001788,size.height*0.05802423);
path_2.close();
path_2.moveTo(size.width*1.001964,size.height*0.05765172);
path_2.cubicTo(size.width*1.001964,size.height*0.05765208,size.width*1.001961,size.height*0.05765552,size.width*1.001958,size.height*0.05766166);
path_2.cubicTo(size.width*1.001952,size.height*0.05766763,size.width*1.001946,size.height*0.05767758,size.width*1.001934,size.height*0.05769060);
path_2.cubicTo(size.width*1.001916,size.height*0.05771302,size.width*1.001878,size.height*0.05776184,size.width*1.001812,size.height*0.05782242);
path_2.cubicTo(size.width*1.001749,size.height*0.05787884,size.width*1.001621,size.height*0.05798535,size.width*1.001409,size.height*0.05809259);
path_2.cubicTo(size.width*1.001173,size.height*0.05821284,size.width*1.000842,size.height*0.05832857,size.width*1.000424,size.height*0.05837939);
path_2.cubicTo(size.width*1.000230,size.height*0.05840289,size.width*1.000075,size.height*0.05840542,size.width*0.9999881,size.height*0.05840542);
path_2.cubicTo(size.width*0.9999642,size.height*0.05840542,size.width*0.9999194,size.height*0.05840488,size.width*0.9999522,size.height*0.05840524);
path_2.cubicTo(size.width*0.9999612,size.height*0.05840542,size.width*1.000039,size.height*0.05840651,size.width*1.000140,size.height*0.05840271);
path_2.cubicTo(size.width*1.000343,size.height*0.05839458,size.width*1.000875,size.height*0.05835823,size.width*1.001391,size.height*0.05810976);
path_2.cubicTo(size.width*1.001887,size.height*0.05787016,size.width*1.002072,size.height*0.05757631,size.width*1.002140,size.height*0.05744105);
path_2.cubicTo(size.width*1.002209,size.height*0.05730687,size.width*1.002224,size.height*0.05719675,size.width*1.002230,size.height*0.05716347);
path_2.cubicTo(size.width*1.002236,size.height*0.05711863,size.width*1.002239,size.height*0.05708264,size.width*1.002239,size.height*0.05706854);
path_2.cubicTo(size.width*1.002239,size.height*0.05704177,size.width*1.002239,size.height*0.05701230,size.width*1.002239,size.height*0.05700850);
path_2.lineTo(size.width*0.9977612,size.height*0.05700850);
path_2.cubicTo(size.width*0.9977612,size.height*0.05702911,size.width*0.9977612,size.height*0.05701700,size.width*0.9977612,size.height*0.05700235);
path_2.cubicTo(size.width*0.9977612,size.height*0.05699421,size.width*0.9977642,size.height*0.05696293,size.width*0.9977701,size.height*0.05692170);
path_2.cubicTo(size.width*0.9977731,size.height*0.05690000,size.width*0.9977791,size.height*0.05686637,size.width*0.9977881,size.height*0.05682568);
path_2.cubicTo(size.width*0.9978000,size.height*0.05678608,size.width*0.9978209,size.height*0.05672514,size.width*0.9978567,size.height*0.05665244);
path_2.cubicTo(size.width*0.9979224,size.height*0.05651917,size.width*0.9981075,size.height*0.05622658,size.width*0.9986030,size.height*0.05598770);
path_2.cubicTo(size.width*0.9988478,size.height*0.05586872,size.width*0.9991075,size.height*0.05579512,size.width*0.9993433,size.height*0.05575190);
path_2.cubicTo(size.width*0.9995612,size.height*0.05571121,size.width*0.9997463,size.height*0.05570000,size.width*0.9998478,size.height*0.05569584);
path_2.cubicTo(size.width*0.9999463,size.height*0.05569204,size.width*1.000024,size.height*0.05569313,size.width*1.000030,size.height*0.05569331);
path_2.cubicTo(size.width*1.000063,size.height*0.05569367,size.width*1.000015,size.height*0.05569295,size.width*0.9999910,size.height*0.05569295);
path_2.cubicTo(size.width*0.9999045,size.height*0.05569295,size.width*0.9997433,size.height*0.05569584,size.width*0.9995463,size.height*0.05571971);
path_2.cubicTo(size.width*0.9993463,size.height*0.05574376,size.width*0.9991522,size.height*0.05578409,size.width*0.9989701,size.height*0.05583978);
path_2.cubicTo(size.width*0.9987910,size.height*0.05589421,size.width*0.9986448,size.height*0.05595660,size.width*0.9985284,size.height*0.05601609);
path_2.cubicTo(size.width*0.9983075,size.height*0.05612948,size.width*0.9981642,size.height*0.05624575,size.width*0.9980836,size.height*0.05631808);
path_2.cubicTo(size.width*0.9980000,size.height*0.05639476,size.width*0.9979403,size.height*0.05646528,size.width*0.9978985,size.height*0.05651790);
path_2.cubicTo(size.width*0.9978537,size.height*0.05657269,size.width*0.9978179,size.height*0.05662568,size.width*0.9977881,size.height*0.05667378);
path_2.lineTo(size.width*1.001964,size.height*0.05765172);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.05700850);
path_2.lineTo(size.width*1.002239,size.height*0.05179783);
path_2.lineTo(size.width*0.9977612,size.height*0.05179783);
path_2.lineTo(size.width*0.9977612,size.height*0.05700850);
path_2.lineTo(size.width*1.002239,size.height*0.05700850);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.04137685);
path_2.lineTo(size.width*1.002239,size.height*0.03616637);
path_2.lineTo(size.width*0.9977612,size.height*0.03616637);
path_2.lineTo(size.width*0.9977612,size.height*0.04137685);
path_2.lineTo(size.width*1.002239,size.height*0.04137685);
path_2.close();
path_2.moveTo(size.width*1.002239,size.height*0.03616637);
path_2.cubicTo(size.width*1.002239,size.height*0.03477324,size.width*1.002239,size.height*0.03343508,size.width*1.002233,size.height*0.03215063);
path_2.lineTo(size.width*0.9977552,size.height*0.03215678);
path_2.cubicTo(size.width*0.9977612,size.height*0.03343761,size.width*0.9977612,size.height*0.03477251,size.width*0.9977612,size.height*0.03616637);
path_2.lineTo(size.width*1.002239,size.height*0.03616637);
path_2.close();
path_2.moveTo(size.width*1.002066,size.height*0.02410072);
path_2.cubicTo(size.width*1.001916,size.height*0.02104322,size.width*1.001630,size.height*0.01834973,size.width*1.001087,size.height*0.01596870);
path_2.lineTo(size.width*0.9966507,size.height*0.01634085);
path_2.cubicTo(size.width*0.9971642,size.height*0.01858409,size.width*0.9974418,size.height*0.02116854,size.width*0.9975910,size.height*0.02418192);
path_2.lineTo(size.width*1.002066,size.height*0.02410072);
path_2.close();
path_2.moveTo(size.width*0.9971552,size.height*0.007861881);
path_2.cubicTo(size.width*0.9959940,size.height*0.006553273,size.width*0.9945731,size.height*0.005387125,size.width*0.9928388,size.height*0.004337432);
path_2.lineTo(size.width*0.9896746,size.height*0.006255443);
path_2.cubicTo(size.width*0.9910896,size.height*0.007113689,size.width*0.9922507,size.height*0.008064901,size.width*0.9932090,size.height*0.009144991);
path_2.lineTo(size.width*0.9971552,size.height*0.007861881);
path_2.close();
path_2.moveTo(size.width*0.9928388,size.height*0.004337432);
path_2.cubicTo(size.width*0.9911075,size.height*0.003287740,size.width*0.9891821,size.height*0.002426781,size.width*0.9870209,size.height*0.001724172);
path_2.lineTo(size.width*0.9849045,size.height*0.004113978);
path_2.cubicTo(size.width*0.9866866,size.height*0.004693888,size.width*0.9882567,size.height*0.005397215,size.width*0.9896746,size.height*0.006255443);
path_2.lineTo(size.width*0.9928388,size.height*0.004337432);
path_2.close();
path_2.moveTo(size.width*0.9736388,size.height*-0.0006582387);
path_2.cubicTo(size.width*0.9697104,size.height*-0.0009880362,size.width*0.9652627,size.height*-0.001160618,size.width*0.9602149,size.height*-0.001252121);
path_2.lineTo(size.width*0.9600806,size.height*0.001459143);
path_2.cubicTo(size.width*0.9650567,size.height*0.001549322,size.width*0.9693224,size.height*0.001717873,size.width*0.9730269,size.height*0.002028590);
path_2.lineTo(size.width*0.9736388,size.height*-0.0006582387);
path_2.close();
path_2.moveTo(size.width*0.9469284,size.height*-0.001353344);
path_2.cubicTo(size.width*0.9448060,size.height*-0.001356239,size.width*0.9425970,size.height*-0.001356239,size.width*0.9402985,size.height*-0.001356239);
path_2.lineTo(size.width*0.9402985,size.height*0.001356239);
path_2.cubicTo(size.width*0.9426000,size.height*0.001356239,size.width*0.9448030,size.height*0.001356239,size.width*0.9469164,size.height*0.001359127);
path_2.lineTo(size.width*0.9469284,size.height*-0.001353344);
path_2.close();
path_2.moveTo(size.width*0.9402985,size.height*-0.001356239);
path_2.lineTo(size.width*0.9343493,size.height*-0.001356239);
path_2.lineTo(size.width*0.9343493,size.height*0.001356239);
path_2.lineTo(size.width*0.9402985,size.height*0.001356239);
path_2.lineTo(size.width*0.9402985,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.9224478,size.height*-0.001356239);
path_2.lineTo(size.width*0.9105493,size.height*-0.001356239);
path_2.lineTo(size.width*0.9105493,size.height*0.001356239);
path_2.lineTo(size.width*0.9224478,size.height*0.001356239);
path_2.lineTo(size.width*0.9224478,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.8986478,size.height*-0.001356239);
path_2.lineTo(size.width*0.8867493,size.height*-0.001356239);
path_2.lineTo(size.width*0.8867493,size.height*0.001356239);
path_2.lineTo(size.width*0.8986478,size.height*0.001356239);
path_2.lineTo(size.width*0.8986478,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.8748478,size.height*-0.001356239);
path_2.lineTo(size.width*0.8629493,size.height*-0.001356239);
path_2.lineTo(size.width*0.8629493,size.height*0.001356239);
path_2.lineTo(size.width*0.8748478,size.height*0.001356239);
path_2.lineTo(size.width*0.8748478,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.8510478,size.height*-0.001356239);
path_2.lineTo(size.width*0.8391493,size.height*-0.001356239);
path_2.lineTo(size.width*0.8391493,size.height*0.001356239);
path_2.lineTo(size.width*0.8510478,size.height*0.001356239);
path_2.lineTo(size.width*0.8510478,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.8272478,size.height*-0.001356239);
path_2.lineTo(size.width*0.8153493,size.height*-0.001356239);
path_2.lineTo(size.width*0.8153493,size.height*0.001356239);
path_2.lineTo(size.width*0.8272478,size.height*0.001356239);
path_2.lineTo(size.width*0.8272478,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.8034478,size.height*-0.001356239);
path_2.lineTo(size.width*0.7915493,size.height*-0.001356239);
path_2.lineTo(size.width*0.7915493,size.height*0.001356239);
path_2.lineTo(size.width*0.8034478,size.height*0.001356239);
path_2.lineTo(size.width*0.8034478,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.7796478,size.height*-0.001356239);
path_2.lineTo(size.width*0.7677493,size.height*-0.001356239);
path_2.lineTo(size.width*0.7677493,size.height*0.001356239);
path_2.lineTo(size.width*0.7796478,size.height*0.001356239);
path_2.lineTo(size.width*0.7796478,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.7558478,size.height*-0.001356239);
path_2.lineTo(size.width*0.7439493,size.height*-0.001356239);
path_2.lineTo(size.width*0.7439493,size.height*0.001356239);
path_2.lineTo(size.width*0.7558478,size.height*0.001356239);
path_2.lineTo(size.width*0.7558478,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.7320478,size.height*-0.001356239);
path_2.lineTo(size.width*0.7201493,size.height*-0.001356239);
path_2.lineTo(size.width*0.7201493,size.height*0.001356239);
path_2.lineTo(size.width*0.7320478,size.height*0.001356239);
path_2.lineTo(size.width*0.7320478,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.7082478,size.height*-0.001356239);
path_2.lineTo(size.width*0.6963493,size.height*-0.001356239);
path_2.lineTo(size.width*0.6963493,size.height*0.001356239);
path_2.lineTo(size.width*0.7082478,size.height*0.001356239);
path_2.lineTo(size.width*0.7082478,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.6844507,size.height*-0.001356239);
path_2.lineTo(size.width*0.6725493,size.height*-0.001356239);
path_2.lineTo(size.width*0.6725493,size.height*0.001356239);
path_2.lineTo(size.width*0.6844507,size.height*0.001356239);
path_2.lineTo(size.width*0.6844507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.6606507,size.height*-0.001356239);
path_2.lineTo(size.width*0.6487493,size.height*-0.001356239);
path_2.lineTo(size.width*0.6487493,size.height*0.001356239);
path_2.lineTo(size.width*0.6606507,size.height*0.001356239);
path_2.lineTo(size.width*0.6606507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.6368507,size.height*-0.001356239);
path_2.lineTo(size.width*0.6249493,size.height*-0.001356239);
path_2.lineTo(size.width*0.6249493,size.height*0.001356239);
path_2.lineTo(size.width*0.6368507,size.height*0.001356239);
path_2.lineTo(size.width*0.6368507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.6130507,size.height*-0.001356239);
path_2.lineTo(size.width*0.6011493,size.height*-0.001356239);
path_2.lineTo(size.width*0.6011493,size.height*0.001356239);
path_2.lineTo(size.width*0.6130507,size.height*0.001356239);
path_2.lineTo(size.width*0.6130507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.5892507,size.height*-0.001356239);
path_2.lineTo(size.width*0.5773493,size.height*-0.001356239);
path_2.lineTo(size.width*0.5773493,size.height*0.001356239);
path_2.lineTo(size.width*0.5892507,size.height*0.001356239);
path_2.lineTo(size.width*0.5892507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.5654507,size.height*-0.001356239);
path_2.lineTo(size.width*0.5535493,size.height*-0.001356239);
path_2.lineTo(size.width*0.5535493,size.height*0.001356239);
path_2.lineTo(size.width*0.5654507,size.height*0.001356239);
path_2.lineTo(size.width*0.5654507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.5416507,size.height*-0.001356239);
path_2.lineTo(size.width*0.5297493,size.height*-0.001356239);
path_2.lineTo(size.width*0.5297493,size.height*0.001356239);
path_2.lineTo(size.width*0.5416507,size.height*0.001356239);
path_2.lineTo(size.width*0.5416507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.5178507,size.height*-0.001356239);
path_2.lineTo(size.width*0.5059493,size.height*-0.001356239);
path_2.lineTo(size.width*0.5059493,size.height*0.001356239);
path_2.lineTo(size.width*0.5178507,size.height*0.001356239);
path_2.lineTo(size.width*0.5178507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.4940507,size.height*-0.001356239);
path_2.lineTo(size.width*0.4821493,size.height*-0.001356239);
path_2.lineTo(size.width*0.4821493,size.height*0.001356239);
path_2.lineTo(size.width*0.4940507,size.height*0.001356239);
path_2.lineTo(size.width*0.4940507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.4702507,size.height*-0.001356239);
path_2.lineTo(size.width*0.4583493,size.height*-0.001356239);
path_2.lineTo(size.width*0.4583493,size.height*0.001356239);
path_2.lineTo(size.width*0.4702507,size.height*0.001356239);
path_2.lineTo(size.width*0.4702507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.4464507,size.height*-0.001356239);
path_2.lineTo(size.width*0.4345493,size.height*-0.001356239);
path_2.lineTo(size.width*0.4345493,size.height*0.001356239);
path_2.lineTo(size.width*0.4464507,size.height*0.001356239);
path_2.lineTo(size.width*0.4464507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.4226507,size.height*-0.001356239);
path_2.lineTo(size.width*0.4107493,size.height*-0.001356239);
path_2.lineTo(size.width*0.4107493,size.height*0.001356239);
path_2.lineTo(size.width*0.4226507,size.height*0.001356239);
path_2.lineTo(size.width*0.4226507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.3988507,size.height*-0.001356239);
path_2.lineTo(size.width*0.3869493,size.height*-0.001356239);
path_2.lineTo(size.width*0.3869493,size.height*0.001356239);
path_2.lineTo(size.width*0.3988507,size.height*0.001356239);
path_2.lineTo(size.width*0.3988507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.3750507,size.height*-0.001356239);
path_2.lineTo(size.width*0.3631493,size.height*-0.001356239);
path_2.lineTo(size.width*0.3631493,size.height*0.001356239);
path_2.lineTo(size.width*0.3750507,size.height*0.001356239);
path_2.lineTo(size.width*0.3750507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.3512507,size.height*-0.001356239);
path_2.lineTo(size.width*0.3393493,size.height*-0.001356239);
path_2.lineTo(size.width*0.3393493,size.height*0.001356239);
path_2.lineTo(size.width*0.3512507,size.height*0.001356239);
path_2.lineTo(size.width*0.3512507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.3274507,size.height*-0.001356239);
path_2.lineTo(size.width*0.3155522,size.height*-0.001356239);
path_2.lineTo(size.width*0.3155522,size.height*0.001356239);
path_2.lineTo(size.width*0.3274507,size.height*0.001356239);
path_2.lineTo(size.width*0.3274507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.3036507,size.height*-0.001356239);
path_2.lineTo(size.width*0.2917510,size.height*-0.001356239);
path_2.lineTo(size.width*0.2917510,size.height*0.001356239);
path_2.lineTo(size.width*0.3036507,size.height*0.001356239);
path_2.lineTo(size.width*0.3036507,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.2798510,size.height*-0.001356239);
path_2.lineTo(size.width*0.2679510,size.height*-0.001356239);
path_2.lineTo(size.width*0.2679510,size.height*0.001356239);
path_2.lineTo(size.width*0.2798510,size.height*0.001356239);
path_2.lineTo(size.width*0.2798510,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.2560510,size.height*-0.001356239);
path_2.lineTo(size.width*0.2441513,size.height*-0.001356239);
path_2.lineTo(size.width*0.2441513,size.height*0.001356239);
path_2.lineTo(size.width*0.2560510,size.height*0.001356239);
path_2.lineTo(size.width*0.2560510,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.2322513,size.height*-0.001356239);
path_2.lineTo(size.width*0.2203513,size.height*-0.001356239);
path_2.lineTo(size.width*0.2203513,size.height*0.001356239);
path_2.lineTo(size.width*0.2322513,size.height*0.001356239);
path_2.lineTo(size.width*0.2322513,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.2084513,size.height*-0.001356239);
path_2.lineTo(size.width*0.1965513,size.height*-0.001356239);
path_2.lineTo(size.width*0.1965513,size.height*0.001356239);
path_2.lineTo(size.width*0.2084513,size.height*0.001356239);
path_2.lineTo(size.width*0.2084513,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.1846516,size.height*-0.001356239);
path_2.lineTo(size.width*0.1727516,size.height*-0.001356239);
path_2.lineTo(size.width*0.1727516,size.height*0.001356239);
path_2.lineTo(size.width*0.1846516,size.height*0.001356239);
path_2.lineTo(size.width*0.1846516,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.1608516,size.height*-0.001356239);
path_2.lineTo(size.width*0.1489516,size.height*-0.001356239);
path_2.lineTo(size.width*0.1489516,size.height*0.001356239);
path_2.lineTo(size.width*0.1608516,size.height*0.001356239);
path_2.lineTo(size.width*0.1608516,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.1370516,size.height*-0.001356239);
path_2.lineTo(size.width*0.1251516,size.height*-0.001356239);
path_2.lineTo(size.width*0.1251516,size.height*0.001356239);
path_2.lineTo(size.width*0.1370516,size.height*0.001356239);
path_2.lineTo(size.width*0.1370516,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.1132519,size.height*-0.001356239);
path_2.lineTo(size.width*0.1013519,size.height*-0.001356239);
path_2.lineTo(size.width*0.1013519,size.height*0.001356239);
path_2.lineTo(size.width*0.1132519,size.height*0.001356239);
path_2.lineTo(size.width*0.1132519,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.08945194,size.height*-0.001356239);
path_2.lineTo(size.width*0.07755194,size.height*-0.001356239);
path_2.lineTo(size.width*0.07755194,size.height*0.001356239);
path_2.lineTo(size.width*0.08945194,size.height*0.001356239);
path_2.lineTo(size.width*0.08945194,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.06565194,size.height*-0.001356239);
path_2.lineTo(size.width*0.05970149,size.height*-0.001356239);
path_2.lineTo(size.width*0.05970149,size.height*0.001356239);
path_2.lineTo(size.width*0.06565194,size.height*0.001356239);
path_2.lineTo(size.width*0.06565194,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.05970149,size.height*-0.001356239);
path_2.cubicTo(size.width*0.05740179,size.height*-0.001356239,size.width*0.05519284,size.height*-0.001356239,size.width*0.05307254,size.height*-0.001353344);
path_2.lineTo(size.width*0.05308269,size.height*0.001359127);
path_2.cubicTo(size.width*0.05519701,size.height*0.001356239,size.width*0.05740060,size.height*0.001356239,size.width*0.05970149,size.height*0.001356239);
path_2.lineTo(size.width*0.05970149,size.height*-0.001356239);
path_2.close();
path_2.moveTo(size.width*0.03978418,size.height*-0.001252121);
path_2.cubicTo(size.width*0.03473701,size.height*-0.001160618,size.width*0.03029075,size.height*-0.0009880362,size.width*0.02636027,size.height*-0.0006582369);
path_2.lineTo(size.width*0.02697460,size.height*0.002028590);
path_2.cubicTo(size.width*0.03067761,size.height*0.001717873,size.width*0.03494388,size.height*0.001549324,size.width*0.03991821,size.height*0.001459143);
path_2.lineTo(size.width*0.03978418,size.height*-0.001252121);
path_2.close();
path_2.moveTo(size.width*0.01297797,size.height*0.001724175);
path_2.cubicTo(size.width*0.01081779,size.height*0.002426781,size.width*0.008892776,size.height*0.003287758,size.width*0.007160000,size.height*0.004337432);
path_2.lineTo(size.width*0.01032615,size.height*0.006255443);
path_2.cubicTo(size.width*0.01174290,size.height*0.005397215,size.width*0.01331310,size.height*0.004693906,size.width*0.01509606,size.height*0.004113978);
path_2.lineTo(size.width*0.01297797,size.height*0.001724175);
path_2.close();
path_2.moveTo(size.width*0.9912567,size.height*0.9947034);
path_2.lineTo(size.width*0.9880896,size.height*0.9927848);
path_2.lineTo(size.width*0.9880896,size.height*0.9927848);
path_2.lineTo(size.width*0.9912567,size.height*0.9947034);
path_2.close();
path_2.moveTo(size.width*0.008743075,size.height*0.9947034);
path_2.lineTo(size.width*0.01190925,size.height*0.9927848);
path_2.lineTo(size.width*0.01190922,size.height*0.9927848);
path_2.lineTo(size.width*0.008743075,size.height*0.9947034);
path_2.close();
path_2.moveTo(size.width*0.01519878,size.height*0.07761157);
path_2.lineTo(size.width*0.01126615,size.height*0.07890850);
path_2.lineTo(size.width*0.01519878,size.height*0.07761157);
path_2.close();
path_2.moveTo(size.width*0.0003690269,size.height*0.06064177);
path_2.lineTo(size.width*0.004708239,size.height*0.05997269);
path_2.lineTo(size.width*0.0003690269,size.height*0.06064177);
path_2.close();
path_2.moveTo(size.width*0.01519878,size.height*0.09056203);
path_2.lineTo(size.width*0.01126615,size.height*0.08926510);
path_2.lineTo(size.width*0.01519878,size.height*0.09056203);
path_2.close();
path_2.moveTo(size.width*0.0003690239,size.height*0.1075318);
path_2.lineTo(size.width*0.004708239,size.height*0.1082009);
path_2.lineTo(size.width*0.0003690239,size.height*0.1075318);
path_2.close();
path_2.moveTo(size.width*0.01519878,size.height*0.2982260);
path_2.lineTo(size.width*0.01126615,size.height*0.2995226);
path_2.lineTo(size.width*0.01519878,size.height*0.2982260);
path_2.close();
path_2.moveTo(size.width*0.0003690239,size.height*0.2812568);
path_2.lineTo(size.width*0.004708239,size.height*0.2805877);
path_2.lineTo(size.width*0.004708239,size.height*0.2805877);
path_2.lineTo(size.width*0.0003690239,size.height*0.2812568);
path_2.close();
path_2.moveTo(size.width*0.9818985,size.height*0.2981338);
path_2.lineTo(size.width*0.9779821,size.height*0.2968192);
path_2.lineTo(size.width*0.9818985,size.height*0.2981338);
path_2.close();
path_2.moveTo(size.width*0.9996209,size.height*0.2783002);
path_2.lineTo(size.width*1.003955,size.height*0.2789783);
path_2.lineTo(size.width*0.9996209,size.height*0.2783002);
path_2.close();
path_2.moveTo(size.width*0.01519878,size.height*0.3111772);
path_2.lineTo(size.width*0.01126615,size.height*0.3098807);
path_2.lineTo(size.width*0.01519878,size.height*0.3111772);
path_2.close();
path_2.moveTo(size.width*0.0003690239,size.height*0.3281465);
path_2.lineTo(size.width*0.004708239,size.height*0.3288156);
path_2.lineTo(size.width*0.0003690239,size.height*0.3281465);
path_2.close();
path_2.moveTo(size.width*0.9818985,size.height*0.09065389);
path_2.lineTo(size.width*0.9858149,size.height*0.08933870);
path_2.lineTo(size.width*0.9818985,size.height*0.09065389);
path_2.close();
path_2.moveTo(size.width*0.9996209,size.height*0.1104892);
path_2.lineTo(size.width*1.003955,size.height*0.1098098);
path_2.lineTo(size.width*0.9996209,size.height*0.1104892);
path_2.close();
path_2.moveTo(size.width*0.9818985,size.height*0.3112694);
path_2.lineTo(size.width*0.9858149,size.height*0.3099530);
path_2.lineTo(size.width*0.9818985,size.height*0.3112694);
path_2.close();
path_2.moveTo(size.width*0.9996209,size.height*0.3311031);
path_2.lineTo(size.width*0.9952836,size.height*0.3317830);
path_2.lineTo(size.width*0.9996209,size.height*0.3311031);
path_2.close();
path_2.moveTo(size.width*0.9996209,size.height*0.05768445);
path_2.lineTo(size.width*0.9952836,size.height*0.05700524);
path_2.lineTo(size.width*0.9996209,size.height*0.05768445);
path_2.close();
path_2.moveTo(size.width*0.005576925,size.height*0.003378427);
path_2.cubicTo(size.width*0.003686149,size.height*0.004523852,size.width*0.002134785,size.height*0.005797468,size.width*0.0008736985,size.height*0.007220325);
path_2.lineTo(size.width*0.008763612,size.height*0.009786564);
path_2.cubicTo(size.width*0.009619642,size.height*0.008820705,size.width*0.01065051,size.height*0.007976962,size.width*0.01190922,size.height*0.007214448);
path_2.lineTo(size.width*0.005576925,size.height*0.003378427);
path_2.close();
path_2.moveTo(size.width*-0.003304209,size.height*0.01578262);
path_2.cubicTo(size.width*-0.003864388,size.height*0.01823255,size.width*-0.004152597,size.height*0.02098047,size.width*-0.004304746,size.height*0.02406022);
path_2.lineTo(size.width*0.004646478,size.height*0.02422260);
path_2.cubicTo(size.width*0.004794239,size.height*0.02123128,size.width*0.005069164,size.height*0.01870127,size.width*0.005566328,size.height*0.01652693);
path_2.lineTo(size.width*-0.003304209,size.height*0.01578262);
path_2.close();
path_2.moveTo(size.width*-0.004472836,size.height*0.03214756);
path_2.cubicTo(size.width*-0.004477612,size.height*0.03343382,size.width*-0.004477612,size.height*0.03477342,size.width*-0.004477612,size.height*0.03616637);
path_2.lineTo(size.width*0.004477612,size.height*0.03616637);
path_2.cubicTo(size.width*0.004477612,size.height*0.03477215,size.width*0.004477612,size.height*0.03343870,size.width*0.004482388,size.height*0.03215986);
path_2.lineTo(size.width*-0.004472836,size.height*0.03214756);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.03616637);
path_2.lineTo(size.width*-0.004477612,size.height*0.03901682);
path_2.lineTo(size.width*0.004477612,size.height*0.03901682);
path_2.lineTo(size.width*0.004477612,size.height*0.03616637);
path_2.lineTo(size.width*-0.004477612,size.height*0.03616637);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.04471790);
path_2.lineTo(size.width*-0.004477612,size.height*0.05041899);
path_2.lineTo(size.width*0.004477612,size.height*0.05041899);
path_2.lineTo(size.width*0.004477612,size.height*0.04471790);
path_2.lineTo(size.width*-0.004477612,size.height*0.04471790);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.05612007);
path_2.lineTo(size.width*-0.004477612,size.height*0.05897071);
path_2.lineTo(size.width*0.004477612,size.height*0.05897071);
path_2.lineTo(size.width*0.004477612,size.height*0.05612007);
path_2.lineTo(size.width*-0.004477612,size.height*0.05612007);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.05897071);
path_2.cubicTo(size.width*-0.004477612,size.height*0.05911483,size.width*-0.004478388,size.height*0.05930922,size.width*-0.004463761,size.height*0.05951212);
path_2.lineTo(size.width*0.004482925,size.height*0.05927541);
path_2.cubicTo(size.width*0.004478388,size.height*0.05921212,size.width*0.004477612,size.height*0.05913978,size.width*0.004477612,size.height*0.05897071);
path_2.lineTo(size.width*-0.004477612,size.height*0.05897071);
path_2.close();
path_2.moveTo(size.width*-0.004166567,size.height*0.06081320);
path_2.cubicTo(size.width*-0.004109701,size.height*0.06096980,size.width*-0.004044239,size.height*0.06113472,size.width*-0.003970209,size.height*0.06131103);
path_2.lineTo(size.width*0.004708239,size.height*0.05997269);
path_2.cubicTo(size.width*0.004652269,size.height*0.05983942,size.width*0.004610597,size.height*0.05973309,size.width*0.004579224,size.height*0.05964684);
path_2.lineTo(size.width*-0.004166567,size.height*0.06081320);
path_2.close();
path_2.moveTo(size.width*-0.003970209,size.height*0.06131103);
path_2.cubicTo(size.width*-0.003741045,size.height*0.06185624,size.width*-0.003150418,size.height*0.06259638,size.width*-0.002641149,size.height*0.06321917);
path_2.cubicTo(size.width*-0.002029421,size.height*0.06396745,size.width*-0.001172036,size.height*0.06496655,size.width*-0.00007805343,size.height*0.06621501);
path_2.lineTo(size.width*0.007831672,size.height*0.06367125);
path_2.cubicTo(size.width*0.006747791,size.height*0.06243436,size.width*0.005938000,size.height*0.06148933,size.width*0.005383642,size.height*0.06081139);
path_2.cubicTo(size.width*0.005105493,size.height*0.06047125,size.width*0.004908418,size.height*0.06021863,size.width*0.004778746,size.height*0.06004105);
path_2.cubicTo(size.width*0.004614030,size.height*0.05981555,size.width*0.004649970,size.height*0.05983400,size.width*0.004708239,size.height*0.05997269);
path_2.lineTo(size.width*-0.003970209,size.height*0.06131103);
path_2.close();
path_2.moveTo(size.width*0.007472746,size.height*0.07468590);
path_2.cubicTo(size.width*0.008642239,size.height*0.07598861,size.width*0.009906537,size.height*0.07739548,size.width*0.01126615,size.height*0.07890850);
path_2.lineTo(size.width*0.01913140,size.height*0.07631465);
path_2.cubicTo(size.width*0.01777158,size.height*0.07480145,size.width*0.01650824,size.height*0.07339566,size.width*0.01533982,size.height*0.07209403);
path_2.lineTo(size.width*0.007472746,size.height*0.07468590);
path_2.close();
path_2.moveTo(size.width*0.01126615,size.height*0.07890850);
path_2.cubicTo(size.width*0.01161958,size.height*0.07930181,size.width*0.01193379,size.height*0.07970958,size.width*0.01220573,size.height*0.08012984);
path_2.lineTo(size.width*0.02054355,size.height*0.07815045);
path_2.cubicTo(size.width*0.02013442,size.height*0.07751808,size.width*0.01966209,size.height*0.07690506,size.width*0.01913140,size.height*0.07631465);
path_2.lineTo(size.width*0.01126615,size.height*0.07890850);
path_2.close();
path_2.moveTo(size.width*0.01329600,size.height*0.08273671);
path_2.cubicTo(size.width*0.01338618,size.height*0.08317794,size.width*0.01343284,size.height*0.08362839,size.width*0.01343284,size.height*0.08408680);
path_2.lineTo(size.width*0.02238806,size.height*0.08408680);
path_2.cubicTo(size.width*0.02238806,size.height*0.08340506,size.width*0.02231863,size.height*0.08273201,size.width*0.02218337,size.height*0.08207016);
path_2.lineTo(size.width*0.01329600,size.height*0.08273671);
path_2.close();
path_2.moveTo(size.width*0.01343284,size.height*0.08408680);
path_2.cubicTo(size.width*0.01343284,size.height*0.08454521,size.width*0.01338618,size.height*0.08499566,size.width*0.01329600,size.height*0.08543689);
path_2.lineTo(size.width*0.02218337,size.height*0.08610344);
path_2.cubicTo(size.width*0.02231863,size.height*0.08544159,size.width*0.02238806,size.height*0.08476854,size.width*0.02238806,size.height*0.08408680);
path_2.lineTo(size.width*0.01343284,size.height*0.08408680);
path_2.close();
path_2.moveTo(size.width*0.01220573,size.height*0.08804376);
path_2.cubicTo(size.width*0.01193379,size.height*0.08846401,size.width*0.01161958,size.height*0.08887179,size.width*0.01126615,size.height*0.08926510);
path_2.lineTo(size.width*0.01913140,size.height*0.09185895);
path_2.cubicTo(size.width*0.01966209,size.height*0.09126854,size.width*0.02013442,size.height*0.09065552,size.width*0.02054355,size.height*0.09002315);
path_2.lineTo(size.width*0.01220573,size.height*0.08804376);
path_2.close();
path_2.moveTo(size.width*0.01126615,size.height*0.08926510);
path_2.cubicTo(size.width*0.009906537,size.height*0.09077812,size.width*0.008642239,size.height*0.09218499,size.width*0.007472746,size.height*0.09348770);
path_2.lineTo(size.width*0.01533982,size.height*0.09607957);
path_2.cubicTo(size.width*0.01650824,size.height*0.09477794,size.width*0.01777158,size.height*0.09337215,size.width*0.01913140,size.height*0.09185895);
path_2.lineTo(size.width*0.01126615,size.height*0.08926510);
path_2.close();
path_2.moveTo(size.width*-0.00007805254,size.height*0.1019586);
path_2.cubicTo(size.width*-0.001172036,size.height*0.1032071,size.width*-0.002029421,size.height*0.1042061,size.width*-0.002641149,size.height*0.1049544);
path_2.cubicTo(size.width*-0.003150418,size.height*0.1055772,size.width*-0.003741045,size.height*0.1063174,size.width*-0.003970209,size.height*0.1068626);
path_2.lineTo(size.width*0.004708239,size.height*0.1082009);
path_2.cubicTo(size.width*0.004649970,size.height*0.1083396,size.width*0.004614030,size.height*0.1083580,size.width*0.004778746,size.height*0.1081325);
path_2.cubicTo(size.width*0.004908418,size.height*0.1079550,size.width*0.005105493,size.height*0.1077024,size.width*0.005383642,size.height*0.1073622);
path_2.cubicTo(size.width*0.005938000,size.height*0.1066843,size.width*0.006747791,size.height*0.1057392,size.width*0.007831701,size.height*0.1045024);
path_2.lineTo(size.width*-0.00007805254,size.height*0.1019586);
path_2.close();
path_2.moveTo(size.width*-0.003970209,size.height*0.1068626);
path_2.cubicTo(size.width*-0.004044239,size.height*0.1070389,size.width*-0.004109701,size.height*0.1072038,size.width*-0.004166567,size.height*0.1073604);
path_2.lineTo(size.width*0.004579224,size.height*0.1085268);
path_2.cubicTo(size.width*0.004610597,size.height*0.1084405,size.width*0.004652269,size.height*0.1083342,size.width*0.004708239,size.height*0.1082009);
path_2.lineTo(size.width*-0.003970209,size.height*0.1068626);
path_2.close();
path_2.moveTo(size.width*-0.004463761,size.height*0.1086615);
path_2.cubicTo(size.width*-0.004478388,size.height*0.1088644,size.width*-0.004477612,size.height*0.1090588,size.width*-0.004477612,size.height*0.1092029);
path_2.lineTo(size.width*0.004477612,size.height*0.1092029);
path_2.cubicTo(size.width*0.004477612,size.height*0.1090338,size.width*0.004478388,size.height*0.1089615,size.width*0.004482925,size.height*0.1088982);
path_2.lineTo(size.width*-0.004463761,size.height*0.1086615);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.1092029);
path_2.lineTo(size.width*-0.004477612,size.height*0.1127526);
path_2.lineTo(size.width*0.004477612,size.height*0.1127526);
path_2.lineTo(size.width*0.004477612,size.height*0.1092029);
path_2.lineTo(size.width*-0.004477612,size.height*0.1092029);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.1198519);
path_2.lineTo(size.width*-0.004477612,size.height*0.1269512);
path_2.lineTo(size.width*0.004477612,size.height*0.1269512);
path_2.lineTo(size.width*0.004477612,size.height*0.1198519);
path_2.lineTo(size.width*-0.004477612,size.height*0.1198519);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.1340505);
path_2.lineTo(size.width*-0.004477612,size.height*0.1411497);
path_2.lineTo(size.width*0.004477612,size.height*0.1411497);
path_2.lineTo(size.width*0.004477612,size.height*0.1340505);
path_2.lineTo(size.width*-0.004477612,size.height*0.1340505);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.1482490);
path_2.lineTo(size.width*-0.004477612,size.height*0.1553483);
path_2.lineTo(size.width*0.004477612,size.height*0.1553483);
path_2.lineTo(size.width*0.004477612,size.height*0.1482490);
path_2.lineTo(size.width*-0.004477612,size.height*0.1482490);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.1624474);
path_2.lineTo(size.width*-0.004477612,size.height*0.1695467);
path_2.lineTo(size.width*0.004477612,size.height*0.1695467);
path_2.lineTo(size.width*0.004477612,size.height*0.1624474);
path_2.lineTo(size.width*-0.004477612,size.height*0.1624474);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.1766459);
path_2.lineTo(size.width*-0.004477612,size.height*0.1837450);
path_2.lineTo(size.width*0.004477612,size.height*0.1837450);
path_2.lineTo(size.width*0.004477612,size.height*0.1766459);
path_2.lineTo(size.width*-0.004477612,size.height*0.1766459);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.1908445);
path_2.lineTo(size.width*-0.004477612,size.height*0.1979439);
path_2.lineTo(size.width*0.004477612,size.height*0.1979439);
path_2.lineTo(size.width*0.004477612,size.height*0.1908445);
path_2.lineTo(size.width*-0.004477612,size.height*0.1908445);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.2050434);
path_2.lineTo(size.width*-0.004477612,size.height*0.2121429);
path_2.lineTo(size.width*0.004477612,size.height*0.2121429);
path_2.lineTo(size.width*0.004477612,size.height*0.2050434);
path_2.lineTo(size.width*-0.004477612,size.height*0.2050434);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.2192423);
path_2.lineTo(size.width*-0.004477612,size.height*0.2263418);
path_2.lineTo(size.width*0.004477612,size.height*0.2263418);
path_2.lineTo(size.width*0.004477612,size.height*0.2192423);
path_2.lineTo(size.width*-0.004477612,size.height*0.2192423);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.2334394);
path_2.lineTo(size.width*-0.004477612,size.height*0.2405389);
path_2.lineTo(size.width*0.004477612,size.height*0.2405389);
path_2.lineTo(size.width*0.004477612,size.height*0.2334394);
path_2.lineTo(size.width*-0.004477612,size.height*0.2334394);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.2476383);
path_2.lineTo(size.width*-0.004477612,size.height*0.2547378);
path_2.lineTo(size.width*0.004477612,size.height*0.2547378);
path_2.lineTo(size.width*0.004477612,size.height*0.2476383);
path_2.lineTo(size.width*-0.004477612,size.height*0.2476383);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.2618373);
path_2.lineTo(size.width*-0.004477612,size.height*0.2689367);
path_2.lineTo(size.width*0.004477612,size.height*0.2689367);
path_2.lineTo(size.width*0.004477612,size.height*0.2618373);
path_2.lineTo(size.width*-0.004477612,size.height*0.2618373);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.2760362);
path_2.lineTo(size.width*-0.004477612,size.height*0.2795859);
path_2.lineTo(size.width*0.004477612,size.height*0.2795859);
path_2.lineTo(size.width*0.004477612,size.height*0.2760362);
path_2.lineTo(size.width*-0.004477612,size.height*0.2760362);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.2795859);
path_2.cubicTo(size.width*-0.004477612,size.height*0.2797288,size.width*-0.004478388,size.height*0.2799241,size.width*-0.004463761,size.height*0.2801266);
path_2.lineTo(size.width*0.004482925,size.height*0.2798897);
path_2.cubicTo(size.width*0.004478388,size.height*0.2798264,size.width*0.004477612,size.height*0.2797541,size.width*0.004477612,size.height*0.2795859);
path_2.lineTo(size.width*-0.004477612,size.height*0.2795859);
path_2.close();
path_2.moveTo(size.width*-0.004166567,size.height*0.2814286);
path_2.cubicTo(size.width*-0.004109701,size.height*0.2815841,size.width*-0.004044239,size.height*0.2817505,size.width*-0.003970209,size.height*0.2819259);
path_2.lineTo(size.width*0.004708239,size.height*0.2805877);
path_2.cubicTo(size.width*0.004652269,size.height*0.2804539,size.width*0.004610597,size.height*0.2803472,size.width*0.004579224,size.height*0.2802622);
path_2.lineTo(size.width*-0.004166567,size.height*0.2814286);
path_2.close();
path_2.moveTo(size.width*-0.003970209,size.height*0.2819259);
path_2.cubicTo(size.width*-0.003741045,size.height*0.2824720,size.width*-0.003150418,size.height*0.2832116,size.width*-0.002641152,size.height*0.2838336);
path_2.cubicTo(size.width*-0.002029424,size.height*0.2845823,size.width*-0.001172036,size.height*0.2855823,size.width*-0.00007805433,size.height*0.2868300);
path_2.lineTo(size.width*0.007831701,size.height*0.2842857);
path_2.cubicTo(size.width*0.006747791,size.height*0.2830488,size.width*0.005938000,size.height*0.2821049,size.width*0.005383642,size.height*0.2814268);
path_2.cubicTo(size.width*0.005105493,size.height*0.2810868,size.width*0.004908418,size.height*0.2808336,size.width*0.004778746,size.height*0.2806564);
path_2.cubicTo(size.width*0.004614030,size.height*0.2804304,size.width*0.004649970,size.height*0.2804485,size.width*0.004708239,size.height*0.2805877);
path_2.lineTo(size.width*-0.003970209,size.height*0.2819259);
path_2.close();
path_2.moveTo(size.width*0.007472746,size.height*0.2953002);
path_2.cubicTo(size.width*0.008642269,size.height*0.2966040,size.width*0.009906537,size.height*0.2980108,size.width*0.01126615,size.height*0.2995226);
path_2.lineTo(size.width*0.01913140,size.height*0.2969295);
path_2.cubicTo(size.width*0.01777158,size.height*0.2954159,size.width*0.01650824,size.height*0.2940108,size.width*0.01533982,size.height*0.2927089);
path_2.lineTo(size.width*0.007472746,size.height*0.2953002);
path_2.close();
path_2.moveTo(size.width*0.01126615,size.height*0.2995226);
path_2.cubicTo(size.width*0.01161958,size.height*0.2999168,size.width*0.01193379,size.height*0.3003237,size.width*0.01220573,size.height*0.3007450);
path_2.lineTo(size.width*0.02054355,size.height*0.2987649);
path_2.cubicTo(size.width*0.02013442,size.height*0.2981320,size.width*0.01966209,size.height*0.2975208,size.width*0.01913140,size.height*0.2969295);
path_2.lineTo(size.width*0.01126615,size.height*0.2995226);
path_2.close();
path_2.moveTo(size.width*0.01329600,size.height*0.3033508);
path_2.cubicTo(size.width*0.01338618,size.height*0.3037920,size.width*0.01343284,size.height*0.3042441,size.width*0.01343284,size.height*0.3047016);
path_2.lineTo(size.width*0.02238806,size.height*0.3047016);
path_2.cubicTo(size.width*0.02238806,size.height*0.3040199,size.width*0.02231863,size.height*0.3033472,size.width*0.02218337,size.height*0.3026854);
path_2.lineTo(size.width*0.01329600,size.height*0.3033508);
path_2.close();
path_2.moveTo(size.width*0.01343284,size.height*0.3047016);
path_2.cubicTo(size.width*0.01343284,size.height*0.3051591,size.width*0.01338618,size.height*0.3056112,size.width*0.01329600,size.height*0.3060524);
path_2.lineTo(size.width*0.02218337,size.height*0.3067179);
path_2.cubicTo(size.width*0.02231863,size.height*0.3060561,size.width*0.02238806,size.height*0.3053834,size.width*0.02238806,size.height*0.3047016);
path_2.lineTo(size.width*0.01343284,size.height*0.3047016);
path_2.close();
path_2.moveTo(size.width*0.01220573,size.height*0.3086582);
path_2.cubicTo(size.width*0.01193379,size.height*0.3090796,size.width*0.01161958,size.height*0.3094864,size.width*0.01126615,size.height*0.3098807);
path_2.lineTo(size.width*0.01913140,size.height*0.3124738);
path_2.cubicTo(size.width*0.01966209,size.height*0.3118825,size.width*0.02013442,size.height*0.3112712,size.width*0.02054355,size.height*0.3106383);
path_2.lineTo(size.width*0.01220573,size.height*0.3086582);
path_2.close();
path_2.moveTo(size.width*0.01126615,size.height*0.3098807);
path_2.cubicTo(size.width*0.009906537,size.height*0.3113924,size.width*0.008642269,size.height*0.3127993,size.width*0.007472746,size.height*0.3141031);
path_2.lineTo(size.width*0.01533982,size.height*0.3166944);
path_2.cubicTo(size.width*0.01650824,size.height*0.3153924,size.width*0.01777158,size.height*0.3139873,size.width*0.01913140,size.height*0.3124738);
path_2.lineTo(size.width*0.01126615,size.height*0.3098807);
path_2.close();
path_2.moveTo(size.width*-0.00007805343,size.height*0.3225732);
path_2.cubicTo(size.width*-0.001172036,size.height*0.3238210,size.width*-0.002029424,size.height*0.3248210,size.width*-0.002641152,size.height*0.3255696);
path_2.cubicTo(size.width*-0.003150418,size.height*0.3261917,size.width*-0.003741045,size.height*0.3269313,size.width*-0.003970209,size.height*0.3274774);
path_2.lineTo(size.width*0.004708239,size.height*0.3288156);
path_2.cubicTo(size.width*0.004649970,size.height*0.3289548,size.width*0.004614030,size.height*0.3289729,size.width*0.004778746,size.height*0.3287468);
path_2.cubicTo(size.width*0.004908418,size.height*0.3285696,size.width*0.005105493,size.height*0.3283165,size.width*0.005383642,size.height*0.3279765);
path_2.cubicTo(size.width*0.005938000,size.height*0.3272984,size.width*0.006747791,size.height*0.3263544,size.width*0.007831701,size.height*0.3251175);
path_2.lineTo(size.width*-0.00007805343,size.height*0.3225732);
path_2.close();
path_2.moveTo(size.width*-0.003970209,size.height*0.3274774);
path_2.cubicTo(size.width*-0.004044239,size.height*0.3276528,size.width*-0.004109701,size.height*0.3278192,size.width*-0.004166567,size.height*0.3279747);
path_2.lineTo(size.width*0.004579224,size.height*0.3291410);
path_2.cubicTo(size.width*0.004610597,size.height*0.3290561,size.width*0.004652269,size.height*0.3289494,size.width*0.004708239,size.height*0.3288156);
path_2.lineTo(size.width*-0.003970209,size.height*0.3274774);
path_2.close();
path_2.moveTo(size.width*-0.004463761,size.height*0.3292767);
path_2.cubicTo(size.width*-0.004478388,size.height*0.3294792,size.width*-0.004477612,size.height*0.3296745,size.width*-0.004477612,size.height*0.3298174);
path_2.lineTo(size.width*0.004477612,size.height*0.3298174);
path_2.cubicTo(size.width*0.004477612,size.height*0.3296492,size.width*0.004478388,size.height*0.3295769,size.width*0.004482925,size.height*0.3295136);
path_2.lineTo(size.width*-0.004463761,size.height*0.3292767);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.3298174);
path_2.lineTo(size.width*-0.004477612,size.height*0.3334195);
path_2.lineTo(size.width*0.004477612,size.height*0.3334195);
path_2.lineTo(size.width*0.004477612,size.height*0.3298174);
path_2.lineTo(size.width*-0.004477612,size.height*0.3298174);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.3406257);
path_2.lineTo(size.width*-0.004477612,size.height*0.3478300);
path_2.lineTo(size.width*0.004477612,size.height*0.3478300);
path_2.lineTo(size.width*0.004477612,size.height*0.3406257);
path_2.lineTo(size.width*-0.004477612,size.height*0.3406257);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.3550344);
path_2.lineTo(size.width*-0.004477612,size.height*0.3622387);
path_2.lineTo(size.width*0.004477612,size.height*0.3622387);
path_2.lineTo(size.width*0.004477612,size.height*0.3550344);
path_2.lineTo(size.width*-0.004477612,size.height*0.3550344);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.3694430);
path_2.lineTo(size.width*-0.004477612,size.height*0.3766492);
path_2.lineTo(size.width*0.004477612,size.height*0.3766492);
path_2.lineTo(size.width*0.004477612,size.height*0.3694430);
path_2.lineTo(size.width*-0.004477612,size.height*0.3694430);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.3838535);
path_2.lineTo(size.width*-0.004477612,size.height*0.3910579);
path_2.lineTo(size.width*0.004477612,size.height*0.3910579);
path_2.lineTo(size.width*0.004477612,size.height*0.3838535);
path_2.lineTo(size.width*-0.004477612,size.height*0.3838535);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.3982622);
path_2.lineTo(size.width*-0.004477612,size.height*0.4054665);
path_2.lineTo(size.width*0.004477612,size.height*0.4054665);
path_2.lineTo(size.width*0.004477612,size.height*0.3982622);
path_2.lineTo(size.width*-0.004477612,size.height*0.3982622);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.4126727);
path_2.lineTo(size.width*-0.004477612,size.height*0.4198770);
path_2.lineTo(size.width*0.004477612,size.height*0.4198770);
path_2.lineTo(size.width*0.004477612,size.height*0.4126727);
path_2.lineTo(size.width*-0.004477612,size.height*0.4126727);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.4270814);
path_2.lineTo(size.width*-0.004477612,size.height*0.4342857);
path_2.lineTo(size.width*0.004477612,size.height*0.4342857);
path_2.lineTo(size.width*0.004477612,size.height*0.4270814);
path_2.lineTo(size.width*-0.004477612,size.height*0.4270814);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.4414919);
path_2.lineTo(size.width*-0.004477612,size.height*0.4486962);
path_2.lineTo(size.width*0.004477612,size.height*0.4486962);
path_2.lineTo(size.width*0.004477612,size.height*0.4414919);
path_2.lineTo(size.width*-0.004477612,size.height*0.4414919);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.4559005);
path_2.lineTo(size.width*-0.004477612,size.height*0.4631049);
path_2.lineTo(size.width*0.004477612,size.height*0.4631049);
path_2.lineTo(size.width*0.004477612,size.height*0.4559005);
path_2.lineTo(size.width*-0.004477612,size.height*0.4559005);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.4703092);
path_2.lineTo(size.width*-0.004477612,size.height*0.4775154);
path_2.lineTo(size.width*0.004477612,size.height*0.4775154);
path_2.lineTo(size.width*0.004477612,size.height*0.4703092);
path_2.lineTo(size.width*-0.004477612,size.height*0.4703092);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.4847197);
path_2.lineTo(size.width*-0.004477612,size.height*0.4919241);
path_2.lineTo(size.width*0.004477612,size.height*0.4919241);
path_2.lineTo(size.width*0.004477612,size.height*0.4847197);
path_2.lineTo(size.width*-0.004477612,size.height*0.4847197);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.4991284);
path_2.lineTo(size.width*-0.004477612,size.height*0.5063327);
path_2.lineTo(size.width*0.004477612,size.height*0.5063327);
path_2.lineTo(size.width*0.004477612,size.height*0.4991284);
path_2.lineTo(size.width*-0.004477612,size.height*0.4991284);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.5135389);
path_2.lineTo(size.width*-0.004477612,size.height*0.5207432);
path_2.lineTo(size.width*0.004477612,size.height*0.5207432);
path_2.lineTo(size.width*0.004477612,size.height*0.5135389);
path_2.lineTo(size.width*-0.004477612,size.height*0.5135389);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.5279476);
path_2.lineTo(size.width*-0.004477612,size.height*0.5351519);
path_2.lineTo(size.width*0.004477612,size.height*0.5351519);
path_2.lineTo(size.width*0.004477612,size.height*0.5279476);
path_2.lineTo(size.width*-0.004477612,size.height*0.5279476);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.5423580);
path_2.lineTo(size.width*-0.004477612,size.height*0.5495624);
path_2.lineTo(size.width*0.004477612,size.height*0.5495624);
path_2.lineTo(size.width*0.004477612,size.height*0.5423580);
path_2.lineTo(size.width*-0.004477612,size.height*0.5423580);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.5567667);
path_2.lineTo(size.width*-0.004477612,size.height*0.5639711);
path_2.lineTo(size.width*0.004477612,size.height*0.5639711);
path_2.lineTo(size.width*0.004477612,size.height*0.5567667);
path_2.lineTo(size.width*-0.004477612,size.height*0.5567667);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.5711754);
path_2.lineTo(size.width*-0.004477612,size.height*0.5783816);
path_2.lineTo(size.width*0.004477612,size.height*0.5783816);
path_2.lineTo(size.width*0.004477612,size.height*0.5711754);
path_2.lineTo(size.width*-0.004477612,size.height*0.5711754);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.5855859);
path_2.lineTo(size.width*-0.004477612,size.height*0.5927902);
path_2.lineTo(size.width*0.004477612,size.height*0.5927902);
path_2.lineTo(size.width*0.004477612,size.height*0.5855859);
path_2.lineTo(size.width*-0.004477612,size.height*0.5855859);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.5999946);
path_2.lineTo(size.width*-0.004477612,size.height*0.6071989);
path_2.lineTo(size.width*0.004477612,size.height*0.6071989);
path_2.lineTo(size.width*0.004477612,size.height*0.5999946);
path_2.lineTo(size.width*-0.004477612,size.height*0.5999946);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.6144051);
path_2.lineTo(size.width*-0.004477612,size.height*0.6216094);
path_2.lineTo(size.width*0.004477612,size.height*0.6216094);
path_2.lineTo(size.width*0.004477612,size.height*0.6144051);
path_2.lineTo(size.width*-0.004477612,size.height*0.6144051);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.6288137);
path_2.lineTo(size.width*-0.004477612,size.height*0.6360181);
path_2.lineTo(size.width*0.004477612,size.height*0.6360181);
path_2.lineTo(size.width*0.004477612,size.height*0.6288137);
path_2.lineTo(size.width*-0.004477612,size.height*0.6288137);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.6432224);
path_2.lineTo(size.width*-0.004477612,size.height*0.6504286);
path_2.lineTo(size.width*0.004477612,size.height*0.6504286);
path_2.lineTo(size.width*0.004477612,size.height*0.6432224);
path_2.lineTo(size.width*-0.004477612,size.height*0.6432224);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.6576329);
path_2.lineTo(size.width*-0.004477612,size.height*0.6648373);
path_2.lineTo(size.width*0.004477612,size.height*0.6648373);
path_2.lineTo(size.width*0.004477612,size.height*0.6576329);
path_2.lineTo(size.width*-0.004477612,size.height*0.6576329);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.6720416);
path_2.lineTo(size.width*-0.004477612,size.height*0.6792459);
path_2.lineTo(size.width*0.004477612,size.height*0.6792459);
path_2.lineTo(size.width*0.004477612,size.height*0.6720416);
path_2.lineTo(size.width*-0.004477612,size.height*0.6720416);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.6864521);
path_2.lineTo(size.width*-0.004477612,size.height*0.6936564);
path_2.lineTo(size.width*0.004477612,size.height*0.6936564);
path_2.lineTo(size.width*0.004477612,size.height*0.6864521);
path_2.lineTo(size.width*-0.004477612,size.height*0.6864521);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.7008608);
path_2.lineTo(size.width*-0.004477612,size.height*0.7080651);
path_2.lineTo(size.width*0.004477612,size.height*0.7080651);
path_2.lineTo(size.width*0.004477612,size.height*0.7008608);
path_2.lineTo(size.width*-0.004477612,size.height*0.7008608);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.7152712);
path_2.lineTo(size.width*-0.004477612,size.height*0.7224756);
path_2.lineTo(size.width*0.004477612,size.height*0.7224756);
path_2.lineTo(size.width*0.004477612,size.height*0.7152712);
path_2.lineTo(size.width*-0.004477612,size.height*0.7152712);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.7296799);
path_2.lineTo(size.width*-0.004477612,size.height*0.7368843);
path_2.lineTo(size.width*0.004477612,size.height*0.7368843);
path_2.lineTo(size.width*0.004477612,size.height*0.7296799);
path_2.lineTo(size.width*-0.004477612,size.height*0.7296799);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.7440886);
path_2.lineTo(size.width*-0.004477612,size.height*0.7512948);
path_2.lineTo(size.width*0.004477612,size.height*0.7512948);
path_2.lineTo(size.width*0.004477612,size.height*0.7440886);
path_2.lineTo(size.width*-0.004477612,size.height*0.7440886);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.7584991);
path_2.lineTo(size.width*-0.004477612,size.height*0.7657034);
path_2.lineTo(size.width*0.004477612,size.height*0.7657034);
path_2.lineTo(size.width*0.004477612,size.height*0.7584991);
path_2.lineTo(size.width*-0.004477612,size.height*0.7584991);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.7729078);
path_2.lineTo(size.width*-0.004477612,size.height*0.7801121);
path_2.lineTo(size.width*0.004477612,size.height*0.7801121);
path_2.lineTo(size.width*0.004477612,size.height*0.7729078);
path_2.lineTo(size.width*-0.004477612,size.height*0.7729078);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.7873183);
path_2.lineTo(size.width*-0.004477612,size.height*0.7945226);
path_2.lineTo(size.width*0.004477612,size.height*0.7945226);
path_2.lineTo(size.width*0.004477612,size.height*0.7873183);
path_2.lineTo(size.width*-0.004477612,size.height*0.7873183);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.8017269);
path_2.lineTo(size.width*-0.004477612,size.height*0.8089313);
path_2.lineTo(size.width*0.004477612,size.height*0.8089313);
path_2.lineTo(size.width*0.004477612,size.height*0.8017269);
path_2.lineTo(size.width*-0.004477612,size.height*0.8017269);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.8161356);
path_2.lineTo(size.width*-0.004477612,size.height*0.8233418);
path_2.lineTo(size.width*0.004477612,size.height*0.8233418);
path_2.lineTo(size.width*0.004477612,size.height*0.8161356);
path_2.lineTo(size.width*-0.004477612,size.height*0.8161356);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.8305461);
path_2.lineTo(size.width*-0.004477612,size.height*0.8377505);
path_2.lineTo(size.width*0.004477612,size.height*0.8377505);
path_2.lineTo(size.width*0.004477612,size.height*0.8305461);
path_2.lineTo(size.width*-0.004477612,size.height*0.8305461);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.8449548);
path_2.lineTo(size.width*-0.004477612,size.height*0.8521609);
path_2.lineTo(size.width*0.004477612,size.height*0.8521609);
path_2.lineTo(size.width*0.004477612,size.height*0.8449548);
path_2.lineTo(size.width*-0.004477612,size.height*0.8449548);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.8593653);
path_2.lineTo(size.width*-0.004477612,size.height*0.8665696);
path_2.lineTo(size.width*0.004477612,size.height*0.8665696);
path_2.lineTo(size.width*0.004477612,size.height*0.8593653);
path_2.lineTo(size.width*-0.004477612,size.height*0.8593653);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.8737740);
path_2.lineTo(size.width*-0.004477612,size.height*0.8809783);
path_2.lineTo(size.width*0.004477612,size.height*0.8809783);
path_2.lineTo(size.width*0.004477612,size.height*0.8737740);
path_2.lineTo(size.width*-0.004477612,size.height*0.8737740);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.8881844);
path_2.lineTo(size.width*-0.004477612,size.height*0.8953888);
path_2.lineTo(size.width*0.004477612,size.height*0.8953888);
path_2.lineTo(size.width*0.004477612,size.height*0.8881844);
path_2.lineTo(size.width*-0.004477612,size.height*0.8881844);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.9025931);
path_2.lineTo(size.width*-0.004477612,size.height*0.9097975);
path_2.lineTo(size.width*0.004477612,size.height*0.9097975);
path_2.lineTo(size.width*0.004477612,size.height*0.9025931);
path_2.lineTo(size.width*-0.004477612,size.height*0.9025931);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.9170036);
path_2.lineTo(size.width*-0.004477612,size.height*0.9242080);
path_2.lineTo(size.width*0.004477612,size.height*0.9242080);
path_2.lineTo(size.width*0.004477612,size.height*0.9170036);
path_2.lineTo(size.width*-0.004477612,size.height*0.9170036);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.9314123);
path_2.lineTo(size.width*-0.004477612,size.height*0.9386166);
path_2.lineTo(size.width*0.004477612,size.height*0.9386166);
path_2.lineTo(size.width*0.004477612,size.height*0.9314123);
path_2.lineTo(size.width*-0.004477612,size.height*0.9314123);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.9458210);
path_2.lineTo(size.width*-0.004477612,size.height*0.9530271);
path_2.lineTo(size.width*0.004477612,size.height*0.9530271);
path_2.lineTo(size.width*0.004477612,size.height*0.9458210);
path_2.lineTo(size.width*-0.004477612,size.height*0.9458210);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.9602315);
path_2.lineTo(size.width*-0.004477612,size.height*0.9638336);
path_2.lineTo(size.width*0.004477612,size.height*0.9638336);
path_2.lineTo(size.width*0.004477612,size.height*0.9602315);
path_2.lineTo(size.width*-0.004477612,size.height*0.9602315);
path_2.close();
path_2.moveTo(size.width*-0.004477612,size.height*0.9638336);
path_2.cubicTo(size.width*-0.004477612,size.height*0.9652260,size.width*-0.004477612,size.height*0.9665660,size.width*-0.004472836,size.height*0.9678517);
path_2.lineTo(size.width*0.004482388,size.height*0.9678409);
path_2.cubicTo(size.width*0.004477612,size.height*0.9665606,size.width*0.004477612,size.height*0.9652278,size.width*0.004477612,size.height*0.9638336);
path_2.lineTo(size.width*-0.004477612,size.height*0.9638336);
path_2.close();
path_2.moveTo(size.width*-0.004304746,size.height*0.9759403);
path_2.cubicTo(size.width*-0.004152597,size.height*0.9790199,size.width*-0.003864388,size.height*0.9817667,size.width*-0.003304239,size.height*0.9842170);
path_2.lineTo(size.width*0.005566328,size.height*0.9834738);
path_2.cubicTo(size.width*0.005069164,size.height*0.9812984,size.width*0.004794239,size.height*0.9787685,size.width*0.004646478,size.height*0.9757776);
path_2.lineTo(size.width*-0.004304746,size.height*0.9759403);
path_2.close();
path_2.moveTo(size.width*0.0008736896,size.height*0.9927794);
path_2.cubicTo(size.width*0.002134782,size.height*0.9942025,size.width*0.003686149,size.height*0.9954756,size.width*0.005576955,size.height*0.9966221);
path_2.lineTo(size.width*0.01190922,size.height*0.9927848);
path_2.cubicTo(size.width*0.01065051,size.height*0.9920235,size.width*0.009619642,size.height*0.9911790,size.width*0.008763582,size.height*0.9902134);
path_2.lineTo(size.width*0.0008736896,size.height*0.9927794);
path_2.close();
path_2.moveTo(size.width*0.005576925,size.height*0.9966221);
path_2.cubicTo(size.width*0.007467701,size.height*0.9977667,size.width*0.009570119,size.height*0.9987071,size.width*0.01191890,size.height*0.9994702);
path_2.lineTo(size.width*0.01615513,size.height*0.9946908);
path_2.cubicTo(size.width*0.01456075,size.height*0.9941718,size.width*0.01316794,size.height*0.9935479,size.width*0.01190925,size.height*0.9927848);
path_2.lineTo(size.width*0.005576925,size.height*0.9966221);
path_2.close();
path_2.moveTo(size.width*0.02605310,size.height*1.002002);
path_2.cubicTo(size.width*0.03009731,size.height*1.002342,size.width*0.03463343,size.height*1.002515,size.width*0.03971731,size.height*1.002608);
path_2.lineTo(size.width*0.03998537,size.height*0.9971844);
path_2.cubicTo(size.width*0.03504716,size.height*0.9970958,size.width*0.03087104,size.height*0.9969295,size.width*0.02728176,size.height*0.9966275);
path_2.lineTo(size.width*0.02605310,size.height*1.002002);
path_2.close();
path_2.moveTo(size.width*0.05306746,size.height*1.002709);
path_2.cubicTo(size.width*0.05519075,size.height*1.002712,size.width*0.05740209,size.height*1.002712,size.width*0.05970149,size.height*1.002712);
path_2.lineTo(size.width*0.05970149,size.height*0.9972875);
path_2.cubicTo(size.width*0.05740000,size.height*0.9972875,size.width*0.05519881,size.height*0.9972875,size.width*0.05308776,size.height*0.9972839);
path_2.lineTo(size.width*0.05306746,size.height*1.002709);
path_2.close();
path_2.moveTo(size.width*0.05970149,size.height*1.002712);
path_2.lineTo(size.width*0.06565134,size.height*1.002712);
path_2.lineTo(size.width*0.06565134,size.height*0.9972875);
path_2.lineTo(size.width*0.05970149,size.height*0.9972875);
path_2.lineTo(size.width*0.05970149,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.07755134,size.height*1.002712);
path_2.lineTo(size.width*0.08945134,size.height*1.002712);
path_2.lineTo(size.width*0.08945134,size.height*0.9972875);
path_2.lineTo(size.width*0.07755134,size.height*0.9972875);
path_2.lineTo(size.width*0.07755134,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.1013513,size.height*1.002712);
path_2.lineTo(size.width*0.1132513,size.height*1.002712);
path_2.lineTo(size.width*0.1132513,size.height*0.9972875);
path_2.lineTo(size.width*0.1013513,size.height*0.9972875);
path_2.lineTo(size.width*0.1013513,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.1251513,size.height*1.002712);
path_2.lineTo(size.width*0.1370513,size.height*1.002712);
path_2.lineTo(size.width*0.1370513,size.height*0.9972875);
path_2.lineTo(size.width*0.1251513,size.height*0.9972875);
path_2.lineTo(size.width*0.1251513,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.1489513,size.height*1.002712);
path_2.lineTo(size.width*0.1608510,size.height*1.002712);
path_2.lineTo(size.width*0.1608510,size.height*0.9972875);
path_2.lineTo(size.width*0.1489513,size.height*0.9972875);
path_2.lineTo(size.width*0.1489513,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.1727510,size.height*1.002712);
path_2.lineTo(size.width*0.1846510,size.height*1.002712);
path_2.lineTo(size.width*0.1846510,size.height*0.9972875);
path_2.lineTo(size.width*0.1727510,size.height*0.9972875);
path_2.lineTo(size.width*0.1727510,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.1965510,size.height*1.002712);
path_2.lineTo(size.width*0.2084510,size.height*1.002712);
path_2.lineTo(size.width*0.2084510,size.height*0.9972875);
path_2.lineTo(size.width*0.1965510,size.height*0.9972875);
path_2.lineTo(size.width*0.1965510,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.2203510,size.height*1.002712);
path_2.lineTo(size.width*0.2322510,size.height*1.002712);
path_2.lineTo(size.width*0.2322510,size.height*0.9972875);
path_2.lineTo(size.width*0.2203510,size.height*0.9972875);
path_2.lineTo(size.width*0.2203510,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.2441510,size.height*1.002712);
path_2.lineTo(size.width*0.2560507,size.height*1.002712);
path_2.lineTo(size.width*0.2560507,size.height*0.9972875);
path_2.lineTo(size.width*0.2441510,size.height*0.9972875);
path_2.lineTo(size.width*0.2441510,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.2679507,size.height*1.002712);
path_2.lineTo(size.width*0.2798507,size.height*1.002712);
path_2.lineTo(size.width*0.2798507,size.height*0.9972875);
path_2.lineTo(size.width*0.2679507,size.height*0.9972875);
path_2.lineTo(size.width*0.2679507,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.2917507,size.height*1.002712);
path_2.lineTo(size.width*0.3036507,size.height*1.002712);
path_2.lineTo(size.width*0.3036507,size.height*0.9972875);
path_2.lineTo(size.width*0.2917507,size.height*0.9972875);
path_2.lineTo(size.width*0.2917507,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.3155493,size.height*1.002712);
path_2.lineTo(size.width*0.3274507,size.height*1.002712);
path_2.lineTo(size.width*0.3274507,size.height*0.9972875);
path_2.lineTo(size.width*0.3155493,size.height*0.9972875);
path_2.lineTo(size.width*0.3155493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.3393493,size.height*1.002712);
path_2.lineTo(size.width*0.3512507,size.height*1.002712);
path_2.lineTo(size.width*0.3512507,size.height*0.9972875);
path_2.lineTo(size.width*0.3393493,size.height*0.9972875);
path_2.lineTo(size.width*0.3393493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.3631493,size.height*1.002712);
path_2.lineTo(size.width*0.3750507,size.height*1.002712);
path_2.lineTo(size.width*0.3750507,size.height*0.9972875);
path_2.lineTo(size.width*0.3631493,size.height*0.9972875);
path_2.lineTo(size.width*0.3631493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.3869493,size.height*1.002712);
path_2.lineTo(size.width*0.3988507,size.height*1.002712);
path_2.lineTo(size.width*0.3988507,size.height*0.9972875);
path_2.lineTo(size.width*0.3869493,size.height*0.9972875);
path_2.lineTo(size.width*0.3869493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.4107493,size.height*1.002712);
path_2.lineTo(size.width*0.4226507,size.height*1.002712);
path_2.lineTo(size.width*0.4226507,size.height*0.9972875);
path_2.lineTo(size.width*0.4107493,size.height*0.9972875);
path_2.lineTo(size.width*0.4107493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.4345493,size.height*1.002712);
path_2.lineTo(size.width*0.4464507,size.height*1.002712);
path_2.lineTo(size.width*0.4464507,size.height*0.9972875);
path_2.lineTo(size.width*0.4345493,size.height*0.9972875);
path_2.lineTo(size.width*0.4345493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.4583493,size.height*1.002712);
path_2.lineTo(size.width*0.4702507,size.height*1.002712);
path_2.lineTo(size.width*0.4702507,size.height*0.9972875);
path_2.lineTo(size.width*0.4583493,size.height*0.9972875);
path_2.lineTo(size.width*0.4583493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.4821493,size.height*1.002712);
path_2.lineTo(size.width*0.4940507,size.height*1.002712);
path_2.lineTo(size.width*0.4940507,size.height*0.9972875);
path_2.lineTo(size.width*0.4821493,size.height*0.9972875);
path_2.lineTo(size.width*0.4821493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.5059493,size.height*1.002712);
path_2.lineTo(size.width*0.5178507,size.height*1.002712);
path_2.lineTo(size.width*0.5178507,size.height*0.9972875);
path_2.lineTo(size.width*0.5059493,size.height*0.9972875);
path_2.lineTo(size.width*0.5059493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.5297493,size.height*1.002712);
path_2.lineTo(size.width*0.5416507,size.height*1.002712);
path_2.lineTo(size.width*0.5416507,size.height*0.9972875);
path_2.lineTo(size.width*0.5297493,size.height*0.9972875);
path_2.lineTo(size.width*0.5297493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.5535493,size.height*1.002712);
path_2.lineTo(size.width*0.5654507,size.height*1.002712);
path_2.lineTo(size.width*0.5654507,size.height*0.9972875);
path_2.lineTo(size.width*0.5535493,size.height*0.9972875);
path_2.lineTo(size.width*0.5535493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.5773493,size.height*1.002712);
path_2.lineTo(size.width*0.5892507,size.height*1.002712);
path_2.lineTo(size.width*0.5892507,size.height*0.9972875);
path_2.lineTo(size.width*0.5773493,size.height*0.9972875);
path_2.lineTo(size.width*0.5773493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.6011493,size.height*1.002712);
path_2.lineTo(size.width*0.6130507,size.height*1.002712);
path_2.lineTo(size.width*0.6130507,size.height*0.9972875);
path_2.lineTo(size.width*0.6011493,size.height*0.9972875);
path_2.lineTo(size.width*0.6011493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.6249493,size.height*1.002712);
path_2.lineTo(size.width*0.6368507,size.height*1.002712);
path_2.lineTo(size.width*0.6368507,size.height*0.9972875);
path_2.lineTo(size.width*0.6249493,size.height*0.9972875);
path_2.lineTo(size.width*0.6249493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.6487493,size.height*1.002712);
path_2.lineTo(size.width*0.6606507,size.height*1.002712);
path_2.lineTo(size.width*0.6606507,size.height*0.9972875);
path_2.lineTo(size.width*0.6487493,size.height*0.9972875);
path_2.lineTo(size.width*0.6487493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.6725493,size.height*1.002712);
path_2.lineTo(size.width*0.6844478,size.height*1.002712);
path_2.lineTo(size.width*0.6844478,size.height*0.9972875);
path_2.lineTo(size.width*0.6725493,size.height*0.9972875);
path_2.lineTo(size.width*0.6725493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.6963493,size.height*1.002712);
path_2.lineTo(size.width*0.7082478,size.height*1.002712);
path_2.lineTo(size.width*0.7082478,size.height*0.9972875);
path_2.lineTo(size.width*0.6963493,size.height*0.9972875);
path_2.lineTo(size.width*0.6963493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.7201493,size.height*1.002712);
path_2.lineTo(size.width*0.7320478,size.height*1.002712);
path_2.lineTo(size.width*0.7320478,size.height*0.9972875);
path_2.lineTo(size.width*0.7201493,size.height*0.9972875);
path_2.lineTo(size.width*0.7201493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.7439493,size.height*1.002712);
path_2.lineTo(size.width*0.7558478,size.height*1.002712);
path_2.lineTo(size.width*0.7558478,size.height*0.9972875);
path_2.lineTo(size.width*0.7439493,size.height*0.9972875);
path_2.lineTo(size.width*0.7439493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.7677493,size.height*1.002712);
path_2.lineTo(size.width*0.7796478,size.height*1.002712);
path_2.lineTo(size.width*0.7796478,size.height*0.9972875);
path_2.lineTo(size.width*0.7677493,size.height*0.9972875);
path_2.lineTo(size.width*0.7677493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.7915493,size.height*1.002712);
path_2.lineTo(size.width*0.8034478,size.height*1.002712);
path_2.lineTo(size.width*0.8034478,size.height*0.9972875);
path_2.lineTo(size.width*0.7915493,size.height*0.9972875);
path_2.lineTo(size.width*0.7915493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.8153493,size.height*1.002712);
path_2.lineTo(size.width*0.8272478,size.height*1.002712);
path_2.lineTo(size.width*0.8272478,size.height*0.9972875);
path_2.lineTo(size.width*0.8153493,size.height*0.9972875);
path_2.lineTo(size.width*0.8153493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.8391493,size.height*1.002712);
path_2.lineTo(size.width*0.8510478,size.height*1.002712);
path_2.lineTo(size.width*0.8510478,size.height*0.9972875);
path_2.lineTo(size.width*0.8391493,size.height*0.9972875);
path_2.lineTo(size.width*0.8391493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.8629493,size.height*1.002712);
path_2.lineTo(size.width*0.8748478,size.height*1.002712);
path_2.lineTo(size.width*0.8748478,size.height*0.9972875);
path_2.lineTo(size.width*0.8629493,size.height*0.9972875);
path_2.lineTo(size.width*0.8629493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.8867493,size.height*1.002712);
path_2.lineTo(size.width*0.8986478,size.height*1.002712);
path_2.lineTo(size.width*0.8986478,size.height*0.9972875);
path_2.lineTo(size.width*0.8867493,size.height*0.9972875);
path_2.lineTo(size.width*0.8867493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.9105493,size.height*1.002712);
path_2.lineTo(size.width*0.9224478,size.height*1.002712);
path_2.lineTo(size.width*0.9224478,size.height*0.9972875);
path_2.lineTo(size.width*0.9105493,size.height*0.9972875);
path_2.lineTo(size.width*0.9105493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.9343493,size.height*1.002712);
path_2.lineTo(size.width*0.9402985,size.height*1.002712);
path_2.lineTo(size.width*0.9402985,size.height*0.9972875);
path_2.lineTo(size.width*0.9343493,size.height*0.9972875);
path_2.lineTo(size.width*0.9343493,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.9402985,size.height*1.002712);
path_2.cubicTo(size.width*0.9425970,size.height*1.002712,size.width*0.9448090,size.height*1.002712,size.width*0.9469313,size.height*1.002709);
path_2.lineTo(size.width*0.9469134,size.height*0.9972839);
path_2.cubicTo(size.width*0.9448000,size.height*0.9972875,size.width*0.9426000,size.height*0.9972875,size.width*0.9402985,size.height*0.9972875);
path_2.lineTo(size.width*0.9402985,size.height*1.002712);
path_2.close();
path_2.moveTo(size.width*0.9602836,size.height*1.002608);
path_2.cubicTo(size.width*0.9653672,size.height*1.002515,size.width*0.9699015,size.height*1.002342,size.width*0.9739463,size.height*1.002002);
path_2.lineTo(size.width*0.9727194,size.height*0.9966275);
path_2.cubicTo(size.width*0.9691284,size.height*0.9969295,size.width*0.9649522,size.height*0.9970958,size.width*0.9600149,size.height*0.9971844);
path_2.lineTo(size.width*0.9602836,size.height*1.002608);
path_2.close();
path_2.moveTo(size.width*0.9880806,size.height*0.9994702);
path_2.cubicTo(size.width*0.9904299,size.height*0.9987071,size.width*0.9925313,size.height*0.9977667,size.width*0.9944239,size.height*0.9966221);
path_2.lineTo(size.width*0.9880896,size.height*0.9927848);
path_2.cubicTo(size.width*0.9868328,size.height*0.9935479,size.width*0.9854388,size.height*0.9941718,size.width*0.9838448,size.height*0.9946908);
path_2.lineTo(size.width*0.9880806,size.height*0.9994702);
path_2.close();
path_2.moveTo(size.width*0.9944239,size.height*0.9966221);
path_2.cubicTo(size.width*0.9963134,size.height*0.9954756,size.width*0.9978657,size.height*0.9942025,size.width*0.9991254,size.height*0.9927794);
path_2.lineTo(size.width*0.9912358,size.height*0.9902134);
path_2.cubicTo(size.width*0.9903791,size.height*0.9911790,size.width*0.9893493,size.height*0.9920235,size.width*0.9880896,size.height*0.9927848);
path_2.lineTo(size.width*0.9944239,size.height*0.9966221);
path_2.close();
path_2.moveTo(size.width*1.003304,size.height*0.9842170);
path_2.cubicTo(size.width*1.003866,size.height*0.9817667,size.width*1.004152,size.height*0.9790199,size.width*1.004304,size.height*0.9759403);
path_2.lineTo(size.width*0.9953522,size.height*0.9757776);
path_2.cubicTo(size.width*0.9952060,size.height*0.9787685,size.width*0.9949313,size.height*0.9812984,size.width*0.9944328,size.height*0.9834738);
path_2.lineTo(size.width*1.003304,size.height*0.9842170);
path_2.close();
path_2.moveTo(size.width*1.004472,size.height*0.9678517);
path_2.cubicTo(size.width*1.004478,size.height*0.9665660,size.width*1.004478,size.height*0.9652260,size.width*1.004478,size.height*0.9638336);
path_2.lineTo(size.width*0.9955224,size.height*0.9638336);
path_2.cubicTo(size.width*0.9955224,size.height*0.9652278,size.width*0.9955224,size.height*0.9665606,size.width*0.9955164,size.height*0.9678409);
path_2.lineTo(size.width*1.004472,size.height*0.9678517);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.9638336);
path_2.lineTo(size.width*1.004478,size.height*0.9602423);
path_2.lineTo(size.width*0.9955224,size.height*0.9602423);
path_2.lineTo(size.width*0.9955224,size.height*0.9638336);
path_2.lineTo(size.width*1.004478,size.height*0.9638336);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.9530597);
path_2.lineTo(size.width*1.004478,size.height*0.9458770);
path_2.lineTo(size.width*0.9955224,size.height*0.9458770);
path_2.lineTo(size.width*0.9955224,size.height*0.9530597);
path_2.lineTo(size.width*1.004478,size.height*0.9530597);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.9386944);
path_2.lineTo(size.width*1.004478,size.height*0.9315136);
path_2.lineTo(size.width*0.9955224,size.height*0.9315136);
path_2.lineTo(size.width*0.9955224,size.height*0.9386944);
path_2.lineTo(size.width*1.004478,size.height*0.9386944);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.9243309);
path_2.lineTo(size.width*1.004478,size.height*0.9171483);
path_2.lineTo(size.width*0.9955224,size.height*0.9171483);
path_2.lineTo(size.width*0.9955224,size.height*0.9243309);
path_2.lineTo(size.width*1.004478,size.height*0.9243309);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.9099656);
path_2.lineTo(size.width*1.004478,size.height*0.9027830);
path_2.lineTo(size.width*0.9955224,size.height*0.9027830);
path_2.lineTo(size.width*0.9955224,size.height*0.9099656);
path_2.lineTo(size.width*1.004478,size.height*0.9099656);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.8956004);
path_2.lineTo(size.width*1.004478,size.height*0.8884177);
path_2.lineTo(size.width*0.9955224,size.height*0.8884177);
path_2.lineTo(size.width*0.9955224,size.height*0.8956004);
path_2.lineTo(size.width*1.004478,size.height*0.8956004);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.8812351);
path_2.lineTo(size.width*1.004478,size.height*0.8740524);
path_2.lineTo(size.width*0.9955224,size.height*0.8740524);
path_2.lineTo(size.width*0.9955224,size.height*0.8812351);
path_2.lineTo(size.width*1.004478,size.height*0.8812351);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.8668716);
path_2.lineTo(size.width*1.004478,size.height*0.8596890);
path_2.lineTo(size.width*0.9955224,size.height*0.8596890);
path_2.lineTo(size.width*0.9955224,size.height*0.8668716);
path_2.lineTo(size.width*1.004478,size.height*0.8668716);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.8525063);
path_2.lineTo(size.width*1.004478,size.height*0.8453237);
path_2.lineTo(size.width*0.9955224,size.height*0.8453237);
path_2.lineTo(size.width*0.9955224,size.height*0.8525063);
path_2.lineTo(size.width*1.004478,size.height*0.8525063);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.8381410);
path_2.lineTo(size.width*1.004478,size.height*0.8309584);
path_2.lineTo(size.width*0.9955224,size.height*0.8309584);
path_2.lineTo(size.width*0.9955224,size.height*0.8381410);
path_2.lineTo(size.width*1.004478,size.height*0.8381410);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.8237758);
path_2.lineTo(size.width*1.004478,size.height*0.8165931);
path_2.lineTo(size.width*0.9955224,size.height*0.8165931);
path_2.lineTo(size.width*0.9955224,size.height*0.8237758);
path_2.lineTo(size.width*1.004478,size.height*0.8237758);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.8094123);
path_2.lineTo(size.width*1.004478,size.height*0.8022297);
path_2.lineTo(size.width*0.9955224,size.height*0.8022297);
path_2.lineTo(size.width*0.9955224,size.height*0.8094123);
path_2.lineTo(size.width*1.004478,size.height*0.8094123);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.7950470);
path_2.lineTo(size.width*1.004478,size.height*0.7878644);
path_2.lineTo(size.width*0.9955224,size.height*0.7878644);
path_2.lineTo(size.width*0.9955224,size.height*0.7950470);
path_2.lineTo(size.width*1.004478,size.height*0.7950470);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.7806817);
path_2.lineTo(size.width*1.004478,size.height*0.7734991);
path_2.lineTo(size.width*0.9955224,size.height*0.7734991);
path_2.lineTo(size.width*0.9955224,size.height*0.7806817);
path_2.lineTo(size.width*1.004478,size.height*0.7806817);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.7663165);
path_2.lineTo(size.width*1.004478,size.height*0.7591338);
path_2.lineTo(size.width*0.9955224,size.height*0.7591338);
path_2.lineTo(size.width*0.9955224,size.height*0.7663165);
path_2.lineTo(size.width*1.004478,size.height*0.7663165);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.7519512);
path_2.lineTo(size.width*1.004478,size.height*0.7447703);
path_2.lineTo(size.width*0.9955224,size.height*0.7447703);
path_2.lineTo(size.width*0.9955224,size.height*0.7519512);
path_2.lineTo(size.width*1.004478,size.height*0.7519512);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.7375877);
path_2.lineTo(size.width*1.004478,size.height*0.7304051);
path_2.lineTo(size.width*0.9955224,size.height*0.7304051);
path_2.lineTo(size.width*0.9955224,size.height*0.7375877);
path_2.lineTo(size.width*1.004478,size.height*0.7375877);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.7232224);
path_2.lineTo(size.width*1.004478,size.height*0.7160398);
path_2.lineTo(size.width*0.9955224,size.height*0.7160398);
path_2.lineTo(size.width*0.9955224,size.height*0.7232224);
path_2.lineTo(size.width*1.004478,size.height*0.7232224);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.7088571);
path_2.lineTo(size.width*1.004478,size.height*0.7016745);
path_2.lineTo(size.width*0.9955224,size.height*0.7016745);
path_2.lineTo(size.width*0.9955224,size.height*0.7088571);
path_2.lineTo(size.width*1.004478,size.height*0.7088571);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.6944919);
path_2.lineTo(size.width*1.004478,size.height*0.6873092);
path_2.lineTo(size.width*0.9955224,size.height*0.6873092);
path_2.lineTo(size.width*0.9955224,size.height*0.6944919);
path_2.lineTo(size.width*1.004478,size.height*0.6944919);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.6801284);
path_2.lineTo(size.width*1.004478,size.height*0.6729458);
path_2.lineTo(size.width*0.9955224,size.height*0.6729458);
path_2.lineTo(size.width*0.9955224,size.height*0.6801284);
path_2.lineTo(size.width*1.004478,size.height*0.6801284);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.6657631);
path_2.lineTo(size.width*1.004478,size.height*0.6585805);
path_2.lineTo(size.width*0.9955224,size.height*0.6585805);
path_2.lineTo(size.width*0.9955224,size.height*0.6657631);
path_2.lineTo(size.width*1.004478,size.height*0.6657631);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.6513978);
path_2.lineTo(size.width*1.004478,size.height*0.6442152);
path_2.lineTo(size.width*0.9955224,size.height*0.6442152);
path_2.lineTo(size.width*0.9955224,size.height*0.6513978);
path_2.lineTo(size.width*1.004478,size.height*0.6513978);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.6370325);
path_2.lineTo(size.width*1.004478,size.height*0.6298499);
path_2.lineTo(size.width*0.9955224,size.height*0.6298499);
path_2.lineTo(size.width*0.9955224,size.height*0.6370325);
path_2.lineTo(size.width*1.004478,size.height*0.6370325);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.6226691);
path_2.lineTo(size.width*1.004478,size.height*0.6154864);
path_2.lineTo(size.width*0.9955224,size.height*0.6154864);
path_2.lineTo(size.width*0.9955224,size.height*0.6226691);
path_2.lineTo(size.width*1.004478,size.height*0.6226691);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.6083038);
path_2.lineTo(size.width*1.004478,size.height*0.6011212);
path_2.lineTo(size.width*0.9955224,size.height*0.6011212);
path_2.lineTo(size.width*0.9955224,size.height*0.6083038);
path_2.lineTo(size.width*1.004478,size.height*0.6083038);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.5939385);
path_2.lineTo(size.width*1.004478,size.height*0.5867559);
path_2.lineTo(size.width*0.9955224,size.height*0.5867559);
path_2.lineTo(size.width*0.9955224,size.height*0.5939385);
path_2.lineTo(size.width*1.004478,size.height*0.5939385);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.5795732);
path_2.lineTo(size.width*1.004478,size.height*0.5723906);
path_2.lineTo(size.width*0.9955224,size.height*0.5723906);
path_2.lineTo(size.width*0.9955224,size.height*0.5795732);
path_2.lineTo(size.width*1.004478,size.height*0.5795732);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.5652098);
path_2.lineTo(size.width*1.004478,size.height*0.5580271);
path_2.lineTo(size.width*0.9955224,size.height*0.5580271);
path_2.lineTo(size.width*0.9955224,size.height*0.5652098);
path_2.lineTo(size.width*1.004478,size.height*0.5652098);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.5508445);
path_2.lineTo(size.width*1.004478,size.height*0.5436618);
path_2.lineTo(size.width*0.9955224,size.height*0.5436618);
path_2.lineTo(size.width*0.9955224,size.height*0.5508445);
path_2.lineTo(size.width*1.004478,size.height*0.5508445);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.5364792);
path_2.lineTo(size.width*1.004478,size.height*0.5292966);
path_2.lineTo(size.width*0.9955224,size.height*0.5292966);
path_2.lineTo(size.width*0.9955224,size.height*0.5364792);
path_2.lineTo(size.width*1.004478,size.height*0.5364792);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.5221139);
path_2.lineTo(size.width*1.004478,size.height*0.5149313);
path_2.lineTo(size.width*0.9955224,size.height*0.5149313);
path_2.lineTo(size.width*0.9955224,size.height*0.5221139);
path_2.lineTo(size.width*1.004478,size.height*0.5221139);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.5077505);
path_2.lineTo(size.width*1.004478,size.height*0.5005678);
path_2.lineTo(size.width*0.9955224,size.height*0.5005678);
path_2.lineTo(size.width*0.9955224,size.height*0.5077505);
path_2.lineTo(size.width*1.004478,size.height*0.5077505);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.4933852);
path_2.lineTo(size.width*1.004478,size.height*0.4862025);
path_2.lineTo(size.width*0.9955224,size.height*0.4862025);
path_2.lineTo(size.width*0.9955224,size.height*0.4933852);
path_2.lineTo(size.width*1.004478,size.height*0.4933852);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.4790199);
path_2.lineTo(size.width*1.004478,size.height*0.4718373);
path_2.lineTo(size.width*0.9955224,size.height*0.4718373);
path_2.lineTo(size.width*0.9955224,size.height*0.4790199);
path_2.lineTo(size.width*1.004478,size.height*0.4790199);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.4646546);
path_2.lineTo(size.width*1.004478,size.height*0.4574720);
path_2.lineTo(size.width*0.9955224,size.height*0.4574720);
path_2.lineTo(size.width*0.9955224,size.height*0.4646546);
path_2.lineTo(size.width*1.004478,size.height*0.4646546);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.4502893);
path_2.lineTo(size.width*1.004478,size.height*0.4431085);
path_2.lineTo(size.width*0.9955224,size.height*0.4431085);
path_2.lineTo(size.width*0.9955224,size.height*0.4502893);
path_2.lineTo(size.width*1.004478,size.height*0.4502893);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.4359259);
path_2.lineTo(size.width*1.004478,size.height*0.4287432);
path_2.lineTo(size.width*0.9955224,size.height*0.4287432);
path_2.lineTo(size.width*0.9955224,size.height*0.4359259);
path_2.lineTo(size.width*1.004478,size.height*0.4359259);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.4215606);
path_2.lineTo(size.width*1.004478,size.height*0.4143779);
path_2.lineTo(size.width*0.9955224,size.height*0.4143779);
path_2.lineTo(size.width*0.9955224,size.height*0.4215606);
path_2.lineTo(size.width*1.004478,size.height*0.4215606);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.4071953);
path_2.lineTo(size.width*1.004478,size.height*0.4000127);
path_2.lineTo(size.width*0.9955224,size.height*0.4000127);
path_2.lineTo(size.width*0.9955224,size.height*0.4071953);
path_2.lineTo(size.width*1.004478,size.height*0.4071953);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.3928300);
path_2.lineTo(size.width*1.004478,size.height*0.3856474);
path_2.lineTo(size.width*0.9955224,size.height*0.3856474);
path_2.lineTo(size.width*0.9955224,size.height*0.3928300);
path_2.lineTo(size.width*1.004478,size.height*0.3928300);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.3784647);
path_2.lineTo(size.width*1.004478,size.height*0.3712839);
path_2.lineTo(size.width*0.9955224,size.height*0.3712839);
path_2.lineTo(size.width*0.9955224,size.height*0.3784647);
path_2.lineTo(size.width*1.004478,size.height*0.3784647);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.3641013);
path_2.lineTo(size.width*1.004478,size.height*0.3569186);
path_2.lineTo(size.width*0.9955224,size.height*0.3569186);
path_2.lineTo(size.width*0.9955224,size.height*0.3641013);
path_2.lineTo(size.width*1.004478,size.height*0.3641013);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.3497360);
path_2.lineTo(size.width*1.004478,size.height*0.3425533);
path_2.lineTo(size.width*0.9955224,size.height*0.3425533);
path_2.lineTo(size.width*0.9955224,size.height*0.3497360);
path_2.lineTo(size.width*1.004478,size.height*0.3497360);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.3353707);
path_2.lineTo(size.width*1.004478,size.height*0.3317794);
path_2.lineTo(size.width*0.9955224,size.height*0.3317794);
path_2.lineTo(size.width*0.9955224,size.height*0.3353707);
path_2.lineTo(size.width*1.004478,size.height*0.3353707);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.3317794);
path_2.cubicTo(size.width*1.004478,size.height*0.3317758,size.width*1.004478,size.height*0.3317649,size.width*1.004478,size.height*0.3317523);
path_2.cubicTo(size.width*1.004478,size.height*0.3317432,size.width*1.004478,size.height*0.3317179,size.width*1.004475,size.height*0.3316872);
path_2.cubicTo(size.width*1.004475,size.height*0.3316618,size.width*1.004472,size.height*0.3315913,size.width*1.004460,size.height*0.3315045);
path_2.cubicTo(size.width*1.004451,size.height*0.3314394,size.width*1.004415,size.height*0.3312206,size.width*1.004284,size.height*0.3309530);
path_2.cubicTo(size.width*1.004146,size.height*0.3306835,size.width*1.003779,size.height*0.3300976,size.width*1.002785,size.height*0.3296184);
path_2.cubicTo(size.width*1.001758,size.height*0.3291212,size.width*1.000693,size.height*0.3290488,size.width*1.000287,size.height*0.3290325);
path_2.cubicTo(size.width*1.000090,size.height*0.3290253,size.width*0.9999313,size.height*0.3290271,size.width*0.9999164,size.height*0.3290271);
path_2.cubicTo(size.width*0.9998478,size.height*0.3290271,size.width*0.9999403,size.height*0.3290271,size.width*0.9999910,size.height*0.3290271);
path_2.cubicTo(size.width*1.000161,size.height*0.3290271,size.width*1.000478,size.height*0.3290325,size.width*1.000866,size.height*0.3290796);
path_2.cubicTo(size.width*1.001707,size.height*0.3291808,size.width*1.002373,size.height*0.3294141,size.width*1.002851,size.height*0.3296582);
path_2.cubicTo(size.width*1.003278,size.height*0.3298752,size.width*1.003540,size.height*0.3300940,size.width*1.003675,size.height*0.3302134);
path_2.cubicTo(size.width*1.003815,size.height*0.3303436,size.width*1.003907,size.height*0.3304521,size.width*1.003955,size.height*0.3305118);
path_2.cubicTo(size.width*1.004006,size.height*0.3305769,size.width*1.004039,size.height*0.3306239,size.width*1.004054,size.height*0.3306474);
path_2.lineTo(size.width*0.9956985,size.height*0.3326040);
path_2.cubicTo(size.width*0.9957463,size.height*0.3326763,size.width*0.9958030,size.height*0.3327631,size.width*0.9958776,size.height*0.3328571);
path_2.cubicTo(size.width*0.9959493,size.height*0.3329476,size.width*0.9960627,size.height*0.3330778,size.width*0.9962209,size.height*0.3332224);
path_2.cubicTo(size.width*0.9963731,size.height*0.3333599,size.width*0.9966478,size.height*0.3335859,size.width*0.9970896,size.height*0.3338101);
path_2.cubicTo(size.width*0.9973194,size.height*0.3339277,size.width*0.9976090,size.height*0.3340506,size.width*0.9979612,size.height*0.3341591);
path_2.cubicTo(size.width*0.9983224,size.height*0.3342694,size.width*0.9987075,size.height*0.3343508,size.width*0.9991045,size.height*0.3343978);
path_2.cubicTo(size.width*0.9994955,size.height*0.3344467,size.width*0.9998149,size.height*0.3344521,size.width*0.9999910,size.height*0.3344521);
path_2.cubicTo(size.width*1.000042,size.height*0.3344521,size.width*1.000134,size.height*0.3344503,size.width*1.000069,size.height*0.3344521);
path_2.cubicTo(size.width*1.000054,size.height*0.3344521,size.width*0.9998985,size.height*0.3344539,size.width*0.9997015,size.height*0.3344467);
path_2.cubicTo(size.width*0.9992955,size.height*0.3344304,size.width*0.9982328,size.height*0.3343580,size.width*0.9972060,size.height*0.3338608);
path_2.cubicTo(size.width*0.9962149,size.height*0.3333834,size.width*0.9958478,size.height*0.3327975,size.width*0.9957134,size.height*0.3325298);
path_2.cubicTo(size.width*0.9956418,size.height*0.3323852,size.width*0.9956030,size.height*0.3322622,size.width*0.9955791,size.height*0.3321826);
path_2.cubicTo(size.width*0.9955582,size.height*0.3320995,size.width*0.9955463,size.height*0.3320325,size.width*0.9955403,size.height*0.3319873);
path_2.cubicTo(size.width*0.9955284,size.height*0.3319042,size.width*0.9955254,size.height*0.3318391,size.width*0.9955224,size.height*0.3318192);
path_2.cubicTo(size.width*0.9955224,size.height*0.3317830,size.width*0.9955224,size.height*0.3317505,size.width*0.9955224,size.height*0.3317794);
path_2.lineTo(size.width*1.004478,size.height*0.3317794);
path_2.close();
path_2.moveTo(size.width*1.004012,size.height*0.3305588);
path_2.cubicTo(size.width*1.003997,size.height*0.3305226,size.width*1.003976,size.height*0.3304774,size.width*1.003955,size.height*0.3304250);
path_2.lineTo(size.width*0.9952836,size.height*0.3317830);
path_2.cubicTo(size.width*0.9953164,size.height*0.3318608,size.width*0.9953493,size.height*0.3319331,size.width*0.9953821,size.height*0.3320018);
path_2.lineTo(size.width*1.004012,size.height*0.3305588);
path_2.close();
path_2.moveTo(size.width*1.003955,size.height*0.3304250);
path_2.cubicTo(size.width*1.003761,size.height*0.3299747,size.width*1.003346,size.height*0.3294448,size.width*1.003054,size.height*0.3290796);
path_2.cubicTo(size.width*1.002687,size.height*0.3286166,size.width*1.002182,size.height*0.3280235,size.width*1.001558,size.height*0.3273056);
path_2.lineTo(size.width*0.9936358,size.height*0.3298336);
path_2.cubicTo(size.width*0.9942418,size.height*0.3305316,size.width*0.9946896,size.height*0.3310633,size.width*0.9949940,size.height*0.3314430);
path_2.cubicTo(size.width*0.9951463,size.height*0.3316329,size.width*0.9952478,size.height*0.3317667,size.width*0.9953075,size.height*0.3318535);
path_2.cubicTo(size.width*0.9953940,size.height*0.3319729,size.width*0.9953433,size.height*0.3319222,size.width*0.9952836,size.height*0.3317830);
path_2.lineTo(size.width*1.003955,size.height*0.3304250);
path_2.close();
path_2.moveTo(size.width*0.9970896,size.height*0.3223020);
path_2.cubicTo(size.width*0.9957851,size.height*0.3208644,size.width*0.9942866,size.height*0.3192170,size.width*0.9925851,size.height*0.3173562);
path_2.lineTo(size.width*0.9847493,size.height*0.3199819);
path_2.cubicTo(size.width*0.9864478,size.height*0.3218409,size.width*0.9879433,size.height*0.3234828,size.width*0.9892388,size.height*0.3249132);
path_2.lineTo(size.width*0.9970896,size.height*0.3223020);
path_2.close();
path_2.moveTo(size.width*0.9880746,size.height*0.3124231);
path_2.cubicTo(size.width*0.9873493,size.height*0.3116275,size.width*0.9865940,size.height*0.3108047,size.width*0.9858149,size.height*0.3099530);
path_2.lineTo(size.width*0.9779821,size.height*0.3125841);
path_2.cubicTo(size.width*0.9787642,size.height*0.3134358,size.width*0.9795164,size.height*0.3142586,size.width*0.9802418,size.height*0.3150524);
path_2.lineTo(size.width*0.9880746,size.height*0.3124231);
path_2.close();
path_2.moveTo(size.width*0.9858149,size.height*0.3099530);
path_2.cubicTo(size.width*0.9854507,size.height*0.3095552,size.width*0.9851284,size.height*0.3091429,size.width*0.9848478,size.height*0.3087161);
path_2.lineTo(size.width*0.9765284,size.height*0.3107251);
path_2.cubicTo(size.width*0.9769493,size.height*0.3113671,size.width*0.9774358,size.height*0.3119873,size.width*0.9779821,size.height*0.3125841);
path_2.lineTo(size.width*0.9858149,size.height*0.3099530);
path_2.close();
path_2.moveTo(size.width*0.9837224,size.height*0.3060723);
path_2.cubicTo(size.width*0.9836299,size.height*0.3056239,size.width*0.9835821,size.height*0.3051664,size.width*0.9835821,size.height*0.3047016);
path_2.lineTo(size.width*0.9746269,size.height*0.3047016);
path_2.cubicTo(size.width*0.9746269,size.height*0.3053942,size.width*0.9746985,size.height*0.3060778,size.width*0.9748388,size.height*0.3067486);
path_2.lineTo(size.width*0.9837224,size.height*0.3060723);
path_2.close();
path_2.moveTo(size.width*0.9835821,size.height*0.3047016);
path_2.cubicTo(size.width*0.9835821,size.height*0.3042369,size.width*0.9836299,size.height*0.3037794,size.width*0.9837224,size.height*0.3033309);
path_2.lineTo(size.width*0.9748388,size.height*0.3026546);
path_2.cubicTo(size.width*0.9746985,size.height*0.3033255,size.width*0.9746269,size.height*0.3040090,size.width*0.9746269,size.height*0.3047016);
path_2.lineTo(size.width*0.9835821,size.height*0.3047016);
path_2.close();
path_2.moveTo(size.width*0.9848478,size.height*0.3006872);
path_2.cubicTo(size.width*0.9851284,size.height*0.3002604,size.width*0.9854507,size.height*0.2998481,size.width*0.9858149,size.height*0.2994503);
path_2.lineTo(size.width*0.9779821,size.height*0.2968192);
path_2.cubicTo(size.width*0.9774358,size.height*0.2974159,size.width*0.9769493,size.height*0.2980362,size.width*0.9765284,size.height*0.2986781);
path_2.lineTo(size.width*0.9848478,size.height*0.3006872);
path_2.close();
path_2.moveTo(size.width*0.9858149,size.height*0.2994503);
path_2.cubicTo(size.width*0.9865940,size.height*0.2985986,size.width*0.9873493,size.height*0.2977758,size.width*0.9880746,size.height*0.2969801);
path_2.lineTo(size.width*0.9802418,size.height*0.2943508);
path_2.cubicTo(size.width*0.9795164,size.height*0.2951447,size.width*0.9787642,size.height*0.2959675,size.width*0.9779821,size.height*0.2968192);
path_2.lineTo(size.width*0.9858149,size.height*0.2994503);
path_2.close();
path_2.moveTo(size.width*0.9925851,size.height*0.2920470);
path_2.cubicTo(size.width*0.9942866,size.height*0.2901863,size.width*0.9957851,size.height*0.2885389,size.width*0.9970896,size.height*0.2871013);
path_2.lineTo(size.width*0.9892388,size.height*0.2844901);
path_2.cubicTo(size.width*0.9879433,size.height*0.2859204,size.width*0.9864478,size.height*0.2875624,size.width*0.9847493,size.height*0.2894213);
path_2.lineTo(size.width*0.9925851,size.height*0.2920470);
path_2.close();
path_2.moveTo(size.width*1.001558,size.height*0.2820976);
path_2.cubicTo(size.width*1.002182,size.height*0.2813797,size.width*1.002687,size.height*0.2807866,size.width*1.003054,size.height*0.2803237);
path_2.cubicTo(size.width*1.003346,size.height*0.2799584,size.width*1.003761,size.height*0.2794286,size.width*1.003955,size.height*0.2789783);
path_2.lineTo(size.width*0.9952836,size.height*0.2776203);
path_2.cubicTo(size.width*0.9953433,size.height*0.2774810,size.width*0.9953940,size.height*0.2774304,size.width*0.9953075,size.height*0.2775497);
path_2.cubicTo(size.width*0.9952478,size.height*0.2776365,size.width*0.9951463,size.height*0.2777703,size.width*0.9949940,size.height*0.2779602);
path_2.cubicTo(size.width*0.9946896,size.height*0.2783400,size.width*0.9942418,size.height*0.2788716,size.width*0.9936358,size.height*0.2795696);
path_2.lineTo(size.width*1.001558,size.height*0.2820976);
path_2.close();
path_2.moveTo(size.width*1.003955,size.height*0.2789783);
path_2.cubicTo(size.width*1.003976,size.height*0.2789259,size.width*1.003997,size.height*0.2788807,size.width*1.004012,size.height*0.2788445);
path_2.lineTo(size.width*0.9953821,size.height*0.2774014);
path_2.cubicTo(size.width*0.9953493,size.height*0.2774702,size.width*0.9953164,size.height*0.2775425,size.width*0.9952836,size.height*0.2776203);
path_2.lineTo(size.width*1.003955,size.height*0.2789783);
path_2.close();
path_2.moveTo(size.width*1.004051,size.height*0.2787559);
path_2.cubicTo(size.width*1.004039,size.height*0.2787794,size.width*1.004006,size.height*0.2788282,size.width*1.003955,size.height*0.2788915);
path_2.cubicTo(size.width*1.003907,size.height*0.2789512,size.width*1.003815,size.height*0.2790597,size.width*1.003675,size.height*0.2791899);
path_2.cubicTo(size.width*1.003540,size.height*0.2793110,size.width*1.003278,size.height*0.2795280,size.width*1.002851,size.height*0.2797450);
path_2.cubicTo(size.width*1.002373,size.height*0.2799892,size.width*1.001704,size.height*0.2802224,size.width*1.000863,size.height*0.2803237);
path_2.cubicTo(size.width*1.000475,size.height*0.2803707,size.width*1.000158,size.height*0.2803761,size.width*0.9999881,size.height*0.2803761);
path_2.cubicTo(size.width*0.9999373,size.height*0.2803761,size.width*0.9998448,size.height*0.2803761,size.width*0.9999134,size.height*0.2803761);
path_2.cubicTo(size.width*0.9999284,size.height*0.2803761,size.width*1.000087,size.height*0.2803779,size.width*1.000284,size.height*0.2803707);
path_2.cubicTo(size.width*1.000693,size.height*0.2803544,size.width*1.001755,size.height*0.2802821,size.width*1.002785,size.height*0.2797848);
path_2.cubicTo(size.width*1.003779,size.height*0.2793074,size.width*1.004146,size.height*0.2787197,size.width*1.004284,size.height*0.2784503);
path_2.cubicTo(size.width*1.004415,size.height*0.2781826,size.width*1.004451,size.height*0.2779638,size.width*1.004460,size.height*0.2778987);
path_2.cubicTo(size.width*1.004472,size.height*0.2778119,size.width*1.004475,size.height*0.2777414,size.width*1.004475,size.height*0.2777161);
path_2.cubicTo(size.width*1.004478,size.height*0.2776854,size.width*1.004478,size.height*0.2776600,size.width*1.004478,size.height*0.2776510);
path_2.cubicTo(size.width*1.004478,size.height*0.2776383,size.width*1.004478,size.height*0.2776275,size.width*1.004478,size.height*0.2776239);
path_2.lineTo(size.width*0.9955224,size.height*0.2776239);
path_2.cubicTo(size.width*0.9955224,size.height*0.2776528,size.width*0.9955224,size.height*0.2776203,size.width*0.9955224,size.height*0.2775841);
path_2.cubicTo(size.width*0.9955254,size.height*0.2775642,size.width*0.9955284,size.height*0.2774991,size.width*0.9955403,size.height*0.2774159);
path_2.cubicTo(size.width*0.9955463,size.height*0.2773707,size.width*0.9955582,size.height*0.2773038,size.width*0.9955791,size.height*0.2772206);
path_2.cubicTo(size.width*0.9956030,size.height*0.2771410,size.width*0.9956418,size.height*0.2770181,size.width*0.9957134,size.height*0.2768734);
path_2.cubicTo(size.width*0.9958478,size.height*0.2766058,size.width*0.9962149,size.height*0.2760199,size.width*0.9972060,size.height*0.2755407);
path_2.cubicTo(size.width*0.9982358,size.height*0.2750452,size.width*0.9992985,size.height*0.2749729,size.width*0.9997015,size.height*0.2749566);
path_2.cubicTo(size.width*0.9998985,size.height*0.2749494,size.width*1.000057,size.height*0.2749512,size.width*1.000069,size.height*0.2749512);
path_2.cubicTo(size.width*1.000137,size.height*0.2749530,size.width*1.000042,size.height*0.2749512,size.width*0.9999910,size.height*0.2749512);
path_2.cubicTo(size.width*0.9998179,size.height*0.2749512,size.width*0.9994985,size.height*0.2749566,size.width*0.9991045,size.height*0.2750054);
path_2.cubicTo(size.width*0.9987104,size.height*0.2750524,size.width*0.9983254,size.height*0.2751338,size.width*0.9979612,size.height*0.2752441);
path_2.cubicTo(size.width*0.9976090,size.height*0.2753508,size.width*0.9973194,size.height*0.2754756,size.width*0.9970896,size.height*0.2755931);
path_2.cubicTo(size.width*0.9966507,size.height*0.2758156,size.width*0.9963731,size.height*0.2760434,size.width*0.9962209,size.height*0.2761808);
path_2.cubicTo(size.width*0.9960627,size.height*0.2763255,size.width*0.9959493,size.height*0.2764557,size.width*0.9958806,size.height*0.2765461);
path_2.cubicTo(size.width*0.9958030,size.height*0.2766401,size.width*0.9957463,size.height*0.2767269,size.width*0.9956985,size.height*0.2767993);
path_2.lineTo(size.width*1.004051,size.height*0.2787559);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.2776239);
path_2.lineTo(size.width*1.004478,size.height*0.2741555);
path_2.lineTo(size.width*0.9955224,size.height*0.2741555);
path_2.lineTo(size.width*0.9955224,size.height*0.2776239);
path_2.lineTo(size.width*1.004478,size.height*0.2776239);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.2672188);
path_2.lineTo(size.width*1.004478,size.height*0.2602839);
path_2.lineTo(size.width*0.9955224,size.height*0.2602839);
path_2.lineTo(size.width*0.9955224,size.height*0.2672188);
path_2.lineTo(size.width*1.004478,size.height*0.2672188);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.2533490);
path_2.lineTo(size.width*1.004478,size.height*0.2464123);
path_2.lineTo(size.width*0.9955224,size.height*0.2464123);
path_2.lineTo(size.width*0.9955224,size.height*0.2533490);
path_2.lineTo(size.width*1.004478,size.height*0.2533490);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.2394774);
path_2.lineTo(size.width*1.004478,size.height*0.2325407);
path_2.lineTo(size.width*0.9955224,size.height*0.2325407);
path_2.lineTo(size.width*0.9955224,size.height*0.2394774);
path_2.lineTo(size.width*1.004478,size.height*0.2394774);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.2256058);
path_2.lineTo(size.width*1.004478,size.height*0.2186691);
path_2.lineTo(size.width*0.9955224,size.height*0.2186691);
path_2.lineTo(size.width*0.9955224,size.height*0.2256058);
path_2.lineTo(size.width*1.004478,size.height*0.2256058);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.2117342);
path_2.lineTo(size.width*1.004478,size.height*0.2047975);
path_2.lineTo(size.width*0.9955224,size.height*0.2047975);
path_2.lineTo(size.width*0.9955224,size.height*0.2117342);
path_2.lineTo(size.width*1.004478,size.height*0.2117342);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.1978626);
path_2.lineTo(size.width*1.004478,size.height*0.1909259);
path_2.lineTo(size.width*0.9955224,size.height*0.1909259);
path_2.lineTo(size.width*0.9955224,size.height*0.1978626);
path_2.lineTo(size.width*1.004478,size.height*0.1978626);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.1839910);
path_2.lineTo(size.width*1.004478,size.height*0.1770548);
path_2.lineTo(size.width*0.9955224,size.height*0.1770548);
path_2.lineTo(size.width*0.9955224,size.height*0.1839910);
path_2.lineTo(size.width*1.004478,size.height*0.1839910);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.1701190);
path_2.lineTo(size.width*1.004478,size.height*0.1631834);
path_2.lineTo(size.width*0.9955224,size.height*0.1631834);
path_2.lineTo(size.width*0.9955224,size.height*0.1701190);
path_2.lineTo(size.width*1.004478,size.height*0.1701190);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.1562476);
path_2.lineTo(size.width*1.004478,size.height*0.1493118);
path_2.lineTo(size.width*0.9955224,size.height*0.1493118);
path_2.lineTo(size.width*0.9955224,size.height*0.1562476);
path_2.lineTo(size.width*1.004478,size.height*0.1562476);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.1423761);
path_2.lineTo(size.width*1.004478,size.height*0.1354403);
path_2.lineTo(size.width*0.9955224,size.height*0.1354403);
path_2.lineTo(size.width*0.9955224,size.height*0.1423761);
path_2.lineTo(size.width*1.004478,size.height*0.1423761);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.1285045);
path_2.lineTo(size.width*1.004478,size.height*0.1215687);
path_2.lineTo(size.width*0.9955224,size.height*0.1215687);
path_2.lineTo(size.width*0.9955224,size.height*0.1285045);
path_2.lineTo(size.width*1.004478,size.height*0.1285045);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.1146331);
path_2.lineTo(size.width*1.004478,size.height*0.1111651);
path_2.lineTo(size.width*0.9955224,size.height*0.1111651);
path_2.lineTo(size.width*0.9955224,size.height*0.1146331);
path_2.lineTo(size.width*1.004478,size.height*0.1146331);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.1111651);
path_2.cubicTo(size.width*1.004478,size.height*0.1111609,size.width*1.004478,size.height*0.1111494,size.width*1.004478,size.height*0.1111382);
path_2.cubicTo(size.width*1.004478,size.height*0.1111282,size.width*1.004478,size.height*0.1111027,size.width*1.004475,size.height*0.1110720);
path_2.cubicTo(size.width*1.004475,size.height*0.1110468,size.width*1.004472,size.height*0.1109772,size.width*1.004460,size.height*0.1108893);
path_2.cubicTo(size.width*1.004451,size.height*0.1108246,size.width*1.004415,size.height*0.1106056,size.width*1.004284,size.height*0.1103383);
path_2.cubicTo(size.width*1.004146,size.height*0.1100687,size.width*1.003779,size.height*0.1094819,size.width*1.002785,size.height*0.1090031);
path_2.cubicTo(size.width*1.001755,size.height*0.1085065,size.width*1.000693,size.height*0.1084338,size.width*1.000287,size.height*0.1084177);
path_2.cubicTo(size.width*1.000087,size.height*0.1084098,size.width*0.9999284,size.height*0.1084121,size.width*0.9999134,size.height*0.1084123);
path_2.cubicTo(size.width*0.9998478,size.height*0.1084130,size.width*0.9999403,size.height*0.1084119,size.width*0.9999881,size.height*0.1084119);
path_2.cubicTo(size.width*1.000158,size.height*0.1084119,size.width*1.000475,size.height*0.1084174,size.width*1.000863,size.height*0.1084644);
path_2.cubicTo(size.width*1.001707,size.height*0.1085667,size.width*1.002373,size.height*0.1087993,size.width*1.002851,size.height*0.1090430);
path_2.cubicTo(size.width*1.003278,size.height*0.1092604,size.width*1.003540,size.height*0.1094783,size.width*1.003675,size.height*0.1095991);
path_2.cubicTo(size.width*1.003815,size.height*0.1097284,size.width*1.003907,size.height*0.1098367,size.width*1.003955,size.height*0.1098967);
path_2.cubicTo(size.width*1.004006,size.height*0.1099611,size.width*1.004039,size.height*0.1100098,size.width*1.004054,size.height*0.1100331);
path_2.lineTo(size.width*0.9956985,size.height*0.1119886);
path_2.cubicTo(size.width*0.9957463,size.height*0.1120608,size.width*0.9958030,size.height*0.1121476,size.width*0.9958776,size.height*0.1122420);
path_2.cubicTo(size.width*0.9959493,size.height*0.1123320,size.width*0.9960627,size.height*0.1124624,size.width*0.9962209,size.height*0.1126076);
path_2.cubicTo(size.width*0.9963731,size.height*0.1127443,size.width*0.9966507,size.height*0.1129720,size.width*0.9970896,size.height*0.1131957);
path_2.cubicTo(size.width*0.9973194,size.height*0.1133130,size.width*0.9976090,size.height*0.1134367,size.width*0.9979612,size.height*0.1135447);
path_2.cubicTo(size.width*0.9983254,size.height*0.1136553,size.width*0.9987075,size.height*0.1137356,size.width*0.9991045,size.height*0.1137837);
path_2.cubicTo(size.width*0.9994955,size.height*0.1138313,size.width*0.9998179,size.height*0.1138369,size.width*0.9999910,size.height*0.1138369);
path_2.cubicTo(size.width*1.000042,size.height*0.1138369,size.width*1.000134,size.height*0.1138358,size.width*1.000069,size.height*0.1138363);
path_2.cubicTo(size.width*1.000054,size.height*0.1138365,size.width*0.9998985,size.height*0.1138389,size.width*0.9997015,size.height*0.1138311);
path_2.cubicTo(size.width*0.9992955,size.height*0.1138150,size.width*0.9982358,size.height*0.1137425,size.width*0.9972060,size.height*0.1132467);
path_2.cubicTo(size.width*0.9962149,size.height*0.1127685,size.width*0.9958478,size.height*0.1121830,size.width*0.9957134,size.height*0.1119154);
path_2.cubicTo(size.width*0.9956418,size.height*0.1117696,size.width*0.9956030,size.height*0.1116470,size.width*0.9955791,size.height*0.1115673);
path_2.cubicTo(size.width*0.9955582,size.height*0.1114852,size.width*0.9955463,size.height*0.1114172,size.width*0.9955403,size.height*0.1113727);
path_2.cubicTo(size.width*0.9955284,size.height*0.1112886,size.width*0.9955254,size.height*0.1112235,size.width*0.9955224,size.height*0.1112045);
path_2.cubicTo(size.width*0.9955224,size.height*0.1111689,size.width*0.9955224,size.height*0.1111360,size.width*0.9955224,size.height*0.1111651);
path_2.lineTo(size.width*1.004478,size.height*0.1111651);
path_2.close();
path_2.moveTo(size.width*1.004012,size.height*0.1099438);
path_2.cubicTo(size.width*1.003997,size.height*0.1099069,size.width*1.003976,size.height*0.1098626,size.width*1.003955,size.height*0.1098098);
path_2.lineTo(size.width*0.9952836,size.height*0.1111684);
path_2.cubicTo(size.width*0.9953164,size.height*0.1112459,size.width*0.9953493,size.height*0.1113184,size.width*0.9953821,size.height*0.1113866);
path_2.lineTo(size.width*1.004012,size.height*0.1099438);
path_2.close();
path_2.moveTo(size.width*1.003955,size.height*0.1098098);
path_2.cubicTo(size.width*1.003761,size.height*0.1093593,size.width*1.003346,size.height*0.1088309,size.width*1.003054,size.height*0.1084646);
path_2.cubicTo(size.width*1.002687,size.height*0.1080022,size.width*1.002182,size.height*0.1074080,size.width*1.001558,size.height*0.1066908);
path_2.lineTo(size.width*0.9936358,size.height*0.1092195);
path_2.cubicTo(size.width*0.9942418,size.height*0.1099172,size.width*0.9946896,size.height*0.1104481,size.width*0.9949940,size.height*0.1108278);
path_2.cubicTo(size.width*0.9951463,size.height*0.1110186,size.width*0.9952478,size.height*0.1111523,size.width*0.9953075,size.height*0.1112391);
path_2.cubicTo(size.width*0.9953940,size.height*0.1113582,size.width*0.9953433,size.height*0.1113067,size.width*0.9952836,size.height*0.1111684);
path_2.lineTo(size.width*1.003955,size.height*0.1098098);
path_2.close();
path_2.moveTo(size.width*0.9970896,size.height*0.1016879);
path_2.cubicTo(size.width*0.9957851,size.height*0.1002495,size.width*0.9942866,size.height*0.09860217,size.width*0.9925851,size.height*0.09674087);
path_2.lineTo(size.width*0.9847493,size.height*0.09936691);
path_2.cubicTo(size.width*0.9864478,size.height*0.1012259,size.width*0.9879433,size.height*0.1028673,size.width*0.9892388,size.height*0.1042978);
path_2.lineTo(size.width*0.9970896,size.height*0.1016879);
path_2.close();
path_2.moveTo(size.width*0.9880746,size.height*0.09180741);
path_2.cubicTo(size.width*0.9873493,size.height*0.09101302,size.width*0.9865940,size.height*0.09019005,size.width*0.9858149,size.height*0.08933870);
path_2.lineTo(size.width*0.9779821,size.height*0.09196926);
path_2.cubicTo(size.width*0.9787642,size.height*0.09282080,size.width*0.9795164,size.height*0.09364358,size.width*0.9802418,size.height*0.09443779);
path_2.lineTo(size.width*0.9880746,size.height*0.09180741);
path_2.close();
path_2.moveTo(size.width*0.9858149,size.height*0.08933870);
path_2.cubicTo(size.width*0.9854507,size.height*0.08894087,size.width*0.9851284,size.height*0.08852803,size.width*0.9848478,size.height*0.08810217);
path_2.lineTo(size.width*0.9765284,size.height*0.09011103);
path_2.cubicTo(size.width*0.9769493,size.height*0.09075172,size.width*0.9774358,size.height*0.09137215,size.width*0.9779821,size.height*0.09196926);
path_2.lineTo(size.width*0.9858149,size.height*0.08933870);
path_2.close();
path_2.moveTo(size.width*0.9837224,size.height*0.08545769);
path_2.cubicTo(size.width*0.9836299,size.height*0.08500976,size.width*0.9835821,size.height*0.08455244,size.width*0.9835821,size.height*0.08408680);
path_2.lineTo(size.width*0.9746269,size.height*0.08408680);
path_2.cubicTo(size.width*0.9746269,size.height*0.08477920,size.width*0.9746985,size.height*0.08546275,size.width*0.9748388,size.height*0.08613472);
path_2.lineTo(size.width*0.9837224,size.height*0.08545769);
path_2.close();
path_2.moveTo(size.width*0.9835821,size.height*0.08408680);
path_2.cubicTo(size.width*0.9835821,size.height*0.08362116,size.width*0.9836299,size.height*0.08316383,size.width*0.9837224,size.height*0.08271591);
path_2.lineTo(size.width*0.9748388,size.height*0.08203888);
path_2.cubicTo(size.width*0.9746985,size.height*0.08271085,size.width*0.9746269,size.height*0.08339439,size.width*0.9746269,size.height*0.08408680);
path_2.lineTo(size.width*0.9835821,size.height*0.08408680);
path_2.close();
path_2.moveTo(size.width*0.9848478,size.height*0.08007143);
path_2.cubicTo(size.width*0.9851284,size.height*0.07964557,size.width*0.9854507,size.height*0.07923273,size.width*0.9858149,size.height*0.07883490);
path_2.lineTo(size.width*0.9779821,size.height*0.07620434);
path_2.cubicTo(size.width*0.9774358,size.height*0.07680145,size.width*0.9769493,size.height*0.07742188,size.width*0.9765284,size.height*0.07806257);
path_2.lineTo(size.width*0.9848478,size.height*0.08007143);
path_2.close();
path_2.moveTo(size.width*0.9858149,size.height*0.07883490);
path_2.cubicTo(size.width*0.9865940,size.height*0.07798354,size.width*0.9873493,size.height*0.07716058,size.width*0.9880746,size.height*0.07636618);
path_2.lineTo(size.width*0.9802418,size.height*0.07373580);
path_2.cubicTo(size.width*0.9795164,size.height*0.07453002,size.width*0.9787642,size.height*0.07535280,size.width*0.9779821,size.height*0.07620434);
path_2.lineTo(size.width*0.9858149,size.height*0.07883490);
path_2.close();
path_2.moveTo(size.width*0.9925851,size.height*0.07143273);
path_2.cubicTo(size.width*0.9942866,size.height*0.06957143,size.width*0.9957851,size.height*0.06792405,size.width*0.9970896,size.height*0.06648571);
path_2.lineTo(size.width*0.9892388,size.height*0.06387577);
path_2.cubicTo(size.width*0.9879433,size.height*0.06530633,size.width*0.9864478,size.height*0.06694774,size.width*0.9847493,size.height*0.06880669);
path_2.lineTo(size.width*0.9925851,size.height*0.07143273);
path_2.close();
path_2.moveTo(size.width*1.001558,size.height*0.06148282);
path_2.cubicTo(size.width*1.002182,size.height*0.06076564,size.width*1.002687,size.height*0.06017143,size.width*1.003054,size.height*0.05970904);
path_2.cubicTo(size.width*1.003346,size.height*0.05934268,size.width*1.003761,size.height*0.05881429,size.width*1.003955,size.height*0.05836383);
path_2.lineTo(size.width*0.9952836,size.height*0.05700524);
path_2.cubicTo(size.width*0.9953433,size.height*0.05686691,size.width*0.9953940,size.height*0.05681537,size.width*0.9953075,size.height*0.05693454);
path_2.cubicTo(size.width*0.9952478,size.height*0.05702134,size.width*0.9951463,size.height*0.05715497,size.width*0.9949940,size.height*0.05734575);
path_2.cubicTo(size.width*0.9946896,size.height*0.05772550,size.width*0.9942418,size.height*0.05825642,size.width*0.9936358,size.height*0.05895407);
path_2.lineTo(size.width*1.001558,size.height*0.06148282);
path_2.close();
path_2.moveTo(size.width*1.003955,size.height*0.05836383);
path_2.cubicTo(size.width*1.003976,size.height*0.05831103,size.width*1.003997,size.height*0.05826673,size.width*1.004012,size.height*0.05822984);
path_2.lineTo(size.width*0.9953821,size.height*0.05678698);
path_2.cubicTo(size.width*0.9953493,size.height*0.05685515,size.width*0.9953164,size.height*0.05692767,size.width*0.9952836,size.height*0.05700524);
path_2.lineTo(size.width*1.003955,size.height*0.05836383);
path_2.close();
path_2.moveTo(size.width*1.004051,size.height*0.05814051);
path_2.cubicTo(size.width*1.004039,size.height*0.05816383,size.width*1.004006,size.height*0.05821248,size.width*1.003955,size.height*0.05827685);
path_2.cubicTo(size.width*1.003907,size.height*0.05833689,size.width*1.003815,size.height*0.05844539,size.width*1.003675,size.height*0.05857468);
path_2.cubicTo(size.width*1.003540,size.height*0.05869548,size.width*1.003278,size.height*0.05891338,size.width*1.002851,size.height*0.05913092);
path_2.cubicTo(size.width*1.002373,size.height*0.05937450,size.width*1.001704,size.height*0.05960723,size.width*1.000863,size.height*0.05970922);
path_2.cubicTo(size.width*1.000475,size.height*0.05975642,size.width*1.000158,size.height*0.05976184,size.width*0.9999881,size.height*0.05976166);
path_2.cubicTo(size.width*0.9999373,size.height*0.05976166,size.width*0.9998448,size.height*0.05976058,size.width*0.9999134,size.height*0.05976130);
path_2.cubicTo(size.width*0.9999284,size.height*0.05976148,size.width*1.000087,size.height*0.05976383,size.width*1.000284,size.height*0.05975606);
path_2.cubicTo(size.width*1.000690,size.height*0.05973996,size.width*1.001755,size.height*0.05966745,size.width*1.002785,size.height*0.05917071);
path_2.cubicTo(size.width*1.003779,size.height*0.05869186,size.width*1.004146,size.height*0.05810488,size.width*1.004284,size.height*0.05783544);
path_2.cubicTo(size.width*1.004415,size.height*0.05756799,size.width*1.004451,size.height*0.05734901,size.width*1.004460,size.height*0.05728427);
path_2.cubicTo(size.width*1.004472,size.height*0.05719656,size.width*1.004475,size.height*0.05712676,size.width*1.004475,size.height*0.05710163);
path_2.cubicTo(size.width*1.004478,size.height*0.05707089,size.width*1.004478,size.height*0.05704539,size.width*1.004478,size.height*0.05703544);
path_2.cubicTo(size.width*1.004478,size.height*0.05702423,size.width*1.004478,size.height*0.05701284,size.width*1.004478,size.height*0.05700850);
path_2.lineTo(size.width*0.9955224,size.height*0.05700850);
path_2.cubicTo(size.width*0.9955224,size.height*0.05703761,size.width*0.9955224,size.height*0.05700470,size.width*0.9955224,size.height*0.05696908);
path_2.cubicTo(size.width*0.9955254,size.height*0.05695009,size.width*0.9955284,size.height*0.05688499,size.width*0.9955403,size.height*0.05680090);
path_2.cubicTo(size.width*0.9955463,size.height*0.05675642,size.width*0.9955582,size.height*0.05668843,size.width*0.9955791,size.height*0.05660633);
path_2.cubicTo(size.width*0.9956030,size.height*0.05652658,size.width*0.9956418,size.height*0.05640398,size.width*0.9957134,size.height*0.05625823);
path_2.cubicTo(size.width*0.9958478,size.height*0.05599060,size.width*0.9962149,size.height*0.05540488,size.width*0.9972060,size.height*0.05492676);
path_2.cubicTo(size.width*0.9982358,size.height*0.05443074,size.width*0.9992985,size.height*0.05435841,size.width*0.9997015,size.height*0.05434250);
path_2.cubicTo(size.width*0.9998985,size.height*0.05433472,size.width*1.000057,size.height*0.05433707,size.width*1.000069,size.height*0.05433725);
path_2.cubicTo(size.width*1.000137,size.height*0.05433797,size.width*1.000042,size.height*0.05433671,size.width*0.9999910,size.height*0.05433671);
path_2.cubicTo(size.width*0.9998179,size.height*0.05433671,size.width*0.9994985,size.height*0.05434231,size.width*0.9991045,size.height*0.05438969);
path_2.cubicTo(size.width*0.9987104,size.height*0.05443779,size.width*0.9983254,size.height*0.05451808,size.width*0.9979612,size.height*0.05462875);
path_2.cubicTo(size.width*0.9976090,size.height*0.05473653,size.width*0.9973194,size.height*0.05486040,size.width*0.9970896,size.height*0.05497776);
path_2.cubicTo(size.width*0.9966507,size.height*0.05520145,size.width*0.9963731,size.height*0.05542929,size.width*0.9962209,size.height*0.05556600);
path_2.cubicTo(size.width*0.9960627,size.height*0.05571121,size.width*0.9959493,size.height*0.05584141,size.width*0.9958806,size.height*0.05593165);
path_2.cubicTo(size.width*0.9958030,size.height*0.05602604,size.width*0.9957463,size.height*0.05611284,size.width*0.9956985,size.height*0.05618499);
path_2.lineTo(size.width*1.004051,size.height*0.05814051);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.05700850);
path_2.lineTo(size.width*1.004478,size.height*0.05179783);
path_2.lineTo(size.width*0.9955224,size.height*0.05179783);
path_2.lineTo(size.width*0.9955224,size.height*0.05700850);
path_2.lineTo(size.width*1.004478,size.height*0.05700850);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.04137685);
path_2.lineTo(size.width*1.004478,size.height*0.03616637);
path_2.lineTo(size.width*0.9955224,size.height*0.03616637);
path_2.lineTo(size.width*0.9955224,size.height*0.04137685);
path_2.lineTo(size.width*1.004478,size.height*0.04137685);
path_2.close();
path_2.moveTo(size.width*1.004478,size.height*0.03616637);
path_2.cubicTo(size.width*1.004478,size.height*0.03477342,size.width*1.004478,size.height*0.03343382,size.width*1.004472,size.height*0.03214756);
path_2.lineTo(size.width*0.9955164,size.height*0.03215986);
path_2.cubicTo(size.width*0.9955224,size.height*0.03343870,size.width*0.9955224,size.height*0.03477215,size.width*0.9955224,size.height*0.03616637);
path_2.lineTo(size.width*1.004478,size.height*0.03616637);
path_2.close();
path_2.moveTo(size.width*1.004304,size.height*0.02406022);
path_2.cubicTo(size.width*1.004152,size.height*0.02098047,size.width*1.003866,size.height*0.01823255,size.width*1.003304,size.height*0.01578264);
path_2.lineTo(size.width*0.9944328,size.height*0.01652693);
path_2.cubicTo(size.width*0.9949313,size.height*0.01870127,size.width*0.9952060,size.height*0.02123128,size.width*0.9953522,size.height*0.02422260);
path_2.lineTo(size.width*1.004304,size.height*0.02406022);
path_2.close();
path_2.moveTo(size.width*0.9991254,size.height*0.007220325);
path_2.cubicTo(size.width*0.9978657,size.height*0.005797468,size.width*0.9963134,size.height*0.004523852,size.width*0.9944239,size.height*0.003378427);
path_2.lineTo(size.width*0.9880896,size.height*0.007214448);
path_2.cubicTo(size.width*0.9893493,size.height*0.007976962,size.width*0.9903791,size.height*0.008820705,size.width*0.9912358,size.height*0.009786564);
path_2.lineTo(size.width*0.9991254,size.height*0.007220325);
path_2.close();
path_2.moveTo(size.width*0.9944239,size.height*0.003378427);
path_2.cubicTo(size.width*0.9925313,size.height*0.002233020,size.width*0.9904299,size.height*0.001293222,size.width*0.9880806,size.height*0.0005292731);
path_2.lineTo(size.width*0.9838448,size.height*0.005308861);
path_2.cubicTo(size.width*0.9854388,size.height*0.005827450,size.width*0.9868328,size.height*0.006451935,size.width*0.9880896,size.height*0.007214448);
path_2.lineTo(size.width*0.9944239,size.height*0.003378427);
path_2.close();
path_2.moveTo(size.width*0.9739463,size.height*-0.002001646);
path_2.cubicTo(size.width*0.9699015,size.height*-0.002340995,size.width*0.9653672,size.height*-0.002515588,size.width*0.9602836,size.height*-0.002607758);
path_2.lineTo(size.width*0.9600149,size.height*0.002814774);
path_2.cubicTo(size.width*0.9649522,size.height*0.002904286,size.width*0.9691284,size.height*0.003070832,size.width*0.9727194,size.height*0.003372007);
path_2.lineTo(size.width*0.9739463,size.height*-0.002001646);
path_2.close();
path_2.moveTo(size.width*0.9469313,size.height*-0.002709584);
path_2.cubicTo(size.width*0.9448090,size.height*-0.002712477,size.width*0.9425970,size.height*-0.002712477,size.width*0.9402985,size.height*-0.002712477);
path_2.lineTo(size.width*0.9402985,size.height*0.002712477);
path_2.cubicTo(size.width*0.9426000,size.height*0.002712477,size.width*0.9448000,size.height*0.002712477,size.width*0.9469134,size.height*0.002715371);
path_2.lineTo(size.width*0.9469313,size.height*-0.002709584);
path_2.close();
path_2.moveTo(size.width*0.9402985,size.height*-0.002712477);
path_2.lineTo(size.width*0.9343493,size.height*-0.002712477);
path_2.lineTo(size.width*0.9343493,size.height*0.002712477);
path_2.lineTo(size.width*0.9402985,size.height*0.002712477);
path_2.lineTo(size.width*0.9402985,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.9224478,size.height*-0.002712477);
path_2.lineTo(size.width*0.9105493,size.height*-0.002712477);
path_2.lineTo(size.width*0.9105493,size.height*0.002712477);
path_2.lineTo(size.width*0.9224478,size.height*0.002712477);
path_2.lineTo(size.width*0.9224478,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.8986478,size.height*-0.002712477);
path_2.lineTo(size.width*0.8867493,size.height*-0.002712477);
path_2.lineTo(size.width*0.8867493,size.height*0.002712477);
path_2.lineTo(size.width*0.8986478,size.height*0.002712477);
path_2.lineTo(size.width*0.8986478,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.8748478,size.height*-0.002712477);
path_2.lineTo(size.width*0.8629493,size.height*-0.002712477);
path_2.lineTo(size.width*0.8629493,size.height*0.002712477);
path_2.lineTo(size.width*0.8748478,size.height*0.002712477);
path_2.lineTo(size.width*0.8748478,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.8510478,size.height*-0.002712477);
path_2.lineTo(size.width*0.8391493,size.height*-0.002712477);
path_2.lineTo(size.width*0.8391493,size.height*0.002712477);
path_2.lineTo(size.width*0.8510478,size.height*0.002712477);
path_2.lineTo(size.width*0.8510478,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.8272478,size.height*-0.002712477);
path_2.lineTo(size.width*0.8153493,size.height*-0.002712477);
path_2.lineTo(size.width*0.8153493,size.height*0.002712477);
path_2.lineTo(size.width*0.8272478,size.height*0.002712477);
path_2.lineTo(size.width*0.8272478,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.8034478,size.height*-0.002712477);
path_2.lineTo(size.width*0.7915493,size.height*-0.002712477);
path_2.lineTo(size.width*0.7915493,size.height*0.002712477);
path_2.lineTo(size.width*0.8034478,size.height*0.002712477);
path_2.lineTo(size.width*0.8034478,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.7796478,size.height*-0.002712477);
path_2.lineTo(size.width*0.7677493,size.height*-0.002712477);
path_2.lineTo(size.width*0.7677493,size.height*0.002712477);
path_2.lineTo(size.width*0.7796478,size.height*0.002712477);
path_2.lineTo(size.width*0.7796478,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.7558478,size.height*-0.002712477);
path_2.lineTo(size.width*0.7439493,size.height*-0.002712477);
path_2.lineTo(size.width*0.7439493,size.height*0.002712477);
path_2.lineTo(size.width*0.7558478,size.height*0.002712477);
path_2.lineTo(size.width*0.7558478,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.7320478,size.height*-0.002712477);
path_2.lineTo(size.width*0.7201493,size.height*-0.002712477);
path_2.lineTo(size.width*0.7201493,size.height*0.002712477);
path_2.lineTo(size.width*0.7320478,size.height*0.002712477);
path_2.lineTo(size.width*0.7320478,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.7082478,size.height*-0.002712477);
path_2.lineTo(size.width*0.6963493,size.height*-0.002712477);
path_2.lineTo(size.width*0.6963493,size.height*0.002712477);
path_2.lineTo(size.width*0.7082478,size.height*0.002712477);
path_2.lineTo(size.width*0.7082478,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.6844507,size.height*-0.002712477);
path_2.lineTo(size.width*0.6725493,size.height*-0.002712477);
path_2.lineTo(size.width*0.6725493,size.height*0.002712477);
path_2.lineTo(size.width*0.6844507,size.height*0.002712477);
path_2.lineTo(size.width*0.6844507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.6606507,size.height*-0.002712477);
path_2.lineTo(size.width*0.6487493,size.height*-0.002712477);
path_2.lineTo(size.width*0.6487493,size.height*0.002712477);
path_2.lineTo(size.width*0.6606507,size.height*0.002712477);
path_2.lineTo(size.width*0.6606507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.6368507,size.height*-0.002712477);
path_2.lineTo(size.width*0.6249493,size.height*-0.002712477);
path_2.lineTo(size.width*0.6249493,size.height*0.002712477);
path_2.lineTo(size.width*0.6368507,size.height*0.002712477);
path_2.lineTo(size.width*0.6368507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.6130507,size.height*-0.002712477);
path_2.lineTo(size.width*0.6011493,size.height*-0.002712477);
path_2.lineTo(size.width*0.6011493,size.height*0.002712477);
path_2.lineTo(size.width*0.6130507,size.height*0.002712477);
path_2.lineTo(size.width*0.6130507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.5892507,size.height*-0.002712477);
path_2.lineTo(size.width*0.5773493,size.height*-0.002712477);
path_2.lineTo(size.width*0.5773493,size.height*0.002712477);
path_2.lineTo(size.width*0.5892507,size.height*0.002712477);
path_2.lineTo(size.width*0.5892507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.5654507,size.height*-0.002712477);
path_2.lineTo(size.width*0.5535493,size.height*-0.002712477);
path_2.lineTo(size.width*0.5535493,size.height*0.002712477);
path_2.lineTo(size.width*0.5654507,size.height*0.002712477);
path_2.lineTo(size.width*0.5654507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.5416507,size.height*-0.002712477);
path_2.lineTo(size.width*0.5297493,size.height*-0.002712477);
path_2.lineTo(size.width*0.5297493,size.height*0.002712477);
path_2.lineTo(size.width*0.5416507,size.height*0.002712477);
path_2.lineTo(size.width*0.5416507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.5178507,size.height*-0.002712477);
path_2.lineTo(size.width*0.5059493,size.height*-0.002712477);
path_2.lineTo(size.width*0.5059493,size.height*0.002712477);
path_2.lineTo(size.width*0.5178507,size.height*0.002712477);
path_2.lineTo(size.width*0.5178507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.4940507,size.height*-0.002712477);
path_2.lineTo(size.width*0.4821493,size.height*-0.002712477);
path_2.lineTo(size.width*0.4821493,size.height*0.002712477);
path_2.lineTo(size.width*0.4940507,size.height*0.002712477);
path_2.lineTo(size.width*0.4940507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.4702507,size.height*-0.002712477);
path_2.lineTo(size.width*0.4583493,size.height*-0.002712477);
path_2.lineTo(size.width*0.4583493,size.height*0.002712477);
path_2.lineTo(size.width*0.4702507,size.height*0.002712477);
path_2.lineTo(size.width*0.4702507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.4464507,size.height*-0.002712477);
path_2.lineTo(size.width*0.4345493,size.height*-0.002712477);
path_2.lineTo(size.width*0.4345493,size.height*0.002712477);
path_2.lineTo(size.width*0.4464507,size.height*0.002712477);
path_2.lineTo(size.width*0.4464507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.4226507,size.height*-0.002712477);
path_2.lineTo(size.width*0.4107493,size.height*-0.002712477);
path_2.lineTo(size.width*0.4107493,size.height*0.002712477);
path_2.lineTo(size.width*0.4226507,size.height*0.002712477);
path_2.lineTo(size.width*0.4226507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.3988507,size.height*-0.002712477);
path_2.lineTo(size.width*0.3869493,size.height*-0.002712477);
path_2.lineTo(size.width*0.3869493,size.height*0.002712477);
path_2.lineTo(size.width*0.3988507,size.height*0.002712477);
path_2.lineTo(size.width*0.3988507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.3750507,size.height*-0.002712477);
path_2.lineTo(size.width*0.3631493,size.height*-0.002712477);
path_2.lineTo(size.width*0.3631493,size.height*0.002712477);
path_2.lineTo(size.width*0.3750507,size.height*0.002712477);
path_2.lineTo(size.width*0.3750507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.3512507,size.height*-0.002712477);
path_2.lineTo(size.width*0.3393493,size.height*-0.002712477);
path_2.lineTo(size.width*0.3393493,size.height*0.002712477);
path_2.lineTo(size.width*0.3512507,size.height*0.002712477);
path_2.lineTo(size.width*0.3512507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.3274507,size.height*-0.002712477);
path_2.lineTo(size.width*0.3155522,size.height*-0.002712477);
path_2.lineTo(size.width*0.3155522,size.height*0.002712477);
path_2.lineTo(size.width*0.3274507,size.height*0.002712477);
path_2.lineTo(size.width*0.3274507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.3036507,size.height*-0.002712477);
path_2.lineTo(size.width*0.2917510,size.height*-0.002712477);
path_2.lineTo(size.width*0.2917510,size.height*0.002712477);
path_2.lineTo(size.width*0.3036507,size.height*0.002712477);
path_2.lineTo(size.width*0.3036507,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.2798510,size.height*-0.002712477);
path_2.lineTo(size.width*0.2679510,size.height*-0.002712477);
path_2.lineTo(size.width*0.2679510,size.height*0.002712477);
path_2.lineTo(size.width*0.2798510,size.height*0.002712477);
path_2.lineTo(size.width*0.2798510,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.2560510,size.height*-0.002712477);
path_2.lineTo(size.width*0.2441513,size.height*-0.002712477);
path_2.lineTo(size.width*0.2441513,size.height*0.002712477);
path_2.lineTo(size.width*0.2560510,size.height*0.002712477);
path_2.lineTo(size.width*0.2560510,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.2322513,size.height*-0.002712477);
path_2.lineTo(size.width*0.2203513,size.height*-0.002712477);
path_2.lineTo(size.width*0.2203513,size.height*0.002712477);
path_2.lineTo(size.width*0.2322513,size.height*0.002712477);
path_2.lineTo(size.width*0.2322513,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.2084513,size.height*-0.002712477);
path_2.lineTo(size.width*0.1965513,size.height*-0.002712477);
path_2.lineTo(size.width*0.1965513,size.height*0.002712477);
path_2.lineTo(size.width*0.2084513,size.height*0.002712477);
path_2.lineTo(size.width*0.2084513,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.1846516,size.height*-0.002712477);
path_2.lineTo(size.width*0.1727516,size.height*-0.002712477);
path_2.lineTo(size.width*0.1727516,size.height*0.002712477);
path_2.lineTo(size.width*0.1846516,size.height*0.002712477);
path_2.lineTo(size.width*0.1846516,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.1608516,size.height*-0.002712477);
path_2.lineTo(size.width*0.1489516,size.height*-0.002712477);
path_2.lineTo(size.width*0.1489516,size.height*0.002712477);
path_2.lineTo(size.width*0.1608516,size.height*0.002712477);
path_2.lineTo(size.width*0.1608516,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.1370516,size.height*-0.002712477);
path_2.lineTo(size.width*0.1251516,size.height*-0.002712477);
path_2.lineTo(size.width*0.1251516,size.height*0.002712477);
path_2.lineTo(size.width*0.1370516,size.height*0.002712477);
path_2.lineTo(size.width*0.1370516,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.1132519,size.height*-0.002712477);
path_2.lineTo(size.width*0.1013519,size.height*-0.002712477);
path_2.lineTo(size.width*0.1013519,size.height*0.002712477);
path_2.lineTo(size.width*0.1132519,size.height*0.002712477);
path_2.lineTo(size.width*0.1132519,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.08945194,size.height*-0.002712477);
path_2.lineTo(size.width*0.07755194,size.height*-0.002712477);
path_2.lineTo(size.width*0.07755194,size.height*0.002712477);
path_2.lineTo(size.width*0.08945194,size.height*0.002712477);
path_2.lineTo(size.width*0.08945194,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.06565194,size.height*-0.002712477);
path_2.lineTo(size.width*0.05970149,size.height*-0.002712477);
path_2.lineTo(size.width*0.05970149,size.height*0.002712477);
path_2.lineTo(size.width*0.06565194,size.height*0.002712477);
path_2.lineTo(size.width*0.06565194,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.05970149,size.height*-0.002712477);
path_2.cubicTo(size.width*0.05740209,size.height*-0.002712477,size.width*0.05519075,size.height*-0.002712477,size.width*0.05306746,size.height*-0.002709584);
path_2.lineTo(size.width*0.05308776,size.height*0.002715371);
path_2.cubicTo(size.width*0.05519881,size.height*0.002712477,size.width*0.05740000,size.height*0.002712477,size.width*0.05970149,size.height*0.002712477);
path_2.lineTo(size.width*0.05970149,size.height*-0.002712477);
path_2.close();
path_2.moveTo(size.width*0.03971731,size.height*-0.002607758);
path_2.cubicTo(size.width*0.03463343,size.height*-0.002515588,size.width*0.03009731,size.height*-0.002340995,size.width*0.02605310,size.height*-0.002001646);
path_2.lineTo(size.width*0.02728176,size.height*0.003372007);
path_2.cubicTo(size.width*0.03087104,size.height*0.003070832,size.width*0.03504746,size.height*0.002904286,size.width*0.03998537,size.height*0.002814774);
path_2.lineTo(size.width*0.03971731,size.height*-0.002607758);
path_2.close();
path_2.moveTo(size.width*0.01191890,size.height*0.0005292767);
path_2.cubicTo(size.width*0.009570149,size.height*0.001293224,size.width*0.007467731,size.height*0.002233020,size.width*0.005576925,size.height*0.003378427);
path_2.lineTo(size.width*0.01190922,size.height*0.007214448);
path_2.cubicTo(size.width*0.01316794,size.height*0.006451935,size.width*0.01456075,size.height*0.005827450,size.width*0.01615513,size.height*0.005308879);
path_2.lineTo(size.width*0.01191890,size.height*0.0005292767);
path_2.close();

Paint paint2Fill = Paint()..style=PaintingStyle.fill;
paint2Fill.color = const Color(0xffE5E8EA).withOpacity(1.0);
canvas.drawPath(path_2,paint2Fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}


class TimePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.2727273);
    path_0.cubicTo(0, size.height * 0.1441625, 0, size.height * 0.07988000,
        size.width * 0.03514720, size.height * 0.03994000);
    path_0.cubicTo(size.width * 0.07029440, 0, size.width * 0.1268630, 0,
        size.width * 0.2400000, 0);
    path_0.lineTo(size.width * 0.7600000, 0);
    path_0.cubicTo(size.width * 0.8731370, 0, size.width * 0.9297060, 0,
        size.width * 0.9648530, size.height * 0.03994000);
    path_0.cubicTo(size.width, size.height * 0.07988000, size.width,
        size.height * 0.1441625, size.width, size.height * 0.2727273);
    path_0.lineTo(size.width, size.height * 0.3636364);
    path_0.cubicTo(
        size.width,
        size.height * 0.3671250,
        size.width,
        size.height * 0.3688693,
        size.width * 0.9987820,
        size.height * 0.3735773);
    path_0.cubicTo(
        size.width * 0.9975650,
        size.height * 0.3782841,
        size.width * 0.9815450,
        size.height * 0.4065750,
        size.width * 0.9495070,
        size.height * 0.4631545);
    path_0.cubicTo(
        size.width * 0.9434900,
        size.height * 0.4737795,
        size.width * 0.9400000,
        size.height * 0.4864261,
        size.width * 0.9400000,
        size.height * 0.5000000);
    path_0.cubicTo(
        size.width * 0.9400000,
        size.height * 0.5135739,
        size.width * 0.9434900,
        size.height * 0.5262205,
        size.width * 0.9495070,
        size.height * 0.5368455);
    path_0.cubicTo(
        size.width * 0.9815450,
        size.height * 0.5934250,
        size.width * 0.9975650,
        size.height * 0.6217159,
        size.width * 0.9987820,
        size.height * 0.6264227);
    path_0.cubicTo(size.width, size.height * 0.6311307, size.width,
        size.height * 0.6328750, size.width, size.height * 0.6363636);
    path_0.lineTo(size.width, size.height * 0.7272727);
    path_0.cubicTo(
        size.width,
        size.height * 0.8558375,
        size.width,
        size.height * 0.9201205,
        size.width * 0.9648530,
        size.height * 0.9600602);
    path_0.cubicTo(size.width * 0.9297060, size.height, size.width * 0.8731370,
        size.height, size.width * 0.7600000, size.height);
    path_0.lineTo(size.width * 0.2400000, size.height);
    path_0.cubicTo(size.width * 0.1268630, size.height, size.width * 0.07029440,
        size.height, size.width * 0.03514720, size.height * 0.9600602);
    path_0.cubicTo(0, size.height * 0.9201205, 0, size.height * 0.8558375, 0,
        size.height * 0.7272727);
    path_0.lineTo(0, size.height * 0.6302409);
    path_0.cubicTo(0, size.height * 0.6280261, 0, size.height * 0.6335636,
        size.width * 0.0008729170, size.height * 0.6295420);
    path_0.cubicTo(
        size.width * 0.001745830,
        size.height * 0.6255205,
        size.width * 0.01573830,
        size.height * 0.5952477,
        size.width * 0.04372330,
        size.height * 0.5347045);
    path_0.cubicTo(
        size.width * 0.04773190,
        size.height * 0.5260318,
        size.width * 0.05000000,
        size.height * 0.5161580,
        size.width * 0.05000000,
        size.height * 0.5056818);
    path_0.cubicTo(
        size.width * 0.05000000,
        size.height * 0.4952057,
        size.width * 0.04773190,
        size.height * 0.4853318,
        size.width * 0.04372330,
        size.height * 0.4766591);
    path_0.cubicTo(
        size.width * 0.01573830,
        size.height * 0.4161159,
        size.width * 0.001745830,
        size.height * 0.3858432,
        size.width * 0.0008729170,
        size.height * 0.3818216);
    path_0.cubicTo(0, size.height * 0.3778000, 0, size.height * 0.3833375, 0,
        size.height * 0.3811227);
    path_0.lineTo(0, size.height * 0.2727273);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.2727273);
    path_1.cubicTo(0, size.height * 0.1441625, 0, size.height * 0.07988000,
        size.width * 0.03514720, size.height * 0.03994000);
    path_1.cubicTo(size.width * 0.07029440, 0, size.width * 0.1268630, 0,
        size.width * 0.2400000, 0);
    path_1.lineTo(size.width * 0.7600000, 0);
    path_1.cubicTo(size.width * 0.8731370, 0, size.width * 0.9297060, 0,
        size.width * 0.9648530, size.height * 0.03994000);
    path_1.cubicTo(size.width, size.height * 0.07988000, size.width,
        size.height * 0.1441625, size.width, size.height * 0.2727273);
    path_1.lineTo(size.width, size.height * 0.3636364);
    path_1.cubicTo(
        size.width,
        size.height * 0.3671250,
        size.width,
        size.height * 0.3688693,
        size.width * 0.9987820,
        size.height * 0.3735773);
    path_1.cubicTo(
        size.width * 0.9975650,
        size.height * 0.3782841,
        size.width * 0.9815450,
        size.height * 0.4065750,
        size.width * 0.9495070,
        size.height * 0.4631545);
    path_1.cubicTo(
        size.width * 0.9434900,
        size.height * 0.4737795,
        size.width * 0.9400000,
        size.height * 0.4864261,
        size.width * 0.9400000,
        size.height * 0.5000000);
    path_1.cubicTo(
        size.width * 0.9400000,
        size.height * 0.5135739,
        size.width * 0.9434900,
        size.height * 0.5262205,
        size.width * 0.9495070,
        size.height * 0.5368455);
    path_1.cubicTo(
        size.width * 0.9815450,
        size.height * 0.5934250,
        size.width * 0.9975650,
        size.height * 0.6217159,
        size.width * 0.9987820,
        size.height * 0.6264227);
    path_1.cubicTo(size.width, size.height * 0.6311307, size.width,
        size.height * 0.6328750, size.width, size.height * 0.6363636);
    path_1.lineTo(size.width, size.height * 0.7272727);
    path_1.cubicTo(
        size.width,
        size.height * 0.8558375,
        size.width,
        size.height * 0.9201205,
        size.width * 0.9648530,
        size.height * 0.9600602);
    path_1.cubicTo(size.width * 0.9297060, size.height, size.width * 0.8731370,
        size.height, size.width * 0.7600000, size.height);
    path_1.lineTo(size.width * 0.2400000, size.height);
    path_1.cubicTo(size.width * 0.1268630, size.height, size.width * 0.07029440,
        size.height, size.width * 0.03514720, size.height * 0.9600602);
    path_1.cubicTo(0, size.height * 0.9201205, 0, size.height * 0.8558375, 0,
        size.height * 0.7272727);
    path_1.lineTo(0, size.height * 0.6302409);
    path_1.cubicTo(0, size.height * 0.6280261, 0, size.height * 0.6335636,
        size.width * 0.0008729170, size.height * 0.6295420);
    path_1.cubicTo(
        size.width * 0.001745830,
        size.height * 0.6255205,
        size.width * 0.01573830,
        size.height * 0.5952477,
        size.width * 0.04372330,
        size.height * 0.5347045);
    path_1.cubicTo(
        size.width * 0.04773190,
        size.height * 0.5260318,
        size.width * 0.05000000,
        size.height * 0.5161580,
        size.width * 0.05000000,
        size.height * 0.5056818);
    path_1.cubicTo(
        size.width * 0.05000000,
        size.height * 0.4952057,
        size.width * 0.04773190,
        size.height * 0.4853318,
        size.width * 0.04372330,
        size.height * 0.4766591);
    path_1.cubicTo(
        size.width * 0.01573830,
        size.height * 0.4161159,
        size.width * 0.001745830,
        size.height * 0.3858432,
        size.width * 0.0008729170,
        size.height * 0.3818216);
    path_1.cubicTo(0, size.height * 0.3778000, 0, size.height * 0.3833375, 0,
        size.height * 0.3811227);
    path_1.lineTo(0, size.height * 0.2727273);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff5465FF).withOpacity(0.1);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.04372330, size.height * 0.4766591);
    path_2.lineTo(size.width * 0.05257630, size.height * 0.4713750);
    path_2.lineTo(size.width * 0.04372330, size.height * 0.4766591);
    path_2.close();
    path_2.moveTo(size.width * 0.0008729170, size.height * 0.6295420);
    path_2.lineTo(size.width * -0.008836110, size.height * 0.6268205);
    path_2.lineTo(size.width * 0.0008729170, size.height * 0.6295420);
    path_2.close();
    path_2.moveTo(size.width * 0.9987820, size.height * 0.6264227);
    path_2.lineTo(size.width * 1.008380, size.height * 0.6232182);
    path_2.lineTo(size.width * 0.9987820, size.height * 0.6264227);
    path_2.close();
    path_2.moveTo(size.width * 0.9495070, size.height * 0.4631545);
    path_2.lineTo(size.width * 0.9410970, size.height * 0.4570057);
    path_2.lineTo(size.width * 0.9495070, size.height * 0.4631545);
    path_2.close();
    path_2.moveTo(size.width * 0.9987820, size.height * 0.3735773);
    path_2.lineTo(size.width * 0.9891880, size.height * 0.3703727);
    path_2.lineTo(size.width * 0.9987820, size.height * 0.3735773);
    path_2.close();
    path_2.moveTo(size.width * 0.02807610, size.height * 0.03190466);
    path_2.cubicTo(
        size.width * 0.008334840,
        size.height * 0.05433795,
        size.width * -0.0009749460,
        size.height * 0.08319125,
        size.width * -0.005517430,
        size.height * 0.1215852);
    path_2.cubicTo(
        size.width * -0.01002120,
        size.height * 0.1596523,
        size.width * -0.01000000,
        size.height * 0.2087659,
        size.width * -0.01000000,
        size.height * 0.2727273);
    path_2.lineTo(size.width * 0.01000000, size.height * 0.2727273);
    path_2.cubicTo(
        size.width * 0.01000000,
        size.height * 0.2081239,
        size.width * 0.01002120,
        size.height * 0.1608136,
        size.width * 0.01430420,
        size.height * 0.1246136);
    path_2.cubicTo(
        size.width * 0.01854850,
        size.height * 0.08873989,
        size.width * 0.02681240,
        size.height * 0.06548205,
        size.width * 0.04221830,
        size.height * 0.04797534);
    path_2.lineTo(size.width * 0.02807610, size.height * 0.03190466);
    path_2.close();
    path_2.moveTo(size.width * 0.2400000, size.height * -0.01136364);
    path_2.cubicTo(
        size.width * 0.1837140,
        size.height * -0.01136364,
        size.width * 0.1404940,
        size.height * -0.01138773,
        size.width * 0.1069950,
        size.height * -0.006269807);
    path_2.cubicTo(
        size.width * 0.07320840,
        size.height * -0.001107893,
        size.width * 0.04781740,
        size.height * 0.009471398,
        size.width * 0.02807610,
        size.height * 0.03190466);
    path_2.lineTo(size.width * 0.04221830, size.height * 0.04797534);
    path_2.cubicTo(
        size.width * 0.05762420,
        size.height * 0.03046864,
        size.width * 0.07809110,
        size.height * 0.02107784,
        size.width * 0.1096600,
        size.height * 0.01625477);
    path_2.cubicTo(
        size.width * 0.1415160,
        size.height * 0.01138773,
        size.width * 0.1831490,
        size.height * 0.01136364,
        size.width * 0.2400000,
        size.height * 0.01136364);
    path_2.lineTo(size.width * 0.2400000, size.height * -0.01136364);
    path_2.close();
    path_2.moveTo(size.width * 0.7600000, size.height * -0.01136364);
    path_2.lineTo(size.width * 0.2400000, size.height * -0.01136364);
    path_2.lineTo(size.width * 0.2400000, size.height * 0.01136364);
    path_2.lineTo(size.width * 0.7600000, size.height * 0.01136364);
    path_2.lineTo(size.width * 0.7600000, size.height * -0.01136364);
    path_2.close();
    path_2.moveTo(size.width * 0.9719240, size.height * 0.03190466);
    path_2.cubicTo(
        size.width * 0.9521830,
        size.height * 0.009471398,
        size.width * 0.9267920,
        size.height * -0.001107893,
        size.width * 0.8930050,
        size.height * -0.006269807);
    path_2.cubicTo(
        size.width * 0.8595060,
        size.height * -0.01138773,
        size.width * 0.8162860,
        size.height * -0.01136364,
        size.width * 0.7600000,
        size.height * -0.01136364);
    path_2.lineTo(size.width * 0.7600000, size.height * 0.01136364);
    path_2.cubicTo(
        size.width * 0.8168510,
        size.height * 0.01136364,
        size.width * 0.8584840,
        size.height * 0.01138773,
        size.width * 0.8903400,
        size.height * 0.01625477);
    path_2.cubicTo(
        size.width * 0.9219090,
        size.height * 0.02107784,
        size.width * 0.9423760,
        size.height * 0.03046864,
        size.width * 0.9577820,
        size.height * 0.04797534);
    path_2.lineTo(size.width * 0.9719240, size.height * 0.03190466);
    path_2.close();
    path_2.moveTo(size.width * 1.010000, size.height * 0.2727273);
    path_2.cubicTo(
        size.width * 1.010000,
        size.height * 0.2087659,
        size.width * 1.010020,
        size.height * 0.1596523,
        size.width * 1.005520,
        size.height * 0.1215852);
    path_2.cubicTo(
        size.width * 1.000970,
        size.height * 0.08319136,
        size.width * 0.9916650,
        size.height * 0.05433795,
        size.width * 0.9719240,
        size.height * 0.03190466);
    path_2.lineTo(size.width * 0.9577820, size.height * 0.04797534);
    path_2.cubicTo(
        size.width * 0.9731880,
        size.height * 0.06548205,
        size.width * 0.9814510,
        size.height * 0.08873989,
        size.width * 0.9856960,
        size.height * 0.1246136);
    path_2.cubicTo(
        size.width * 0.9899790,
        size.height * 0.1608136,
        size.width * 0.9900000,
        size.height * 0.2081239,
        size.width * 0.9900000,
        size.height * 0.2727273);
    path_2.lineTo(size.width * 1.010000, size.height * 0.2727273);
    path_2.close();
    path_2.moveTo(size.width * 1.010000, size.height * 0.3636364);
    path_2.lineTo(size.width * 1.010000, size.height * 0.2727273);
    path_2.lineTo(size.width * 0.9900000, size.height * 0.2727273);
    path_2.lineTo(size.width * 0.9900000, size.height * 0.3636364);
    path_2.lineTo(size.width * 1.010000, size.height * 0.3636364);
    path_2.close();
    path_2.moveTo(size.width * 0.9500000, size.height * 0.5000000);
    path_2.cubicTo(
        size.width * 0.9500000,
        size.height * 0.4886716,
        size.width * 0.9529070,
        size.height * 0.4781500,
        size.width * 0.9579160,
        size.height * 0.4693034);
    path_2.lineTo(size.width * 0.9410970, size.height * 0.4570057);
    path_2.cubicTo(
        size.width * 0.9340740,
        size.height * 0.4694091,
        size.width * 0.9300000,
        size.height * 0.4841818,
        size.width * 0.9300000,
        size.height * 0.5000000);
    path_2.lineTo(size.width * 0.9500000, size.height * 0.5000000);
    path_2.close();
    path_2.moveTo(size.width * 0.9579160, size.height * 0.5306966);
    path_2.cubicTo(
        size.width * 0.9529070,
        size.height * 0.5218500,
        size.width * 0.9500000,
        size.height * 0.5113284,
        size.width * 0.9500000,
        size.height * 0.5000000);
    path_2.lineTo(size.width * 0.9300000, size.height * 0.5000000);
    path_2.cubicTo(
        size.width * 0.9300000,
        size.height * 0.5158182,
        size.width * 0.9340740,
        size.height * 0.5305909,
        size.width * 0.9410970,
        size.height * 0.5429943);
    path_2.lineTo(size.width * 0.9579160, size.height * 0.5306966);
    path_2.close();
    path_2.moveTo(size.width * 1.010000, size.height * 0.7272727);
    path_2.lineTo(size.width * 1.010000, size.height * 0.6363636);
    path_2.lineTo(size.width * 0.9900000, size.height * 0.6363636);
    path_2.lineTo(size.width * 0.9900000, size.height * 0.7272727);
    path_2.lineTo(size.width * 1.010000, size.height * 0.7272727);
    path_2.close();
    path_2.moveTo(size.width * 0.9719240, size.height * 0.9680955);
    path_2.cubicTo(
        size.width * 0.9916650,
        size.height * 0.9456625,
        size.width * 1.000970,
        size.height * 0.9168091,
        size.width * 1.005520,
        size.height * 0.8784148);
    path_2.cubicTo(
        size.width * 1.010020,
        size.height * 0.8403477,
        size.width * 1.010000,
        size.height * 0.7912341,
        size.width * 1.010000,
        size.height * 0.7272727);
    path_2.lineTo(size.width * 0.9900000, size.height * 0.7272727);
    path_2.cubicTo(
        size.width * 0.9900000,
        size.height * 0.7918761,
        size.width * 0.9899790,
        size.height * 0.8391864,
        size.width * 0.9856960,
        size.height * 0.8753864);
    path_2.cubicTo(
        size.width * 0.9814510,
        size.height * 0.9112602,
        size.width * 0.9731880,
        size.height * 0.9345182,
        size.width * 0.9577820,
        size.height * 0.9520250);
    path_2.lineTo(size.width * 0.9719240, size.height * 0.9680955);
    path_2.close();
    path_2.moveTo(size.width * 0.7600000, size.height * 1.011364);
    path_2.cubicTo(
        size.width * 0.8162860,
        size.height * 1.011364,
        size.width * 0.8595060,
        size.height * 1.011387,
        size.width * 0.8930050,
        size.height * 1.006269);
    path_2.cubicTo(
        size.width * 0.9267920,
        size.height * 1.001108,
        size.width * 0.9521830,
        size.height * 0.9905284,
        size.width * 0.9719240,
        size.height * 0.9680955);
    path_2.lineTo(size.width * 0.9577820, size.height * 0.9520250);
    path_2.cubicTo(
        size.width * 0.9423760,
        size.height * 0.9695318,
        size.width * 0.9219090,
        size.height * 0.9789216,
        size.width * 0.8903400,
        size.height * 0.9837455);
    path_2.cubicTo(
        size.width * 0.8584840,
        size.height * 0.9886125,
        size.width * 0.8168510,
        size.height * 0.9886364,
        size.width * 0.7600000,
        size.height * 0.9886364);
    path_2.lineTo(size.width * 0.7600000, size.height * 1.011364);
    path_2.close();
    path_2.moveTo(size.width * 0.2400000, size.height * 1.011364);
    path_2.lineTo(size.width * 0.7600000, size.height * 1.011364);
    path_2.lineTo(size.width * 0.7600000, size.height * 0.9886364);
    path_2.lineTo(size.width * 0.2400000, size.height * 0.9886364);
    path_2.lineTo(size.width * 0.2400000, size.height * 1.011364);
    path_2.close();
    path_2.moveTo(size.width * 0.02807610, size.height * 0.9680955);
    path_2.cubicTo(
        size.width * 0.04781740,
        size.height * 0.9905284,
        size.width * 0.07320840,
        size.height * 1.001108,
        size.width * 0.1069950,
        size.height * 1.006269);
    path_2.cubicTo(
        size.width * 0.1404940,
        size.height * 1.011387,
        size.width * 0.1837140,
        size.height * 1.011364,
        size.width * 0.2400000,
        size.height * 1.011364);
    path_2.lineTo(size.width * 0.2400000, size.height * 0.9886364);
    path_2.cubicTo(
        size.width * 0.1831490,
        size.height * 0.9886364,
        size.width * 0.1415160,
        size.height * 0.9886125,
        size.width * 0.1096600,
        size.height * 0.9837455);
    path_2.cubicTo(
        size.width * 0.07809110,
        size.height * 0.9789216,
        size.width * 0.05762420,
        size.height * 0.9695318,
        size.width * 0.04221830,
        size.height * 0.9520250);
    path_2.lineTo(size.width * 0.02807610, size.height * 0.9680955);
    path_2.close();
    path_2.moveTo(size.width * -0.01000000, size.height * 0.7272727);
    path_2.cubicTo(
        size.width * -0.01000000,
        size.height * 0.7912341,
        size.width * -0.01002120,
        size.height * 0.8403477,
        size.width * -0.005517430,
        size.height * 0.8784148);
    path_2.cubicTo(
        size.width * -0.0009749460,
        size.height * 0.9168091,
        size.width * 0.008334830,
        size.height * 0.9456625,
        size.width * 0.02807610,
        size.height * 0.9680955);
    path_2.lineTo(size.width * 0.04221830, size.height * 0.9520250);
    path_2.cubicTo(
        size.width * 0.02681240,
        size.height * 0.9345182,
        size.width * 0.01854850,
        size.height * 0.9112602,
        size.width * 0.01430420,
        size.height * 0.8753864);
    path_2.cubicTo(
        size.width * 0.01002120,
        size.height * 0.8391864,
        size.width * 0.01000000,
        size.height * 0.7918761,
        size.width * 0.01000000,
        size.height * 0.7272727);
    path_2.lineTo(size.width * -0.01000000, size.height * 0.7272727);
    path_2.close();
    path_2.moveTo(size.width * -0.01000000, size.height * 0.6302409);
    path_2.lineTo(size.width * -0.01000000, size.height * 0.7272727);
    path_2.lineTo(size.width * 0.01000000, size.height * 0.7272727);
    path_2.lineTo(size.width * 0.01000000, size.height * 0.6302409);
    path_2.lineTo(size.width * -0.01000000, size.height * 0.6302409);
    path_2.close();
    path_2.moveTo(size.width * 0.04000000, size.height * 0.5056818);
    path_2.cubicTo(
        size.width * 0.04000000,
        size.height * 0.5142727,
        size.width * 0.03814360,
        size.height * 0.5223386,
        size.width * 0.03487020,
        size.height * 0.5294193);
    path_2.lineTo(size.width * 0.05257630, size.height * 0.5399886);
    path_2.cubicTo(
        size.width * 0.05732020,
        size.height * 0.5297250,
        size.width * 0.06000000,
        size.height * 0.5180420,
        size.width * 0.06000000,
        size.height * 0.5056818);
    path_2.lineTo(size.width * 0.04000000, size.height * 0.5056818);
    path_2.close();
    path_2.moveTo(size.width * 0.03487020, size.height * 0.4819443);
    path_2.cubicTo(
        size.width * 0.03814360,
        size.height * 0.4890250,
        size.width * 0.04000000,
        size.height * 0.4970909,
        size.width * 0.04000000,
        size.height * 0.5056818);
    path_2.lineTo(size.width * 0.06000000, size.height * 0.5056818);
    path_2.cubicTo(
        size.width * 0.06000000,
        size.height * 0.4933216,
        size.width * 0.05732020,
        size.height * 0.4816386,
        size.width * 0.05257630,
        size.height * 0.4713750);
    path_2.lineTo(size.width * 0.03487020, size.height * 0.4819443);
    path_2.close();
    path_2.moveTo(size.width * -0.01000000, size.height * 0.2727273);
    path_2.lineTo(size.width * -0.01000000, size.height * 0.3811227);
    path_2.lineTo(size.width * 0.01000000, size.height * 0.3811227);
    path_2.lineTo(size.width * 0.01000000, size.height * 0.2727273);
    path_2.lineTo(size.width * -0.01000000, size.height * 0.2727273);
    path_2.close();
    path_2.moveTo(size.width * 0.05257630, size.height * 0.4713750);
    path_2.cubicTo(
        size.width * 0.03857560,
        size.height * 0.4410852,
        size.width * 0.02810170,
        size.height * 0.4184261,
        size.width * 0.02101670,
        size.height * 0.4028318);
    path_2.cubicTo(
        size.width * 0.01747080,
        size.height * 0.3950273,
        size.width * 0.01480650,
        size.height * 0.3890648,
        size.width * 0.01298450,
        size.height * 0.3848307);
    path_2.cubicTo(
        size.width * 0.01207060,
        size.height * 0.3827068,
        size.width * 0.01140340,
        size.height * 0.3810989,
        size.width * 0.01095420,
        size.height * 0.3799511);
    path_2.cubicTo(
        size.width * 0.01038750,
        size.height * 0.3785034,
        size.width * 0.01044680,
        size.height * 0.3784784,
        size.width * 0.01058190,
        size.height * 0.3791011);
    path_2.lineTo(size.width * -0.008836110, size.height * 0.3845432);
    path_2.cubicTo(
        size.width * -0.008482710,
        size.height * 0.3861716,
        size.width * -0.007795250,
        size.height * 0.3879727,
        size.width * -0.007320350,
        size.height * 0.3891852);
    path_2.cubicTo(
        size.width * -0.006727910,
        size.height * 0.3907000,
        size.width * -0.005940060,
        size.height * 0.3925898,
        size.width * -0.004982180,
        size.height * 0.3948148);
    path_2.cubicTo(
        size.width * -0.003060520,
        size.height * 0.3992807,
        size.width * -0.0003140440,
        size.height * 0.4054239,
        size.width * 0.003245500,
        size.height * 0.4132580);
    path_2.cubicTo(
        size.width * 0.01037110,
        size.height * 0.4289420,
        size.width * 0.02088600,
        size.height * 0.4516898,
        size.width * 0.03487020,
        size.height * 0.4819443);
    path_2.lineTo(size.width * 0.05257630, size.height * 0.4713750);
    path_2.close();
    path_2.moveTo(size.width * -0.01000000, size.height * 0.3811227);
    path_2.cubicTo(
        size.width * -0.01000000,
        size.height * 0.3812545,
        size.width * -0.01000000,
        size.height * 0.3813818,
        size.width * -0.009999740,
        size.height * 0.3814852);
    path_2.cubicTo(
        size.width * -0.009999580,
        size.height * 0.3815489,
        size.width * -0.009999280,
        size.height * 0.3817455,
        size.width * -0.009994290,
        size.height * 0.3819455);
    path_2.cubicTo(
        size.width * -0.009992760,
        size.height * 0.3820068,
        size.width * -0.009989830,
        size.height * 0.3821102,
        size.width * -0.009984060,
        size.height * 0.3822364);
    path_2.cubicTo(
        size.width * -0.009979740,
        size.height * 0.3823307,
        size.width * -0.009967090,
        size.height * 0.3825955,
        size.width * -0.009933820,
        size.height * 0.3829307);
    path_2.cubicTo(
        size.width * -0.009917800,
        size.height * 0.3830932,
        size.width * -0.009882470,
        size.height * 0.3834227,
        size.width * -0.009811950,
        size.height * 0.3838341);
    path_2.cubicTo(
        size.width * -0.009775960,
        size.height * 0.3840443,
        size.width * -0.009715500,
        size.height * 0.3843670,
        size.width * -0.009619240,
        size.height * 0.3847545);
    path_2.cubicTo(
        size.width * -0.009533860,
        size.height * 0.3850977,
        size.width * -0.009354380,
        size.height * 0.3857636,
        size.width * -0.009022750,
        size.height * 0.3865545);
    path_2.cubicTo(
        size.width * -0.008862020,
        size.height * 0.3869205,
        size.width * -0.008450240,
        size.height * 0.3877341,
        size.width * -0.008192250,
        size.height * 0.3881750);
    path_2.cubicTo(
        size.width * -0.007822690,
        size.height * 0.3887386,
        size.width * -0.006848740,
        size.height * 0.3899409,
        size.width * -0.006227980,
        size.height * 0.3905523);
    path_2.cubicTo(
        size.width * -0.005348180,
        size.height * 0.3912648,
        size.width * -0.003183700,
        size.height * 0.3924364,
        size.width * -0.001905700,
        size.height * 0.3928205);
    path_2.cubicTo(
        size.width * -0.0004788980,
        size.height * 0.3930170,
        size.width * 0.002268260,
        size.height * 0.3927352,
        size.width * 0.003538790,
        size.height * 0.3922966);
    path_2.cubicTo(
        size.width * 0.004534620,
        size.height * 0.3917977,
        size.width * 0.006150640,
        size.height * 0.3906307,
        size.width * 0.006782390,
        size.height * 0.3900216);
    path_2.cubicTo(
        size.width * 0.007227660,
        size.height * 0.3895261,
        size.width * 0.007939300,
        size.height * 0.3885830,
        size.width * 0.008216330,
        size.height * 0.3881523);
    path_2.cubicTo(
        size.width * 0.008779120,
        size.height * 0.3872318,
        size.width * 0.009095070,
        size.height * 0.3864205,
        size.width * 0.009234430,
        size.height * 0.3860409);
    path_2.cubicTo(
        size.width * 0.009525680,
        size.height * 0.3852489,
        size.width * 0.009669460,
        size.height * 0.3845955,
        size.width * 0.009713740,
        size.height * 0.3843920);
    path_2.cubicTo(
        size.width * 0.009776990,
        size.height * 0.3841011,
        size.width * 0.009817400,
        size.height * 0.3838659,
        size.width * 0.009838890,
        size.height * 0.3837352);
    path_2.cubicTo(
        size.width * 0.009881960,
        size.height * 0.3834716,
        size.width * 0.009907580,
        size.height * 0.3832625,
        size.width * 0.009917560,
        size.height * 0.3831795);
    path_2.cubicTo(
        size.width * 0.009939420,
        size.height * 0.3829966,
        size.width * 0.009953490,
        size.height * 0.3828455,
        size.width * 0.009956850,
        size.height * 0.3828102);
    path_2.cubicTo(
        size.width * 0.009962170,
        size.height * 0.3827534,
        size.width * 0.009966950,
        size.height * 0.3827000,
        size.width * 0.009968740,
        size.height * 0.3826795);
    path_2.cubicTo(
        size.width * 0.009971440,
        size.height * 0.3826489,
        size.width * 0.009972560,
        size.height * 0.3826364,
        size.width * 0.009973920,
        size.height * 0.3826216);
    path_2.cubicTo(
        size.width * 0.009976290,
        size.height * 0.3825955,
        size.width * 0.009976440,
        size.height * 0.3825955,
        size.width * 0.009975090,
        size.height * 0.3826080);
    path_2.cubicTo(
        size.width * 0.009973880,
        size.height * 0.3826193,
        size.width * 0.009969310,
        size.height * 0.3826625,
        size.width * 0.009960550,
        size.height * 0.3827284);
    path_2.cubicTo(
        size.width * 0.009952360,
        size.height * 0.3827898,
        size.width * 0.009935160,
        size.height * 0.3829114,
        size.width * 0.009905330,
        size.height * 0.3830773);
    path_2.cubicTo(
        size.width * 0.009878000,
        size.height * 0.3832284,
        size.width * 0.009821340,
        size.height * 0.3835216,
        size.width * 0.009720300,
        size.height * 0.3838977);
    path_2.cubicTo(
        size.width * 0.009635300,
        size.height * 0.3842148,
        size.width * 0.009423800,
        size.height * 0.3849557,
        size.width * 0.008999990,
        size.height * 0.3858420);
    path_2.cubicTo(
        size.width * 0.008779840,
        size.height * 0.3863023,
        size.width * 0.008421360,
        size.height * 0.3869750,
        size.width * 0.007878720,
        size.height * 0.3877023);
    path_2.cubicTo(
        size.width * 0.007344680,
        size.height * 0.3884193,
        size.width * 0.006466070,
        size.height * 0.3894148,
        size.width * 0.005163990,
        size.height * 0.3902420);
    path_2.cubicTo(
        size.width * 0.003785500,
        size.height * 0.3911182,
        size.width * 0.002033480,
        size.height * 0.3917330,
        size.width * 0.00004949110,
        size.height * 0.3916716);
    path_2.cubicTo(
        size.width * -0.001897820,
        size.height * 0.3916102,
        size.width * -0.003499200,
        size.height * 0.3909159,
        size.width * -0.004654700,
        size.height * 0.3901534);
    path_2.cubicTo(
        size.width * -0.005765100,
        size.height * 0.3894205,
        size.width * -0.006528960,
        size.height * 0.3885875,
        size.width * -0.006993170,
        size.height * 0.3880057);
    path_2.cubicTo(
        size.width * -0.007470170,
        size.height * 0.3874068,
        size.width * -0.007799860,
        size.height * 0.3868614,
        size.width * -0.008006980,
        size.height * 0.3864852);
    path_2.cubicTo(
        size.width * -0.008406320,
        size.height * 0.3857602,
        size.width * -0.008622590,
        size.height * 0.3851693,
        size.width * -0.008702510,
        size.height * 0.3849409);
    path_2.cubicTo(
        size.width * -0.008868100,
        size.height * 0.3844705,
        size.width * -0.008901170,
        size.height * 0.3842432,
        size.width * -0.008836110,
        size.height * 0.3845432);
    path_2.lineTo(size.width * 0.01058190, size.height * 0.3791011);
    path_2.cubicTo(
        size.width * 0.01049700,
        size.height * 0.3787091,
        size.width * 0.01040190,
        size.height * 0.3783045,
        size.width * 0.01029430,
        size.height * 0.3778989);
    path_2.cubicTo(
        size.width * 0.01018980,
        size.height * 0.3775034,
        size.width * 0.01005190,
        size.height * 0.3770261,
        size.width * 0.009872080,
        size.height * 0.3765148);
    path_2.cubicTo(
        size.width * 0.009708620,
        size.height * 0.3760500,
        size.width * 0.009414780,
        size.height * 0.3752773,
        size.width * 0.008943400,
        size.height * 0.3744227);
    path_2.cubicTo(
        size.width * 0.008700270,
        size.height * 0.3739818,
        size.width * 0.008335940,
        size.height * 0.3733818,
        size.width * 0.007825650,
        size.height * 0.3727420);
    path_2.cubicTo(
        size.width * 0.007328140,
        size.height * 0.3721182,
        size.width * 0.006532320,
        size.height * 0.3712545,
        size.width * 0.005391230,
        size.height * 0.3705011);
    path_2.cubicTo(
        size.width * 0.004205030,
        size.height * 0.3697182,
        size.width * 0.002574250,
        size.height * 0.3690148,
        size.width * 0.0005987500,
        size.height * 0.3689523);
    path_2.cubicTo(
        size.width * -0.0003711080,
        size.height * 0.3689227,
        size.width * -0.001322000,
        size.height * 0.3690523,
        size.width * -0.002226920,
        size.height * 0.3693205);
    path_2.cubicTo(
        size.width * -0.003125590,
        size.height * 0.3695875,
        size.width * -0.003917750,
        size.height * 0.3699739,
        size.width * -0.004596680,
        size.height * 0.3704057);
    path_2.cubicTo(
        size.width * -0.005924550,
        size.height * 0.3712489,
        size.width * -0.006827770,
        size.height * 0.3722693,
        size.width * -0.007385310,
        size.height * 0.3730170);
    path_2.cubicTo(
        size.width * -0.007951440,
        size.height * 0.3737773,
        size.width * -0.008332300,
        size.height * 0.3744875,
        size.width * -0.008573760,
        size.height * 0.3749920);
    path_2.cubicTo(
        size.width * -0.008822690,
        size.height * 0.3755136,
        size.width * -0.008999770,
        size.height * 0.3759773,
        size.width * -0.009121760,
        size.height * 0.3763284);
    path_2.cubicTo(
        size.width * -0.009246360,
        size.height * 0.3766886,
        size.width * -0.009340150,
        size.height * 0.3770091,
        size.width * -0.009409580,
        size.height * 0.3772670);
    path_2.cubicTo(
        size.width * -0.009545150,
        size.height * 0.3777727,
        size.width * -0.009632500,
        size.height * 0.3782102,
        size.width * -0.009687100,
        size.height * 0.3785125);
    path_2.cubicTo(
        size.width * -0.009794640,
        size.height * 0.3791080,
        size.width * -0.009853600,
        size.height * 0.3796261,
        size.width * -0.009883030,
        size.height * 0.3799057);
    path_2.cubicTo(
        size.width * -0.009906410,
        size.height * 0.3801273,
        size.width * -0.009944440,
        size.height * 0.3805489,
        size.width * -0.009929570,
        size.height * 0.3803920);
    path_2.cubicTo(
        size.width * -0.009928410,
        size.height * 0.3803795,
        size.width * -0.009925650,
        size.height * 0.3803500,
        size.width * -0.009921660,
        size.height * 0.3803114);
    path_2.cubicTo(
        size.width * -0.009918070,
        size.height * 0.3802761,
        size.width * -0.009910490,
        size.height * 0.3802034,
        size.width * -0.009899280,
        size.height * 0.3801102);
    path_2.cubicTo(
        size.width * -0.009890610,
        size.height * 0.3800375,
        size.width * -0.009866200,
        size.height * 0.3798375,
        size.width * -0.009824250,
        size.height * 0.3795807);
    path_2.cubicTo(
        size.width * -0.009803330,
        size.height * 0.3794534,
        size.width * -0.009763460,
        size.height * 0.3792205,
        size.width * -0.009700730,
        size.height * 0.3789330);
    path_2.cubicTo(
        size.width * -0.009668510,
        size.height * 0.3787852,
        size.width * -0.009620640,
        size.height * 0.3785773,
        size.width * -0.009554460,
        size.height * 0.3783318);
    path_2.cubicTo(
        size.width * -0.009492220,
        size.height * 0.3781023,
        size.width * -0.009385510,
        size.height * 0.3777318,
        size.width * -0.009222920,
        size.height * 0.3772886);
    path_2.cubicTo(
        size.width * -0.009149950,
        size.height * 0.3770955,
        size.width * -0.008975740,
        size.height * 0.3766682,
        size.width * -0.008873010,
        size.height * 0.3764375);
    path_2.cubicTo(
        size.width * -0.008738920,
        size.height * 0.3761534,
        size.width * -0.008407170,
        size.height * 0.3755227,
        size.width * -0.008205530,
        size.height * 0.3751795);
    path_2.cubicTo(
        size.width * -0.007928610,
        size.height * 0.3747489,
        size.width * -0.007217090,
        size.height * 0.3738068,
        size.width * -0.006771920,
        size.height * 0.3733102);
    path_2.cubicTo(
        size.width * -0.006140290,
        size.height * 0.3727011,
        size.width * -0.004524380,
        size.height * 0.3715352,
        size.width * -0.003528660,
        size.height * 0.3710352);
    path_2.cubicTo(
        size.width * -0.002258250,
        size.height * 0.3705977,
        size.width * 0.0004888080,
        size.height * 0.3703159,
        size.width * 0.001915500,
        size.height * 0.3705125);
    path_2.cubicTo(
        size.width * 0.003193390,
        size.height * 0.3708955,
        size.width * 0.005357770,
        size.height * 0.3720682,
        size.width * 0.006237460,
        size.height * 0.3727795);
    path_2.cubicTo(
        size.width * 0.006858120,
        size.height * 0.3733909,
        size.width * 0.007831960,
        size.height * 0.3745943,
        size.width * 0.008201420,
        size.height * 0.3751568);
    path_2.cubicTo(
        size.width * 0.008459300,
        size.height * 0.3755977,
        size.width * 0.008870990,
        size.height * 0.3764102,
        size.width * 0.009031610,
        size.height * 0.3767761);
    path_2.cubicTo(
        size.width * 0.009363040,
        size.height * 0.3775670,
        size.width * 0.009542330,
        size.height * 0.3782330,
        size.width * 0.009627510,
        size.height * 0.3785750);
    path_2.cubicTo(
        size.width * 0.009723580,
        size.height * 0.3789614,
        size.width * 0.009783850,
        size.height * 0.3792830,
        size.width * 0.009819660,
        size.height * 0.3794920);
    path_2.cubicTo(
        size.width * 0.009889810,
        size.height * 0.3799023,
        size.width * 0.009924790,
        size.height * 0.3802284,
        size.width * 0.009940480,
        size.height * 0.3803875);
    path_2.cubicTo(
        size.width * 0.009973080,
        size.height * 0.3807159,
        size.width * 0.009985130,
        size.height * 0.3809727,
        size.width * 0.009988910,
        size.height * 0.3810545);
    path_2.cubicTo(
        size.width * 0.009994140,
        size.height * 0.3811693,
        size.width * 0.009996590,
        size.height * 0.3812580,
        size.width * 0.009997700,
        size.height * 0.3813023);
    path_2.cubicTo(
        size.width * 0.01000100,
        size.height * 0.3814341,
        size.width * 0.01000040,
        size.height * 0.3815182,
        size.width * 0.01000020,
        size.height * 0.3814182);
    path_2.cubicTo(
        size.width * 0.01000000,
        size.height * 0.3813568,
        size.width * 0.01000000,
        size.height * 0.3812682,
        size.width * 0.01000000,
        size.height * 0.3811227);
    path_2.lineTo(size.width * -0.01000000, size.height * 0.3811227);
    path_2.close();
    path_2.moveTo(size.width * 0.01000000, size.height * 0.6302409);
    path_2.cubicTo(
        size.width * 0.01000000,
        size.height * 0.6300955,
        size.width * 0.01000000,
        size.height * 0.6300068,
        size.width * 0.01000020,
        size.height * 0.6299455);
    path_2.cubicTo(
        size.width * 0.01000040,
        size.height * 0.6298455,
        size.width * 0.01000100,
        size.height * 0.6299295,
        size.width * 0.009997700,
        size.height * 0.6300614);
    path_2.cubicTo(
        size.width * 0.009996590,
        size.height * 0.6301057,
        size.width * 0.009994140,
        size.height * 0.6301943,
        size.width * 0.009988910,
        size.height * 0.6303091);
    path_2.cubicTo(
        size.width * 0.009985130,
        size.height * 0.6303909,
        size.width * 0.009973080,
        size.height * 0.6306477,
        size.width * 0.009940480,
        size.height * 0.6309761);
    path_2.cubicTo(
        size.width * 0.009924790,
        size.height * 0.6311352,
        size.width * 0.009889810,
        size.height * 0.6314614,
        size.width * 0.009819660,
        size.height * 0.6318716);
    path_2.cubicTo(
        size.width * 0.009783850,
        size.height * 0.6320807,
        size.width * 0.009723580,
        size.height * 0.6324023,
        size.width * 0.009627510,
        size.height * 0.6327886);
    path_2.cubicTo(
        size.width * 0.009542330,
        size.height * 0.6331307,
        size.width * 0.009363040,
        size.height * 0.6337966,
        size.width * 0.009031610,
        size.height * 0.6345875);
    path_2.cubicTo(
        size.width * 0.008870990,
        size.height * 0.6349534,
        size.width * 0.008459300,
        size.height * 0.6357659,
        size.width * 0.008201420,
        size.height * 0.6362068);
    path_2.cubicTo(
        size.width * 0.007831950,
        size.height * 0.6367693,
        size.width * 0.006858110,
        size.height * 0.6379727,
        size.width * 0.006237440,
        size.height * 0.6385841);
    path_2.cubicTo(
        size.width * 0.005357740,
        size.height * 0.6392955,
        size.width * 0.003193350,
        size.height * 0.6404682,
        size.width * 0.001915450,
        size.height * 0.6408523);
    path_2.cubicTo(
        size.width * 0.0004887550,
        size.height * 0.6410477,
        size.width * -0.002258300,
        size.height * 0.6407659,
        size.width * -0.003528710,
        size.height * 0.6403284);
    path_2.cubicTo(
        size.width * -0.004524430,
        size.height * 0.6398284,
        size.width * -0.006140320,
        size.height * 0.6386625,
        size.width * -0.006771950,
        size.height * 0.6380534);
    path_2.cubicTo(
        size.width * -0.007217110,
        size.height * 0.6375568,
        size.width * -0.007928630,
        size.height * 0.6366148,
        size.width * -0.008205540,
        size.height * 0.6361841);
    path_2.cubicTo(
        size.width * -0.008407180,
        size.height * 0.6358409,
        size.width * -0.008738930,
        size.height * 0.6352102,
        size.width * -0.008873020,
        size.height * 0.6349261);
    path_2.cubicTo(
        size.width * -0.008975750,
        size.height * 0.6346955,
        size.width * -0.009149960,
        size.height * 0.6342682,
        size.width * -0.009222920,
        size.height * 0.6340750);
    path_2.cubicTo(
        size.width * -0.009385510,
        size.height * 0.6336318,
        size.width * -0.009492230,
        size.height * 0.6332614,
        size.width * -0.009554460,
        size.height * 0.6330318);
    path_2.cubicTo(
        size.width * -0.009620640,
        size.height * 0.6327864,
        size.width * -0.009668520,
        size.height * 0.6325784,
        size.width * -0.009700730,
        size.height * 0.6324307);
    path_2.cubicTo(
        size.width * -0.009763460,
        size.height * 0.6321432,
        size.width * -0.009803330,
        size.height * 0.6319102,
        size.width * -0.009824260,
        size.height * 0.6317830);
    path_2.cubicTo(
        size.width * -0.009866200,
        size.height * 0.6315261,
        size.width * -0.009890610,
        size.height * 0.6313261,
        size.width * -0.009899280,
        size.height * 0.6312534);
    path_2.cubicTo(
        size.width * -0.009910490,
        size.height * 0.6311602,
        size.width * -0.009918070,
        size.height * 0.6310875,
        size.width * -0.009921660,
        size.height * 0.6310523);
    path_2.cubicTo(
        size.width * -0.009925650,
        size.height * 0.6310136,
        size.width * -0.009928410,
        size.height * 0.6309841,
        size.width * -0.009929570,
        size.height * 0.6309716);
    path_2.cubicTo(
        size.width * -0.009944440,
        size.height * 0.6308148,
        size.width * -0.009906410,
        size.height * 0.6312364,
        size.width * -0.009883030,
        size.height * 0.6314580);
    path_2.cubicTo(
        size.width * -0.009853600,
        size.height * 0.6317375,
        size.width * -0.009794640,
        size.height * 0.6322557,
        size.width * -0.009687100,
        size.height * 0.6328511);
    path_2.cubicTo(
        size.width * -0.009632500,
        size.height * 0.6331534,
        size.width * -0.009545150,
        size.height * 0.6335909,
        size.width * -0.009409590,
        size.height * 0.6340966);
    path_2.cubicTo(
        size.width * -0.009340160,
        size.height * 0.6343545,
        size.width * -0.009246360,
        size.height * 0.6346750,
        size.width * -0.009121770,
        size.height * 0.6350352);
    path_2.cubicTo(
        size.width * -0.008999770,
        size.height * 0.6353864,
        size.width * -0.008822700,
        size.height * 0.6358500,
        size.width * -0.008573770,
        size.height * 0.6363716);
    path_2.cubicTo(
        size.width * -0.008332310,
        size.height * 0.6368761,
        size.width * -0.007951450,
        size.height * 0.6375864,
        size.width * -0.007385330,
        size.height * 0.6383466);
    path_2.cubicTo(
        size.width * -0.006827790,
        size.height * 0.6390943,
        size.width * -0.005924580,
        size.height * 0.6401148,
        size.width * -0.004596720,
        size.height * 0.6409580);
    path_2.cubicTo(
        size.width * -0.003917800,
        size.height * 0.6413898,
        size.width * -0.003125640,
        size.height * 0.6417761,
        size.width * -0.002226980,
        size.height * 0.6420432);
    path_2.cubicTo(
        size.width * -0.001322060,
        size.height * 0.6423114,
        size.width * -0.0003711640,
        size.height * 0.6424409,
        size.width * 0.0005986960,
        size.height * 0.6424114);
    path_2.cubicTo(
        size.width * 0.002574200,
        size.height * 0.6423489,
        size.width * 0.004205000,
        size.height * 0.6416455,
        size.width * 0.005391200,
        size.height * 0.6408625);
    path_2.cubicTo(
        size.width * 0.006532300,
        size.height * 0.6401091,
        size.width * 0.007328130,
        size.height * 0.6392455,
        size.width * 0.007825640,
        size.height * 0.6386216);
    path_2.cubicTo(
        size.width * 0.008335940,
        size.height * 0.6379818,
        size.width * 0.008700260,
        size.height * 0.6373830,
        size.width * 0.008943400,
        size.height * 0.6369409);
    path_2.cubicTo(
        size.width * 0.009414780,
        size.height * 0.6360864,
        size.width * 0.009708620,
        size.height * 0.6353136,
        size.width * 0.009872080,
        size.height * 0.6348489);
    path_2.cubicTo(
        size.width * 0.01005190,
        size.height * 0.6343375,
        size.width * 0.01018980,
        size.height * 0.6338602,
        size.width * 0.01029430,
        size.height * 0.6334659);
    path_2.cubicTo(
        size.width * 0.01040190,
        size.height * 0.6330591,
        size.width * 0.01049700,
        size.height * 0.6326545,
        size.width * 0.01058190,
        size.height * 0.6322625);
    path_2.lineTo(size.width * -0.008836110, size.height * 0.6268205);
    path_2.cubicTo(
        size.width * -0.008901170,
        size.height * 0.6271205,
        size.width * -0.008868100,
        size.height * 0.6268932,
        size.width * -0.008702510,
        size.height * 0.6264227);
    path_2.cubicTo(
        size.width * -0.008622590,
        size.height * 0.6261943,
        size.width * -0.008406320,
        size.height * 0.6256034,
        size.width * -0.008006970,
        size.height * 0.6248784);
    path_2.cubicTo(
        size.width * -0.007799850,
        size.height * 0.6245023,
        size.width * -0.007470160,
        size.height * 0.6239568,
        size.width * -0.006993160,
        size.height * 0.6233580);
    path_2.cubicTo(
        size.width * -0.006528950,
        size.height * 0.6227761,
        size.width * -0.005765080,
        size.height * 0.6219432,
        size.width * -0.004654670,
        size.height * 0.6212102);
    path_2.cubicTo(
        size.width * -0.003499160,
        size.height * 0.6204477,
        size.width * -0.001897770,
        size.height * 0.6197534,
        size.width * 0.00004954490,
        size.height * 0.6196920);
    path_2.cubicTo(
        size.width * 0.002033540,
        size.height * 0.6196307,
        size.width * 0.003785550,
        size.height * 0.6202455,
        size.width * 0.005164030,
        size.height * 0.6211216);
    path_2.cubicTo(
        size.width * 0.006466100,
        size.height * 0.6219489,
        size.width * 0.007344700,
        size.height * 0.6229443,
        size.width * 0.007878740,
        size.height * 0.6236614);
    path_2.cubicTo(
        size.width * 0.008421370,
        size.height * 0.6243898,
        size.width * 0.008779850,
        size.height * 0.6250614,
        size.width * 0.008999990,
        size.height * 0.6255216);
    path_2.cubicTo(
        size.width * 0.009423810,
        size.height * 0.6264080,
        size.width * 0.009635310,
        size.height * 0.6271489,
        size.width * 0.009720310,
        size.height * 0.6274659);
    path_2.cubicTo(
        size.width * 0.009821340,
        size.height * 0.6278420,
        size.width * 0.009878010,
        size.height * 0.6281352,
        size.width * 0.009905330,
        size.height * 0.6282864);
    path_2.cubicTo(
        size.width * 0.009935160,
        size.height * 0.6284523,
        size.width * 0.009952360,
        size.height * 0.6285739,
        size.width * 0.009960560,
        size.height * 0.6286352);
    path_2.cubicTo(
        size.width * 0.009969310,
        size.height * 0.6287011,
        size.width * 0.009973880,
        size.height * 0.6287443,
        size.width * 0.009975100,
        size.height * 0.6287557);
    path_2.cubicTo(
        size.width * 0.009976440,
        size.height * 0.6287682,
        size.width * 0.009976290,
        size.height * 0.6287682,
        size.width * 0.009973920,
        size.height * 0.6287420);
    path_2.cubicTo(
        size.width * 0.009972560,
        size.height * 0.6287273,
        size.width * 0.009971440,
        size.height * 0.6287148,
        size.width * 0.009968740,
        size.height * 0.6286841);
    path_2.cubicTo(
        size.width * 0.009966950,
        size.height * 0.6286636,
        size.width * 0.009962170,
        size.height * 0.6286102,
        size.width * 0.009956850,
        size.height * 0.6285534);
    path_2.cubicTo(
        size.width * 0.009953490,
        size.height * 0.6285182,
        size.width * 0.009939420,
        size.height * 0.6283670,
        size.width * 0.009917560,
        size.height * 0.6281852);
    path_2.cubicTo(
        size.width * 0.009907580,
        size.height * 0.6281011,
        size.width * 0.009881960,
        size.height * 0.6278920,
        size.width * 0.009838890,
        size.height * 0.6276284);
    path_2.cubicTo(
        size.width * 0.009817400,
        size.height * 0.6274977,
        size.width * 0.009776990,
        size.height * 0.6272625,
        size.width * 0.009713740,
        size.height * 0.6269716);
    path_2.cubicTo(
        size.width * 0.009669470,
        size.height * 0.6267682,
        size.width * 0.009525680,
        size.height * 0.6261148,
        size.width * 0.009234430,
        size.height * 0.6253227);
    path_2.cubicTo(
        size.width * 0.009095070,
        size.height * 0.6249432,
        size.width * 0.008779130,
        size.height * 0.6241318,
        size.width * 0.008216350,
        size.height * 0.6232114);
    path_2.cubicTo(
        size.width * 0.007939320,
        size.height * 0.6227807,
        size.width * 0.007227680,
        size.height * 0.6218375,
        size.width * 0.006782410,
        size.height * 0.6213420);
    path_2.cubicTo(
        size.width * 0.006150670,
        size.height * 0.6207330,
        size.width * 0.004534670,
        size.height * 0.6195659,
        size.width * 0.003538840,
        size.height * 0.6190670);
    path_2.cubicTo(
        size.width * 0.002268320,
        size.height * 0.6186284,
        size.width * -0.0004788450,
        size.height * 0.6183466,
        size.width * -0.001905650,
        size.height * 0.6185432);
    path_2.cubicTo(
        size.width * -0.003183660,
        size.height * 0.6189273,
        size.width * -0.005348150,
        size.height * 0.6200989,
        size.width * -0.006227960,
        size.height * 0.6208114);
    path_2.cubicTo(
        size.width * -0.006848730,
        size.height * 0.6214227,
        size.width * -0.007822680,
        size.height * 0.6226250,
        size.width * -0.008192250,
        size.height * 0.6231886);
    path_2.cubicTo(
        size.width * -0.008450230,
        size.height * 0.6236295,
        size.width * -0.008862020,
        size.height * 0.6244432,
        size.width * -0.009022750,
        size.height * 0.6248091);
    path_2.cubicTo(
        size.width * -0.009354380,
        size.height * 0.6256000,
        size.width * -0.009533860,
        size.height * 0.6262659,
        size.width * -0.009619240,
        size.height * 0.6266091);
    path_2.cubicTo(
        size.width * -0.009715500,
        size.height * 0.6269966,
        size.width * -0.009775960,
        size.height * 0.6273193,
        size.width * -0.009811950,
        size.height * 0.6275295);
    path_2.cubicTo(
        size.width * -0.009882470,
        size.height * 0.6279409,
        size.width * -0.009917800,
        size.height * 0.6282705,
        size.width * -0.009933820,
        size.height * 0.6284330);
    path_2.cubicTo(
        size.width * -0.009967090,
        size.height * 0.6287682,
        size.width * -0.009979740,
        size.height * 0.6290330,
        size.width * -0.009984060,
        size.height * 0.6291273);
    path_2.cubicTo(
        size.width * -0.009989830,
        size.height * 0.6292534,
        size.width * -0.009992760,
        size.height * 0.6293568,
        size.width * -0.009994290,
        size.height * 0.6294182);
    path_2.cubicTo(
        size.width * -0.009999280,
        size.height * 0.6296182,
        size.width * -0.009999580,
        size.height * 0.6298148,
        size.width * -0.009999740,
        size.height * 0.6298784);
    path_2.cubicTo(
        size.width * -0.01000000,
        size.height * 0.6299818,
        size.width * -0.01000000,
        size.height * 0.6301091,
        size.width * -0.01000000,
        size.height * 0.6302409);
    path_2.lineTo(size.width * 0.01000000, size.height * 0.6302409);
    path_2.close();
    path_2.moveTo(size.width * 0.03487020, size.height * 0.5294193);
    path_2.cubicTo(
        size.width * 0.02088600,
        size.height * 0.5596739,
        size.width * 0.01037110,
        size.height * 0.5824227,
        size.width * 0.003245500,
        size.height * 0.5981057);
    path_2.cubicTo(
        size.width * -0.0003140440,
        size.height * 0.6059398,
        size.width * -0.003060520,
        size.height * 0.6120830,
        size.width * -0.004982180,
        size.height * 0.6165489);
    path_2.cubicTo(
        size.width * -0.005940060,
        size.height * 0.6187739,
        size.width * -0.006727920,
        size.height * 0.6206636,
        size.width * -0.007320360,
        size.height * 0.6221784);
    path_2.cubicTo(
        size.width * -0.007795250,
        size.height * 0.6233920,
        size.width * -0.008482710,
        size.height * 0.6251920,
        size.width * -0.008836110,
        size.height * 0.6268205);
    path_2.lineTo(size.width * 0.01058190, size.height * 0.6322625);
    path_2.cubicTo(
        size.width * 0.01044680,
        size.height * 0.6328852,
        size.width * 0.01038750,
        size.height * 0.6328602,
        size.width * 0.01095420,
        size.height * 0.6314125);
    path_2.cubicTo(
        size.width * 0.01140340,
        size.height * 0.6302648,
        size.width * 0.01207060,
        size.height * 0.6286568,
        size.width * 0.01298450,
        size.height * 0.6265330);
    path_2.cubicTo(
        size.width * 0.01480650,
        size.height * 0.6222989,
        size.width * 0.01747080,
        size.height * 0.6163364,
        size.width * 0.02101670,
        size.height * 0.6085318);
    path_2.cubicTo(
        size.width * 0.02810170,
        size.height * 0.5929375,
        size.width * 0.03857560,
        size.height * 0.5702784,
        size.width * 0.05257630,
        size.height * 0.5399886);
    path_2.lineTo(size.width * 0.03487020, size.height * 0.5294193);
    path_2.close();
    path_2.moveTo(size.width * 0.9410970, size.height * 0.5429943);
    path_2.cubicTo(
        size.width * 0.9571300,
        size.height * 0.5713080,
        size.width * 0.9691110,
        size.height * 0.5924670,
        size.width * 0.9772400,
        size.height * 0.6071398);
    path_2.cubicTo(
        size.width * 0.9813090,
        size.height * 0.6144852,
        size.width * 0.9843610,
        size.height * 0.6201136,
        size.width * 0.9864560,
        size.height * 0.6241591);
    path_2.cubicTo(
        size.width * 0.9875070,
        size.height * 0.6261886,
        size.width * 0.9882670,
        size.height * 0.6277250,
        size.width * 0.9887770,
        size.height * 0.6288295);
    path_2.cubicTo(
        size.width * 0.9894060,
        size.height * 0.6301886,
        size.width * 0.9893480,
        size.height * 0.6302443,
        size.width * 0.9891880,
        size.height * 0.6296273);
    path_2.lineTo(size.width * 1.008380, size.height * 0.6232182);
    path_2.cubicTo(
        size.width * 1.007910,
        size.height * 0.6214250,
        size.width * 1.007090,
        size.height * 0.6195670,
        size.width * 1.006480,
        size.height * 0.6182568);
    path_2.cubicTo(
        size.width * 1.005760,
        size.height * 0.6166920,
        size.width * 1.004820,
        size.height * 0.6148034,
        size.width * 1.003690,
        size.height * 0.6126352);
    path_2.cubicTo(
        size.width * 1.001440,
        size.height * 0.6082841,
        size.width * 0.9982580,
        size.height * 0.6024216,
        size.width * 0.9941650,
        size.height * 0.5950330);
    path_2.cubicTo(
        size.width * 0.9859700,
        size.height * 0.5802386,
        size.width * 0.9739220,
        size.height * 0.5589625,
        size.width * 0.9579160,
        size.height * 0.5306966);
    path_2.lineTo(size.width * 0.9410970, size.height * 0.5429943);
    path_2.close();
    path_2.moveTo(size.width * 1.010000, size.height * 0.6363636);
    path_2.cubicTo(
        size.width * 1.010000,
        size.height * 0.6322068,
        size.width * 1.009950,
        size.height * 0.6293023,
        size.width * 1.008380,
        size.height * 0.6232182);
    path_2.lineTo(size.width * 0.9891880, size.height * 0.6296273);
    path_2.cubicTo(
        size.width * 0.9897040,
        size.height * 0.6316216,
        size.width * 0.9898530,
        size.height * 0.6325739,
        size.width * 0.9899170,
        size.height * 0.6331864);
    path_2.cubicTo(
        size.width * 0.9899890,
        size.height * 0.6338727,
        size.width * 0.9900000,
        size.height * 0.6345125,
        size.width * 0.9900000,
        size.height * 0.6363636);
    path_2.lineTo(size.width * 1.010000, size.height * 0.6363636);
    path_2.close();
    path_2.moveTo(size.width * 0.9900000, size.height * 0.3636364);
    path_2.cubicTo(
        size.width * 0.9900000,
        size.height * 0.3654875,
        size.width * 0.9899890,
        size.height * 0.3661273,
        size.width * 0.9899170,
        size.height * 0.3668136);
    path_2.cubicTo(
        size.width * 0.9898530,
        size.height * 0.3674261,
        size.width * 0.9897040,
        size.height * 0.3683784,
        size.width * 0.9891880,
        size.height * 0.3703727);
    path_2.lineTo(size.width * 1.008380, size.height * 0.3767818);
    path_2.cubicTo(
        size.width * 1.009950,
        size.height * 0.3706977,
        size.width * 1.010000,
        size.height * 0.3677932,
        size.width * 1.010000,
        size.height * 0.3636364);
    path_2.lineTo(size.width * 0.9900000, size.height * 0.3636364);
    path_2.close();
    path_2.moveTo(size.width * 0.9579160, size.height * 0.4693034);
    path_2.cubicTo(
        size.width * 0.9739220,
        size.height * 0.4410375,
        size.width * 0.9859700,
        size.height * 0.4197614,
        size.width * 0.9941650,
        size.height * 0.4049670);
    path_2.cubicTo(
        size.width * 0.9982580,
        size.height * 0.3975784,
        size.width * 1.001440,
        size.height * 0.3917159,
        size.width * 1.003690,
        size.height * 0.3873648);
    path_2.cubicTo(
        size.width * 1.004820,
        size.height * 0.3851966,
        size.width * 1.005760,
        size.height * 0.3833080,
        size.width * 1.006480,
        size.height * 0.3817432);
    path_2.cubicTo(
        size.width * 1.007090,
        size.height * 0.3804330,
        size.width * 1.007910,
        size.height * 0.3785750,
        size.width * 1.008380,
        size.height * 0.3767818);
    path_2.lineTo(size.width * 0.9891880, size.height * 0.3703727);
    path_2.cubicTo(
        size.width * 0.9893480,
        size.height * 0.3697557,
        size.width * 0.9894060,
        size.height * 0.3698114,
        size.width * 0.9887770,
        size.height * 0.3711705);
    path_2.cubicTo(
        size.width * 0.9882670,
        size.height * 0.3722750,
        size.width * 0.9875070,
        size.height * 0.3738114,
        size.width * 0.9864560,
        size.height * 0.3758409);
    path_2.cubicTo(
        size.width * 0.9843610,
        size.height * 0.3798864,
        size.width * 0.9813090,
        size.height * 0.3855148,
        size.width * 0.9772400,
        size.height * 0.3928602);
    path_2.cubicTo(
        size.width * 0.9691110,
        size.height * 0.4075330,
        size.width * 0.9571300,
        size.height * 0.4286920,
        size.width * 0.9410970,
        size.height * 0.4570057);
    path_2.lineTo(size.width * 0.9579160, size.height * 0.4693034);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff5465FF).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
