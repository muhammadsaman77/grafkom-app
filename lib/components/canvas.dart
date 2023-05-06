import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class DCanvas extends CustomPainter {
  late double height, width, ukuranBenda, jarakBenda, titikFokus;
  // double DjarakBayangan = 0;
  DCanvas(
      {required this.height,
      required this.width,
      required this.titikFokus,
      required this.ukuranBenda,
      required this.jarakBenda}) {
    // this.jarakBayangan = 0;
  }
  static double jarakBayangan(jarakBenda, titikFokus) {
    return (jarakBenda * titikFokus) / (jarakBenda - titikFokus);
  }

  static double ukuranBayangan(ukuranBenda, jarakBenda, titikFokus) {
    return jarakBayangan(jarakBenda, titikFokus) * ukuranBenda / jarakBenda;
  }

  void drawLine(
      Canvas canvas, double x1, double y1, double x2, double y2, Paint paint) {
    double dx = x2 - x1;
    double dy = y2 - y1;
    double length = max(dx.abs(), dy.abs());
    dx /= length;
    dy /= length;

    double x = x1;
    double y = y1;
    double b = y1;
    double a = x1;

    for (int i = 0; i <= length.toInt(); i++) {
      canvas.drawPoints(PointMode.points, [Offset(x, y)], paint);
      x += dx;
      y += dy;
    }

    while (a.round() >= 0 &&
        b.round() <= height &&
        b.round() >= 0 &&
        a.round() <= width) {
      canvas.drawPoints(PointMode.points, [Offset(a, b)], paint);
      a -= dx;
      b -= dy;
    }
  }

  void drawlineSinarPantul(
      Canvas canvas, double x1, double y1, double x2, double y2, Paint paint) {
    double dx = x2 - x1;
    double dy = y2 - y1;
    double length = max(dx.abs(), dy.abs());
    dx /= length;
    dy /= length;

    double x = x1;
    double y = y1;

    while (x.round() >= 0 &&
        y.round() <= height &&
        y.round() >= 0 &&
        x.round() <= width) {
      canvas.drawPoints(PointMode.points, [Offset(x, y)], paint);
      x += dx;
      y += dy;
    }
  }

  void drawLineSinarPantul2(
      Canvas canvas, double x1, double y1, double x2, double y2, Paint paint) {
    double dx = x2 - x1;
    double dy = y2 - y1;
    double length = max(dx.abs(), dy.abs());
    dx /= length;
    dy /= length;

    double x = x1;
    double y = y1;

    while (x.round() >= 0 &&
        y.round() <= height &&
        y.round() >= 0 &&
        x.round() <= width) {
      canvas.drawPoints(PointMode.points, [Offset(x, y)], paint);
      x -= dx;
      y -= dy;
    }
  }

  Paragraph _buildParagraph(String text, TextStyle style) {
    final paragraphBuilder = ParagraphBuilder(
      ParagraphStyle(
        textAlign: TextAlign.left,
        fontSize: style.fontSize!,
        fontFamily: style.fontFamily,
        fontStyle: style.fontStyle,
        fontWeight: style.fontWeight,
        height: style.height,
      ),
    );

    paragraphBuilder.pushStyle(style.getTextStyle());
    paragraphBuilder.addText(text);

    final paragraph = paragraphBuilder.build();
    paragraph.layout(const ParagraphConstraints(width: 300));

    return paragraph;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final black = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final blue = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final green = Paint()
      ..color = Colors.green
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final red = Paint()
      ..color = Colors.red
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final purple = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final lightGreen = Paint()
      ..color = Colors.lightGreen
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    double height = this.height;
    double width = this.width;
    int ssa = 8;
    int ground = 600;
    int balPos = 0;
    int balDia = 100;
    double balRad = balDia * ssa / 2;
    int balFlo = ground;
    int axis = 15;
    int x1 = 100;
    int y1 = 100;
    int x2 = 100;
    int y2 = 700;
    int x3 = 700;
    int y3 = 700;
    int x4 = 700;
    int y4 = 100;
    int x5 = 400;
    int y5 = 400;
    int skel = 0;
    int bulatkan(double desimal) {
      return (0.5 + desimal).toInt();
    }

    double radians(int degree) {
      return degree * pi / 180;
    }

    void rotet() {
      double v1 = balRad +
          (x1 - balRad) * cos(radians(axis)) -
          (y1 - balRad) * sin(radians(axis));
      double w1 = balRad +
          (x1 - balRad) * sin(radians(axis)) +
          (y1 - balRad) * cos(radians(axis));
      double v2 = balRad +
          (x2 - balRad) * cos(radians(axis)) -
          (y2 - balRad) * sin(radians(axis));
      double w2 = balRad +
          (x2 - balRad) * sin(radians(axis)) +
          (y2 - balRad) * cos(radians(axis));
      double v3 = balRad +
          (x3 - balRad) * cos(radians(axis)) -
          (y3 - balRad) * sin(radians(axis));
      double w3 = balRad +
          (x3 - balRad) * sin(radians(axis)) +
          (y3 - balRad) * cos(radians(axis));
      double v4 = balRad +
          (x4 - balRad) * cos(radians(axis)) -
          (y4 - balRad) * sin(radians(axis));
      double w4 = balRad +
          (x4 - balRad) * sin(radians(axis)) +
          (y4 - balRad) * cos(radians(axis));
      x1 = bulatkan(v1);
      y1 = bulatkan(w1);
      x2 = bulatkan(v2);
      y2 = bulatkan(w2);
      x3 = bulatkan(v3);
      y3 = bulatkan(w3);
      x4 = bulatkan(v4);
      y4 = bulatkan(w4);
    }

    void setRGB(int x, int y, Paint color, Canvas canvas) {
      try {
        canvas.drawPoints(
            PointMode.points, [Offset(x.toDouble(), y.toDouble())], color);
      } catch (e) {}
    }

    void circlePlotPoints(
        int xCenter, int yCenter, int x, int y, Paint color, Canvas canvas) {
      setRGB(xCenter + x, yCenter + y, color, canvas);
      setRGB(xCenter - x, yCenter + y, color, canvas);
      setRGB(xCenter + x, yCenter - y, color, canvas);
      setRGB(xCenter - x, yCenter - y, color, canvas);

      setRGB(xCenter + y, yCenter + x, color, canvas);
      setRGB(xCenter - y, yCenter + x, color, canvas);

      setRGB(xCenter + y, yCenter - x, color, canvas);
      setRGB(xCenter - y, yCenter - x, color, canvas);
    }

    void drawBufferedCircle(
        int xCenter, int yCenter, int radius, Paint color, Canvas canvas) {
      int x = 0;
      int y = radius;
      int p = 1 - radius;
      circlePlotPoints(xCenter, yCenter, x, y, color, canvas);
      while (x < y) {
        x++;
        if (p <= 0) {
          p += 2 * x + 1;
        } else {
          y--;
          p += 2 * (x - y) + 1;
        }
        circlePlotPoints(xCenter, yCenter, x, y, color, canvas);
      }
      if (0 == radius) return;
      drawBufferedCircle(xCenter, yCenter, radius - 1, color, canvas);
    }

    void drawBufferedLine(
        int x0, int y0, int xn, int yn, Paint color, Canvas canvas) {
      double dx = (xn - x0).abs().toDouble();
      double dy = (yn - y0).abs().toDouble();
      double dt = dx > dy ? dx : dy;

      double xt = dx / dt;
      double yt = dy / dt;

      double xc = x0.toDouble();
      double yc = y0.toDouble();

      while ((xn <= xc) && (yn <= yc)) {
        try {
          setRGB(xc.round(), yc.round(), color, canvas);
        } catch (ArrayIndexOutOfBoundsException) {}
        xc -= xt;
        yc -= yt;
      }
      while ((xc <= xn) && (yc <= yn)) {
        try {
          setRGB(xc.round(), yc.round(), color, canvas);
        } catch (ArrayIndexOutOfBoundsException) {}
        xc += xt;
        yc += yt;
      }
      while ((xn <= xc) && (yc <= yn)) {
        try {
          setRGB(xc.round(), yc.round(), color, canvas);
        } catch (ArrayIndexOutOfBoundsException) {}
        xc -= xt;
        yc += yt;
      }
      while ((xc <= xn) && (yn <= yc)) {
        try {
          setRGB(xc.round(), yc.round(), color, canvas);
        } catch (ArrayIndexOutOfBoundsException) {}
        xc += xt;
        yc -= yt;
      }
    }

    // drawBufferedCircle(x5, y5, balRad, black, canvas);
/* 186 */ drawBufferedLine(x1, y1, x3, y3, blue, canvas);
/* 187 */ drawBufferedLine(x1 + 1, y1 + 1, x3 + 1, y3 + 1, blue, canvas);
/* 188 */ drawBufferedLine(x1 - 1, y1 - 1, x3 - 1, y3 - 1, blue, canvas);
/* 189 */ drawBufferedLine(x1 + 1, y1 - 1, x3 + 1, y3 - 1, blue, canvas);
/* 190 */ drawBufferedLine(x1 - 1, y1 + 1, x3 - 1, y3 + 1, blue, canvas);
/* 191 */ drawBufferedLine(x1 + 2, y1 + 2, x3 + 2, y3 + 2, blue, canvas);
/* 192 */ drawBufferedLine(x1 - 2, y1 - 2, x3 - 2, y3 - 2, blue, canvas);
/* 193 */ drawBufferedLine(x1 + 2, y1 - 2, x3 + 2, y3 - 2, blue, canvas);
/* 194 */ drawBufferedLine(x1 - 2, y1 + 2, x3 - 2, y3 + 2, blue, canvas);
/* 195 */ drawBufferedLine(x1 + 3, y1 + 3, x3 + 3, y3 + 3, blue, canvas);
/* 196 */ drawBufferedLine(x1 - 3, y1 - 3, x3 - 3, y3 - 3, blue, canvas);
/* 197 */ drawBufferedLine(x1 + 3, y1 - 3, x3 + 3, y3 - 3, blue, canvas);
/* 198 */ drawBufferedLine(x1 - 3, y1 + 3, x3 - 3, y3 + 3, blue, canvas);
/* 199 */ drawBufferedLine(x2, y2, x4, y4, red, canvas);
/* 200 */ drawBufferedLine(x2 + 1, y2 + 1, x4 + 1, y4 + 1, red, canvas);
/* 201 */ drawBufferedLine(x2 - 1, y2 - 1, x4 - 1, y4 - 1, red, canvas);
/* 202 */ drawBufferedLine(x2 + 1, y2 - 1, x4 + 1, y4 - 1, red, canvas);
/* 203 */ drawBufferedLine(x2 - 1, y2 + 1, x4 - 1, y4 + 1, red, canvas);
/* 204 */ drawBufferedLine(x2 + 2, y2 + 2, x4 + 2, y4 + 2, red, canvas);
/* 205 */ drawBufferedLine(x2 - 2, y2 - 2, x4 - 2, y4 - 2, red, canvas);
/* 206 */ drawBufferedLine(x2 + 2, y2 - 2, x4 + 2, y4 - 2, red, canvas);
/* 207 */ drawBufferedLine(x2 - 2, y2 + 2, x4 - 2, y4 + 2, red, canvas);
/* 208 */ drawBufferedLine(x2 + 3, y2 + 3, x4 + 3, y4 + 3, red, canvas);
/* 209 */ drawBufferedLine(x2 - 3, y2 - 3, x4 - 3, y4 - 3, red, canvas);
/* 210 */ drawBufferedLine(x2 + 3, y2 - 3, x4 + 3, y4 - 3, red, canvas);
/* 211 */ drawBufferedLine(x2 - 3, y2 + 3, x4 - 3, y4 + 3, red, canvas);
    canvas.drawOval(
        Rect.fromLTWH(
          balPos + skel / 20,
          balFlo - balDia + skel / 10,
          balDia - skel / 10,
          balDia - skel / 10,
        ),
        black);

    final radius = min(100, 100) / 2;
    canvas.drawCircle(Offset(100 / 2, height - 100 / 2), radius, black);
  }

  @override
  bool shouldRepaint(DCanvas oldDelegate) => false;
}
