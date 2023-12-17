import 'package:flutter/material.dart';

class DefaultBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 58, 11, 122)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 1.0020750, size.height * 0.0002750);
    path_0.lineTo(size.width, size.height * 0.3335417);
    path_0.lineTo(size.width * 0.6875000, size.height * 0.0002083);

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(0, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);

    // Layer 2

    Paint paint_fill_1 = Paint()
      ..color = const Color.fromARGB(255, 67, 12, 129)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.3125000, size.height * 0.0008333);
    path_1.lineTo(size.width * 1.0025000, size.height * 0.7491667);
    path_1.lineTo(size.width * 1.0025000, size.height * 1.0008333);
    path_1.lineTo(size.width * 0.8175000, size.height * 1.0008333);
    path_1.lineTo(0, size.height * 0.0008333);

    canvas.drawPath(path_1, paint_fill_1);

    // Layer 2

    Paint paint_stroke_1 = Paint()
      ..color = const Color.fromARGB(0, 255, 255, 255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_1, paint_stroke_1);

    // Layer 3

    Paint paint_fill_2 = Paint()
      ..color = const Color.fromARGB(255, 58, 11, 122)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_2 = Path();
    path_2.moveTo(size.width * -0.0029250, size.height * 1.0019417);
    path_2.lineTo(0, size.height * 0.5418750);
    path_2.lineTo(size.width * 0.3750000, size.height * 1.0018750);

    canvas.drawPath(path_2, paint_fill_2);

    // Layer 1

    Paint paint_stroke_2 = Paint()
      ..color = const Color.fromARGB(0, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_2, paint_stroke_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
