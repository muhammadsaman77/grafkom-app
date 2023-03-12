import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: Stack(children: [InitGraph()])),
        floatingActionButton:
            FloatingActionButton(onPressed: () {}, child: Icon(Icons.edit)),
      ),
    );
  }
}

class InitGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: CustomPaint(
        painter: CanvasGraph(
            height: size.height,
            width: size.width,
            titikFokus: 188,
            tinggiBenda: 200,
            jarakBenda: 400),
      ),
    );
  }
}

class CanvasGraph extends CustomPainter {
  late double height, width, tinggiBenda, jarakBenda, titikFokus;
  CanvasGraph(
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
  }
  double jarakBayangan() {
    return (this.jarakBenda * this.titikFokus) /
        (this.jarakBenda - this.titikFokus);
  }

  double tinggiBayangan() {
    return this.jarakBayangan() * this.tinggiBenda / this.jarakBenda;
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
    // benda
    // canvas.drawLine(Offset(width / 2 - jarakBenda, height / 2),
    //     Offset(width / 2 - jarakBenda, height / 2 - tinggiBenda), blue);
    canvas.drawLine(
        Offset(width / 2 - jarakBenda, height / 2 - tinggiBenda),
        Offset(width / 2 - jarakBenda + (1 / 6 * (jarakBenda)), height / 2),
        blue);
    canvas.drawLine(
        Offset(width / 2 - jarakBenda, height / 2 - tinggiBenda),
        Offset(width / 2 - jarakBenda - (1 / 6 * (jarakBenda)), height / 2),
        blue);
    canvas.drawLine(
        Offset(width / 2 - jarakBenda - (1 / 4 * (jarakBenda)),
            height / 2 - tinggiBenda + (1 / 3 * (tinggiBenda))),
        Offset(width / 2 - jarakBenda + (1 / 6 * (jarakBenda)), height / 2),
        blue);
    canvas.drawLine(
        Offset(width / 2 - jarakBenda + (1 / 4 * (jarakBenda)),
            height / 2 - tinggiBenda + (1 / 3 * (tinggiBenda))),
        Offset(width / 2 - jarakBenda - (1 / 6 * (jarakBenda)), height / 2),
        blue);
    canvas.drawLine(
        Offset(width / 2 - jarakBenda + (1 / 4 * (jarakBenda)),
            height / 2 - tinggiBenda + (1 / 3 * (tinggiBenda))),
        Offset(width / 2 - jarakBenda - (1 / 4 * (jarakBenda)),
            height / 2 - tinggiBenda + (1 / 3 * (tinggiBenda))),
        blue);

    //bayangan
    // canvas.drawLine(
    //     Offset(width / 2 - jarakBayangan(), height / 2),
    //     Offset(width / 2 - jarakBayangan(), height / 2 + tinggiBayangan()),
    //     green);
    canvas.drawLine(
        Offset(width / 2 - jarakBayangan(), height / 2 + tinggiBayangan()),
        Offset(width / 2 - jarakBayangan() + (1 / 6 * (jarakBayangan())),
            height / 2),
        green);
    canvas.drawLine(
        Offset(width / 2 - jarakBayangan(), height / 2 + tinggiBayangan()),
        Offset(width / 2 - jarakBayangan() - (1 / 6 * (jarakBayangan())),
            height / 2),
        green);
    canvas.drawLine(
        Offset(width / 2 - jarakBayangan() - (1 / 4 * (jarakBayangan())),
            height / 2 + tinggiBayangan() - (1 / 3 * (tinggiBayangan()))),
        Offset(width / 2 - jarakBayangan() + (1 / 6 * (jarakBayangan())),
            height / 2),
        green);
    canvas.drawLine(
        Offset(width / 2 - jarakBayangan() + (1 / 4 * (jarakBayangan())),
            height / 2 + tinggiBayangan() - (1 / 3 * (tinggiBayangan()))),
        Offset(width / 2 - jarakBayangan() - (1 / 6 * (jarakBayangan())),
            height / 2),
        green);
    canvas.drawLine(
        Offset(width / 2 - jarakBayangan() + (1 / 4 * (jarakBayangan())),
            height / 2 + tinggiBayangan() - (1 / 3 * (tinggiBayangan()))),
        Offset(width / 2 - jarakBayangan() - (1 / 4 * (jarakBayangan())),
            height / 2 + tinggiBayangan() - (1 / 3 * (tinggiBayangan()))),
        green);
    // canvas.drawLine(
    //     Offset(width / 2 - jarakBayangan(), height / 2),
    //     Offset(width / 2 - jarakBayangan(), height / 2 + tinggiBayangan()),
    //     green);

    // sinar pantul
    canvas.drawLine(
        Offset(width / 2, height / 2 - this.tinggiBenda),
        Offset(width / 2 - jarakBayangan(), height / 2 + tinggiBayangan()),
        purple);
    canvas.drawLine(
        Offset(width / 2, height / 2 + tinggiBayangan()),
        Offset(width / 2 - jarakBayangan(), height / 2 + tinggiBayangan()),
        purple);
    // sinar datang
    canvas.drawLine(Offset(width / 2 - jarakBenda, height / 2 - tinggiBenda),
        Offset(width / 2, height / 2 + tinggiBayangan()), red);
    canvas.drawLine(Offset(width / 2, height / 2 - tinggiBenda),
        Offset(width / 2 - jarakBenda, height / 2 - tinggiBenda), red);
  }

  @override
  bool shouldRepaint(CanvasGraph oldDelegate) => false;
}

class FloatingModal extends StatefulWidget {
  @override
  State<FloatingModal> createState() => _FloatingModalState();
}

class _FloatingModalState extends State<FloatingModal> {
  // bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(460, 100),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withOpacity(0.1),
          ),
          width: 250,
          height: 250,
          child: Column(
            children: [
              Text('Tinggi Benda'),
              Text('Jarak Benda'),
              Text('Titik Fokus'),
              Text('Tinggi Bayangan'),
              Text('Jarak Bayangan'),
            ],
          )),
    );
  }
}
