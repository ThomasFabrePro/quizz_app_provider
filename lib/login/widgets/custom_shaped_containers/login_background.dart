import 'package:flutter/material.dart';
import 'package:quizz_app_provider/common/theme.dart';

class LoginBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = ThemeConfig.secondaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * -0.0008333);
    path_0.lineTo(size.width, size.height * -0.0008333);
    path_0.lineTo(size.width * 1.0012500, size.height * 0.3336134);
    path_0.quadraticBezierTo(size.width * 0.4103750, size.height * 0.2580250,
        size.width * 0.6287500, size.height * 0.3335000);
    path_0.cubicTo(
        size.width * 1.0331250,
        size.height * 0.2082083,
        size.width * 0.3980250,
        size.height * 0.2427000,
        size.width * 0.3747125,
        size.height * 0.3002750);
    path_0.quadraticBezierTo(size.width * 0.1900625, size.height * 0.2682000,
        size.width * 0.0012500, size.height * 0.3350000);

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
