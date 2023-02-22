import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyWidget());
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Container(
            color: Colors.white,
            // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              color: Colors.amber,
              height: height,
              width: width,
              child: CustomPaint(painter: FaceOutLinePainter()),
            )),
      ),
    );
  }
}

class FaceOutLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.indigo;

    double height = 700.0;
    double width = 400;
    canvas.drawRect(Rect.fromLTWH(20, 40, 100, 100), paint);
    canvas.drawLine(Offset(0, 50), Offset(200, 50), paint);
    canvas.drawLine(Offset(0, 100), Offset(200, 100), paint);
  }

  @override
  bool shouldRepaint(FaceOutLinePainter oldDelegate) => false;
}
