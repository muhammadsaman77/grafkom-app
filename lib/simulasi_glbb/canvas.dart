import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class DCanvas extends CustomPainter {
  late double x, y, diamater, kecepatan;
  DCanvas(
      {required this.x,
      required this.y,
      required this.diamater,
      required this.kecepatan});

  void drawCircle(int xCenter, int yCenter, int radius, Paint color,
      Paint color2, Canvas canvas, double angle) {
    int x = 0;
    int y = radius;
    int p = 1 - radius;

    while (x < y) {
      x++;
      if (p <= 0) {
        p += 2 * x + 1;
      } else {
        y--;
        p += 2 * (x - y) + 1;
      }
      circleDesignPoints(xCenter, yCenter, x, y, color, color2, canvas, angle);
    }
  }

  void circleDesignPoints(int xCenter, int yCenter, int x, int y, Paint paint1,
      Paint paint2, Canvas canvas, double angle) {
    Matrix4 matrix = Matrix4.identity();
    matrix.translate(xCenter.toDouble(), yCenter.toDouble());
    matrix.rotateZ(angle);
    matrix.translate(-xCenter.toDouble(), -yCenter.toDouble());

    Path path1 = Path();
    path1.addOval(Rect.fromCircle(
        center: Offset(xCenter.toDouble() + x, yCenter.toDouble() + y),
        radius: 1));
    path1 = path1.transform(matrix.storage);
    setPoints(path1.getBounds().center.dx.round(),
        path1.getBounds().center.dy.round(), paint2, canvas);

    Path path2 = Path();
    path2.addOval(Rect.fromCircle(
        center: Offset(xCenter.toDouble() + x, yCenter.toDouble() - y),
        radius: 1));
    path2 = path2.transform(matrix.storage);
    setPoints(path2.getBounds().center.dx.round(),
        path2.getBounds().center.dy.round(), paint1, canvas);

    Path path3 = Path();
    path3.addOval(Rect.fromCircle(
        center: Offset(xCenter.toDouble() - x, yCenter.toDouble() + y),
        radius: 1));
    path3 = path3.transform(matrix.storage);
    setPoints(path3.getBounds().center.dx.round(),
        path3.getBounds().center.dy.round(), paint1, canvas);

    Path path4 = Path();
    path4.addOval(Rect.fromCircle(
        center: Offset(xCenter.toDouble() - x, yCenter.toDouble() - y),
        radius: 1));
    path4 = path4.transform(matrix.storage);
    setPoints(path4.getBounds().center.dx.round(),
        path4.getBounds().center.dy.round(), paint2, canvas);

    Path path5 = Path();
    path5.addOval(Rect.fromCircle(
        center: Offset(xCenter.toDouble() + y, yCenter.toDouble() + x),
        radius: 1));
    path5 = path5.transform(matrix.storage);
    setPoints(path5.getBounds().center.dx.round(),
        path5.getBounds().center.dy.round(), paint1, canvas);

    Path path6 = Path();
    path6.addOval(Rect.fromCircle(
        center: Offset(xCenter.toDouble() + y, yCenter.toDouble() - x),
        radius: 1));
    path6 = path6.transform(matrix.storage);
    setPoints(path6.getBounds().center.dx.round(),
        path6.getBounds().center.dy.round(), paint2, canvas);

    Path path7 = Path();
    path7.addOval(Rect.fromCircle(
        center: Offset(xCenter.toDouble() - y, yCenter.toDouble() + x),
        radius: 1));
    path7 = path7.transform(matrix.storage);
    setPoints(path7.getBounds().center.dx.round(),
        path7.getBounds().center.dy.round(), paint2, canvas);

    Path path8 = Path();
    path8.addOval(Rect.fromCircle(
        center: Offset(xCenter.toDouble() - y, yCenter.toDouble() - x),
        radius: 1));
    path8 = path8.transform(matrix.storage);
    setPoints(path8.getBounds().center.dx.round(),
        path8.getBounds().center.dy.round(), paint1, canvas);
  }

  void setPoints(int x, int y, Paint paint, Canvas canvas) {
    try {
      canvas.drawPoints(
          PointMode.points, [Offset(x.toDouble(), y.toDouble())], paint);
    } catch (e) {
      // do nothing
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final black = Paint()
      ..color = Colors.black
      ..strokeWidth = 3 * y / 480 + 2
      ..style = PaintingStyle.stroke;
    final red = Paint()
      ..color = Colors.red
      ..strokeWidth = 3 * y / 480 + 2
      ..style = PaintingStyle.stroke;

    drawCircle(x.round(), y.round(), ((diamater / 2 * y / 480) + 20).round(),
        black, red, canvas, x * (2 * pi / 640).abs());
  }

  @override
  bool shouldRepaint(DCanvas oldDelegate) => false;
}
