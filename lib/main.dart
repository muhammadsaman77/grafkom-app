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
  late double height, width;
  CanvasGraph(double height, double width) {
    this.height = height;
    this.width = width;
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
    double height = this.height;
    double width = this.width;
    canvas.drawLine(Offset(width / 2, 0), Offset(width / 2, height), paint1);
    canvas.drawLine(Offset(0, height / 2), Offset(width, height / 2), paint1);
    canvas.drawLine(
        Offset(40, height / 2), Offset(40, height / 2 - 50), paint2);
    canvas.drawLine(Offset(width - 80, height / 2),
        Offset(width - 80, height / 2 + 100), paint3);
  }

  @override
  bool shouldRepaint(CanvasGraph oldDelegate) => false;
}
