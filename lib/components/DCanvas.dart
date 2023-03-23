import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class DCanvas extends CustomPainter {
  late double height, width, tinggiBenda, jarakBenda, titikFokus;
  // double DjarakBayangan = 0;
  DCanvas(
      {required double height,
      required double width,
      required double titikFokus,
      required double tinggiBenda,
      required double jarakBenda}) {
    this.height = height;
    this.width = width;
    this.tinggiBenda = tinggiBenda;
    this.jarakBenda = jarakBenda;
    this.titikFokus = titikFokus;
    // this.jarakBayangan = 0;
  }
  static double jarakBayangan(jarakBenda, titikFokus) {
    return (jarakBenda * titikFokus) / (jarakBenda - titikFokus);
  }

  static double tinggiBayangan(tinggiBenda, jarakBenda, titikFokus) {
    return jarakBayangan(jarakBenda, titikFokus) * tinggiBenda / jarakBenda;
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

    while (a.round() >= 0 && b.round() >= 0) {
      canvas.drawPoints(PointMode.points, [Offset(a, b)], paint);
      a -= dx;
      b -= dy;
    }
  }

  void drawLine_sinarPantul(
      Canvas canvas, double x1, double y1, double x2, double y2, Paint paint) {
    double dx = x2 - x1;
    double dy = y2 - y1;
    double length = max(dx.abs(), dy.abs());
    dx /= length;
    dy /= length;

    double x = x1;
    double y = y1;

    while (x.round() >= 0 && y.round() <= height) {
      canvas.drawPoints(PointMode.points, [Offset(x, y)], paint);
      x += dx;
      y += dy;
    }
  }

  void drawLine_sinarPantul2(
      Canvas canvas, double x1, double y1, double x2, double y2, Paint paint) {
    double dx = x2 - x1;
    double dy = y2 - y1;
    double length = max(dx.abs(), dy.abs());
    dx /= length;
    dy /= length;

    double x = x1;
    double y = y1;

    while (x.round() >= 0 && y.round() >= 0) {
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
    paragraph.layout(ParagraphConstraints(width: 300));

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
    double height = this.height;
    double width = this.width;
    //sumbu y
    canvas.drawLine(Offset(width / 2, 0), Offset(width / 2, height), black);
    //sumbu x
    canvas.drawLine(Offset(0, height / 2), Offset(width, height / 2), black);
    //benda
    canvas.drawLine(
        Offset(width / 2 - jarakBenda, height / 2 - tinggiBenda),
        Offset(width / 2 - jarakBenda + (1 / 6 * (tinggiBenda)), height / 2),
        blue);
    canvas.drawLine(
        Offset(width / 2 - jarakBenda, height / 2 - tinggiBenda),
        Offset(width / 2 - jarakBenda - (1 / 6 * (tinggiBenda)), height / 2),
        blue);
    canvas.drawLine(
        Offset(width / 2 - jarakBenda - (1 / 4 * (tinggiBenda)),
            height / 2 - tinggiBenda + (1 / 3 * (tinggiBenda))),
        Offset(width / 2 - jarakBenda + (1 / 6 * (tinggiBenda)), height / 2),
        blue);
    canvas.drawLine(
        Offset(width / 2 - jarakBenda + (1 / 4 * (tinggiBenda)),
            height / 2 - tinggiBenda + (1 / 3 * (tinggiBenda))),
        Offset(width / 2 - jarakBenda - (1 / 6 * (tinggiBenda)), height / 2),
        blue);
    canvas.drawLine(
        Offset(width / 2 - jarakBenda + (1 / 4 * (tinggiBenda)),
            height / 2 - tinggiBenda + (1 / 3 * (tinggiBenda))),
        Offset(width / 2 - jarakBenda - (1 / 4 * (tinggiBenda)),
            height / 2 - tinggiBenda + (1 / 3 * (tinggiBenda))),
        blue);
    //bayangan
    canvas.drawLine(
        Offset(width / 2 - jarakBayangan(jarakBenda, titikFokus),
            height / 2 + tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)),
        Offset(
            width / 2 -
                jarakBayangan(jarakBenda, titikFokus) +
                (1 / 6 * tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)),
            height / 2),
        green);
    canvas.drawLine(
        Offset(width / 2 - jarakBayangan(jarakBenda, titikFokus),
            height / 2 + tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)),
        Offset(
            width / 2 -
                jarakBayangan(jarakBenda, titikFokus) -
                (1 / 6 * tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)),
            height / 2),
        green);
    canvas.drawLine(
        Offset(
            width / 2 -
                jarakBayangan(jarakBenda, titikFokus) -
                (1 / 4 * tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)),
            height / 2 +
                tinggiBayangan(tinggiBenda, jarakBenda, titikFokus) -
                (1 /
                    3 *
                    (tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)))),
        Offset(
            width / 2 -
                jarakBayangan(jarakBenda, titikFokus) +
                (1 / 6 * tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)),
            height / 2),
        green);
    canvas.drawLine(
        Offset(
            width / 2 -
                jarakBayangan(jarakBenda, titikFokus) +
                (1 / 4 * tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)),
            height / 2 +
                tinggiBayangan(tinggiBenda, jarakBenda, titikFokus) -
                (1 /
                    3 *
                    (tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)))),
        Offset(
            width / 2 -
                jarakBayangan(jarakBenda, titikFokus) -
                (1 / 6 * tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)),
            height / 2),
        green);
    canvas.drawLine(
        Offset(
            width / 2 -
                jarakBayangan(jarakBenda, titikFokus) +
                (1 / 4 * tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)),
            height / 2 +
                tinggiBayangan(tinggiBenda, jarakBenda, titikFokus) -
                (1 /
                    3 *
                    (tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)))),
        Offset(
            width / 2 -
                jarakBayangan(jarakBenda, titikFokus) -
                (1 / 4 * tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)),
            height / 2 +
                tinggiBayangan(tinggiBenda, jarakBenda, titikFokus) -
                (1 /
                    3 *
                    (tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)))),
        green);

    // sinar pantul
    drawLine_sinarPantul(
        canvas,
        width / 2,
        height / 2 - tinggiBenda,
        width / 2 - jarakBayangan(jarakBenda, titikFokus),
        height / 2 + tinggiBayangan(tinggiBenda, jarakBenda, titikFokus),
        purple);
    drawLine(
        canvas,
        width / 2 - jarakBayangan(jarakBenda, titikFokus),
        height / 2 + tinggiBayangan(tinggiBenda, jarakBenda, titikFokus),
        width / 2,
        height / 2 + tinggiBayangan(tinggiBenda, jarakBenda, titikFokus),
        purple);
    // sinar datang
    drawLine(
      canvas,
      width / 2 - jarakBenda,
      height / 2 - tinggiBenda,
      width / 2,
      height / 2 + tinggiBayangan(tinggiBenda, jarakBenda, titikFokus),
      red,
    );

    drawLine(
      canvas,
      width / 2 - jarakBenda,
      height / 2 - tinggiBenda,
      width / 2,
      height / 2 - tinggiBenda,
      red,
    );

    canvas.drawParagraph(
        _buildParagraph(
            'r', const TextStyle(fontSize: 14, color: Colors.black)),
        Offset(width / 2 - titikFokus * 2, height / 2));
    canvas.drawParagraph(
        _buildParagraph(
            'r', const TextStyle(fontSize: 14, color: Colors.black)),
        Offset(width / 2 + titikFokus * 2, height / 2));
    canvas.drawParagraph(
        _buildParagraph(
            'f', const TextStyle(fontSize: 14, color: Colors.black)),
        Offset(width / 2 - titikFokus, height / 2));
    canvas.drawParagraph(
        _buildParagraph(
            'f', const TextStyle(fontSize: 14, color: Colors.black)),
        Offset(width / 2 + titikFokus, height / 2));
  }

  @override
  bool shouldRepaint(DCanvas oldDelegate) => false;
}
