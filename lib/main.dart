import 'package:flutter/material.dart';

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
        painter: CanvasGraph(size.height, size.width),
      ),
    );
  }
}

class CanvasGraph extends CustomPainter {
  late double height,
      width,
      tinggiBenda,
      jarakBenda,
      tinggiBayangan,
      jarakBayangan;
  CanvasGraph(double height, double width) {
    this.height = height;
    this.width = width;
    this.tinggiBenda = 100;
    this.jarakBenda = 20;
    this.tinggiBayangan = 70;
    this.jarakBayangan = 90;
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
    double height = this.height;
    double width = this.width;
    canvas.drawLine(Offset(width / 2, 0), Offset(width / 2, height), paint1);
    canvas.drawLine(Offset(0, height / 2), Offset(width, height / 2), paint1);
    canvas.drawLine(Offset(jarakBenda, height / 2),
        Offset(jarakBenda, height / 2 - tinggiBenda), paint2);
    canvas.drawLine(Offset(jarakBayangan, height / 2),
        Offset(jarakBayangan, height / 2 + tinggiBayangan), paint3);
    canvas.drawLine(Offset(jarakBenda, height / 2 - tinggiBenda),
        Offset(width / 2, height / 2 + tinggiBayangan), paint4);
    canvas.drawLine(Offset(width / 2, height / 2 - tinggiBenda),
        Offset(jarakBenda, height / 2 - tinggiBenda), paint4);
  }

  @override
  bool shouldRepaint(CanvasGraph oldDelegate) => false;
}
