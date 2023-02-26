import 'package:flutter/material.dart';
import 'dart:math';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: MyWidget()),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: CustomPaint(
        painter: CanvasGraph(size.height, size.width, -188, 116, 282),
      ),
    );
  }
}

class CanvasGraph extends CustomPainter {
  late double height, width, tinggiBenda, jarakBenda, titikFokus;
  CanvasGraph(double height, double width, double titikFokus,
      double tinggiBenda, double jarakBenda) {
    this.height = height;
    this.width = width;
    this.tinggiBenda = tinggiBenda;
    this.jarakBenda = jarakBenda;
    this.titikFokus = titikFokus;
  }
  double jarakBayangan() {
    return (this.jarakBenda * this.titikFokus) /
        (this.jarakBenda - this.titikFokus);
  }

  double tinggiBayangan() {
    return jarakBayangan() * this.tinggiBenda / this.jarakBenda;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final paint2 = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final paint3 = Paint()
      ..color = Colors.green
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final paint4 = Paint()
      ..color = Colors.red
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final paint5 = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    double height = this.height;
    double width = this.width;
    //sumbu y
    canvas.drawLine(Offset(width / 2, 0), Offset(width / 2, height), paint1);
    //sumbu x
    canvas.drawLine(Offset(0, height / 2), Offset(width, height / 2), paint1);
    //benda
    canvas.drawLine(Offset(width / 2 - jarakBenda, height / 2),
        Offset(width / 2 - jarakBenda, height / 2 - tinggiBenda), paint2);
    //bayangan
    canvas.drawLine(
        Offset(width / 2 - jarakBayangan(), height / 2),
        Offset(width / 2 - jarakBayangan(), height / 2 + tinggiBayangan()),
        paint3);
    // sinar pantul
    canvas.drawLine(
        Offset(width / 2, height / 2 - this.tinggiBenda),
        Offset(width / 2 - jarakBayangan(), height / 2 + tinggiBayangan()),
        paint5);
    canvas.drawLine(
        Offset(width / 2, height / 2 + tinggiBayangan()),
        Offset(width / 2 - jarakBayangan(), height / 2 + tinggiBayangan()),
        paint5);
    // sinar datang
    canvas.drawLine(Offset(width / 2 - jarakBenda, height / 2 - tinggiBenda),
        Offset(width / 2, height / 2 + tinggiBayangan()), paint4);
    canvas.drawLine(Offset(width / 2, height / 2 - tinggiBenda),
        Offset(width / 2 - jarakBenda, height / 2 - tinggiBenda), paint4);
  }

  @override
  bool shouldRepaint(CanvasGraph oldDelegate) => false;
}
