import 'dart:math';

import 'package:flutter/material.dart';

class DCanvas extends CustomPainter {
  late double x, y, diamater;
  DCanvas({required this.x, required this.y, required this.diamater});

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
    Path path1 = createPath(xCenter, yCenter, x, y, angle);
    canvas.drawPath(path1, paint2);

    Path path2 = createPath(xCenter, yCenter, x, -y, angle);
    canvas.drawPath(path2, paint1);

    Path path3 = createPath(xCenter, yCenter, -x, y, angle);
    canvas.drawPath(path3, paint1);

    Path path4 = createPath(xCenter, yCenter, -x, -y, angle);
    canvas.drawPath(path4, paint2);

    Path path5 = createPath(xCenter, yCenter, y, x, angle);
    canvas.drawPath(path5, paint1);

    Path path6 = createPath(xCenter, yCenter, y, -x, angle);
    canvas.drawPath(path6, paint2);

    Path path7 = createPath(xCenter, yCenter, -y, x, angle);
    canvas.drawPath(path7, paint2);

    Path path8 = createPath(xCenter, yCenter, -y, -x, angle);
    canvas.drawPath(path8, paint1);
  }

  Path createPath(int xCenter, int yCenter, int x, int y, double angle) {
    Path path = Path();

    // Menghitung koordinat titik awal setelah rotasi
    double rotatedX = x * cos(angle) - y * sin(angle);
    double rotatedY = x * sin(angle) + y * cos(angle);

    // Menghitung koordinat titik akhir setelah rotasi
    double endX = xCenter + rotatedX;
    double endY = yCenter + rotatedY;

    // Menambahkan titik awal dan titik akhir ke dalam path
    path.moveTo(xCenter.toDouble(), yCenter.toDouble());
    path.arcToPoint(Offset(endX, endY), radius: const Radius.circular(1));
    path.close();

    return path;
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

    drawCircle(x.round(), y.round(), ((diamater / 2 * y / 485) + 20).round(),
        black, red, canvas, x * (2 * pi / 640).abs());
  }

  @override
  bool shouldRepaint(DCanvas oldDelegate) => false;
}
