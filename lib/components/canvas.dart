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
    //sumbu y
    canvas.drawLine(Offset(width / 2, 0), Offset(width / 2, height), black);
    //sumbu x
    canvas.drawLine(Offset(0, height / 2), Offset(width, height / 2), black);

    Path path = Path();
    path.moveTo(width / 2 - titikFokus, 0);
    path.quadraticBezierTo(
        width / 2 + titikFokus, height / 2, width / 2 - titikFokus, height);
    canvas.drawPath(path, lightGreen);

    //benda
    canvas.drawLine(
        Offset(width / 2 - jarakBenda, height / 2 - ukuranBenda),
        Offset(width / 2 - jarakBenda + (1 / 6 * (ukuranBenda)), height / 2),
        blue);
    canvas.drawLine(
        Offset(width / 2 - jarakBenda, height / 2 - ukuranBenda),
        Offset(width / 2 - jarakBenda - (1 / 6 * (ukuranBenda)), height / 2),
        blue);
    canvas.drawLine(
        Offset(width / 2 - jarakBenda - (1 / 4 * (ukuranBenda)),
            height / 2 - ukuranBenda + (1 / 3 * (ukuranBenda))),
        Offset(width / 2 - jarakBenda + (1 / 6 * (ukuranBenda)), height / 2),
        blue);
    canvas.drawLine(
        Offset(width / 2 - jarakBenda + (1 / 4 * (ukuranBenda)),
            height / 2 - ukuranBenda + (1 / 3 * (ukuranBenda))),
        Offset(width / 2 - jarakBenda - (1 / 6 * (ukuranBenda)), height / 2),
        blue);
    canvas.drawLine(
        Offset(width / 2 - jarakBenda + (1 / 4 * (ukuranBenda)),
            height / 2 - ukuranBenda + (1 / 3 * (ukuranBenda))),
        Offset(width / 2 - jarakBenda - (1 / 4 * (ukuranBenda)),
            height / 2 - ukuranBenda + (1 / 3 * (ukuranBenda))),
        blue);
    if (jarakBenda != titikFokus) {
      //bayangan
      canvas.drawLine(
          Offset(width / 2 - jarakBayangan(jarakBenda, titikFokus),
              height / 2 + ukuranBayangan(ukuranBenda, jarakBenda, titikFokus)),
          Offset(
              width / 2 -
                  jarakBayangan(jarakBenda, titikFokus) +
                  (1 / 6 * ukuranBayangan(ukuranBenda, jarakBenda, titikFokus)),
              height / 2),
          green);
      canvas.drawLine(
          Offset(width / 2 - jarakBayangan(jarakBenda, titikFokus),
              height / 2 + ukuranBayangan(ukuranBenda, jarakBenda, titikFokus)),
          Offset(
              width / 2 -
                  jarakBayangan(jarakBenda, titikFokus) -
                  (1 / 6 * ukuranBayangan(ukuranBenda, jarakBenda, titikFokus)),
              height / 2),
          green);
      canvas.drawLine(
          Offset(
              width / 2 -
                  jarakBayangan(jarakBenda, titikFokus) -
                  (1 / 4 * ukuranBayangan(ukuranBenda, jarakBenda, titikFokus)),
              height / 2 +
                  ukuranBayangan(ukuranBenda, jarakBenda, titikFokus) -
                  (1 /
                      3 *
                      (ukuranBayangan(ukuranBenda, jarakBenda, titikFokus)))),
          Offset(
              width / 2 -
                  jarakBayangan(jarakBenda, titikFokus) +
                  (1 / 6 * ukuranBayangan(ukuranBenda, jarakBenda, titikFokus)),
              height / 2),
          green);
      canvas.drawLine(
          Offset(
              width / 2 -
                  jarakBayangan(jarakBenda, titikFokus) +
                  (1 / 4 * ukuranBayangan(ukuranBenda, jarakBenda, titikFokus)),
              height / 2 +
                  ukuranBayangan(ukuranBenda, jarakBenda, titikFokus) -
                  (1 /
                      3 *
                      (ukuranBayangan(ukuranBenda, jarakBenda, titikFokus)))),
          Offset(
              width / 2 -
                  jarakBayangan(jarakBenda, titikFokus) -
                  (1 / 6 * ukuranBayangan(ukuranBenda, jarakBenda, titikFokus)),
              height / 2),
          green);
      canvas.drawLine(
          Offset(
              width / 2 -
                  jarakBayangan(jarakBenda, titikFokus) +
                  (1 / 4 * ukuranBayangan(ukuranBenda, jarakBenda, titikFokus)),
              height / 2 +
                  ukuranBayangan(ukuranBenda, jarakBenda, titikFokus) -
                  (1 /
                      3 *
                      (ukuranBayangan(ukuranBenda, jarakBenda, titikFokus)))),
          Offset(
              width / 2 -
                  jarakBayangan(jarakBenda, titikFokus) -
                  (1 / 4 * ukuranBayangan(ukuranBenda, jarakBenda, titikFokus)),
              height / 2 +
                  ukuranBayangan(ukuranBenda, jarakBenda, titikFokus) -
                  (1 /
                      3 *
                      (ukuranBayangan(ukuranBenda, jarakBenda, titikFokus)))),
          green);

      // sinar pantul
      drawlineSinarPantul(
          canvas,
          width / 2,
          height / 2 - ukuranBenda,
          width / 2 - jarakBayangan(jarakBenda, titikFokus),
          height / 2 + ukuranBayangan(ukuranBenda, jarakBenda, titikFokus),
          purple);
      drawLine(
          canvas,
          width / 2 - jarakBayangan(jarakBenda, titikFokus),
          height / 2 + ukuranBayangan(ukuranBenda, jarakBenda, titikFokus),
          width / 2,
          height / 2 + ukuranBayangan(ukuranBenda, jarakBenda, titikFokus),
          purple);
      // sinar datang
      drawLine(
        canvas,
        width / 2 - jarakBenda,
        height / 2 - ukuranBenda,
        width / 2,
        height / 2 + ukuranBayangan(ukuranBenda, jarakBenda, titikFokus),
        red,
      );

      drawLine(
        canvas,
        width / 2 - jarakBenda,
        height / 2 - ukuranBenda,
        width / 2,
        height / 2 - ukuranBenda,
        red,
      );
    } else {
      // sinar datang
      drawLine(
        canvas,
        width / 2 - jarakBenda,
        height / 2 - ukuranBenda,
        width / 2 - jarakBenda,
        height / 2,
        red,
      );

      drawLine(
        canvas,
        width / 2 - jarakBenda,
        height / 2 - ukuranBenda,
        width / 2,
        height / 2 - ukuranBenda,
        red,
      );
    }

    canvas.drawParagraph(
        _buildParagraph(
            'r', const TextStyle(fontSize: 14, color: Colors.lightGreen)),
        Offset(width / 2 - titikFokus * 2, height / 2));

    canvas.drawParagraph(
        _buildParagraph(
            'f', const TextStyle(fontSize: 14, color: Colors.orange)),
        Offset(width / 2 - titikFokus, height / 2));
    canvas.drawParagraph(
        _buildParagraph(
            'Area I', const TextStyle(fontSize: 12, color: Colors.black)),
        Offset(width / 2 - (1 / 2 * titikFokus) - 10, height / 2 + 15));
    canvas.drawParagraph(
        _buildParagraph(
            'Area II', const TextStyle(fontSize: 12, color: Colors.black)),
        Offset(width / 2 - (1 / 2 * titikFokus) - titikFokus - 10,
            height / 2 + 15));
    canvas.drawParagraph(
        _buildParagraph(
            'Area III', const TextStyle(fontSize: 12, color: Colors.black)),
        Offset(width / 2 - (1 / 2 * titikFokus) - titikFokus * 2 - 10,
            height / 2 + 15));
  }

  @override
  bool shouldRepaint(DCanvas oldDelegate) => false;
}
