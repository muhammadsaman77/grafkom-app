import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class DCanvas extends CustomPainter {
  late double x, y, x2, y2, diameterBola;
  DCanvas(
      {required this.x,
      required this.y,
      required this.x2,
      required this.y2,
      required this.diameterBola});

  static double fx2(x, y) {
    return x * (y / 480) + 10;
  }

  static double fy2(y, diameterBola) {
    return (y - ((diameterBola * y / 480) / 2)) + 10;
  }

  void drawLine(
      Canvas canvas, double x1, double y1, double x2, double y2, Paint paint) {
    double dx = (x2 - x1);
    double dy = (y2 - y1);
    double length = max(dx.abs(), dy.abs());
    dx /= length;
    dy /= length;
    double x = x1;
    double y = y1;

    for (int i = 0; i < (diameterBola / 2 * y / 485) + 10; i++) {
      canvas.drawPoints(PointMode.points, [Offset(x, y)], paint);
      x += dx;
      y += dy;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final black = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final red = Paint()
      ..color = Colors.red
      ..strokeWidth = 3 * y / 480 + 2
      ..style = PaintingStyle.stroke;
    final orange = Paint()
      ..color = Colors.orangeAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(x, y), (diameterBola / 2 * y / 485) + 10, black);
    drawLine(canvas, x, y, x2, y2, black);
    canvas.drawPoints(PointMode.points, [Offset(x, y)], red);
  }

  @override
  bool shouldRepaint(DCanvas oldDelegate) => false;
}
