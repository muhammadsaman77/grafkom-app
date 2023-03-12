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
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static double tinggi = 128;
  static double jarak = 277;
  static double titikFokus = 184;
  static double jarakBayangan = CanvasGraph.jarakBayangan(jarak, titikFokus);
  static double tinggiBayangan =
      CanvasGraph.tinggiBayangan(tinggi, jarak, titikFokus);

  // CanvasGraph Dgraph = CanvasGraph()
  // static double
  TextEditingController jarakField =
      TextEditingController(text: jarak.toString());
  TextEditingController tinggiField =
      TextEditingController(text: tinggi.toString());
  TextEditingController titikFokusField =
      TextEditingController(text: titikFokus.toString());
  TextEditingController jarakBayanganField =
      TextEditingController(text: jarakBayangan.toString());
  TextEditingController tinggiBayanganField =
      TextEditingController(text: tinggiBayangan.toString());
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Stack(children: [
        InitGraph(
          titikFokus: titikFokus,
          jarakBenda: jarak,
          tinggiBenda: tinggi,
        ),
        Container(
          margin: EdgeInsets.only(
              top: size.height * 4 / 8, left: size.width * 12 / 16),
          // bottom: ,
          // top: 20,
          // right: -100,
          child: Visibility(
            visible: isShow,
            // bottom: 0,
            // top: 500,
            // offset: Offset(size.width * 12 / 16, size.height * 4 / 8),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(0.1),
                ),
                width: 350,
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('h'),
                          Slider(
                            value: 0.5,
                            onChanged: (value) {
                              setState(() {
                                tinggi = value;
                              });
                            },
                          ),
                          Container(
                            width: 50,
                            height: 40,
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  tinggi = double.parse(value);
                                  tinggiBayangan = CanvasGraph.tinggiBayangan(
                                      tinggi, jarak, titikFokus);
                                });
                              },
                              controller: tinggiField,
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  border: OutlineInputBorder()),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text('s'),
                          Slider(
                            value: 0.5,
                            onChanged: (value) {},
                          ),
                          Container(
                            width: 50,
                            height: 40,
                            child: TextField(
                              controller: jarakField,
                              onChanged: (value) {
                                setState(() {
                                  jarak = double.parse(value);
                                  jarakBayangan = CanvasGraph.jarakBayangan(
                                      jarak, titikFokus);
                                });
                              },
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  border: OutlineInputBorder()),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text('f'),
                          Slider(
                            value: 0.5,
                            onChanged: (value) {},
                          ),
                          Container(
                            width: 50,
                            height: 40,
                            child: TextField(
                              controller: titikFokusField,
                              onChanged: (value) {
                                setState(() {
                                  titikFokus = double.parse(value);
                                  jarakBayangan = CanvasGraph.jarakBayangan(
                                      jarak, titikFokus);
                                  tinggiBayangan = CanvasGraph.tinggiBayangan(
                                      tinggi, jarak, titikFokus);
                                });
                              },
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  border: OutlineInputBorder()),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("h'"),
                          Slider(
                            value: 0.5,
                            onChanged: (value) {},
                          ),
                          Container(
                            width: 50,
                            height: 40,
                            child: Text(
                              tinggiBayangan.toString(),
                              style: TextStyle(fontSize: 14),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("s'"),
                          Slider(
                            value: 0.5,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                          Container(
                            width: 50,
                            height: 40,
                            child: Text(
                              jarakBayangan.toString(),
                              style: TextStyle(fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ])),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              isShow = !isShow;
            });
          },
          child: isShow == true ? Icon(Icons.close) : Icon(Icons.edit)),
    );
  }
}

class InitGraph extends StatelessWidget {
  double tinggiBenda, jarakBenda, titikFokus;
  InitGraph(
      {required this.tinggiBenda,
      required this.jarakBenda,
      required this.titikFokus});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: CustomPaint(
        painter: CanvasGraph(
            height: size.height,
            width: size.width,
            titikFokus: titikFokus,
            tinggiBenda: tinggiBenda,
            jarakBenda: jarakBenda),
      ),
    );
  }
}

class CanvasGraph extends CustomPainter {
  late double height, width, tinggiBenda, jarakBenda, titikFokus;
  // double DjarakBayangan = 0;
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
    // this.jarakBayangan = 0;
  }
  static double jarakBayangan(jarakBenda, titikFokus) {
    return (jarakBenda * titikFokus) / (jarakBenda - titikFokus);
  }

  static double tinggiBayangan(tinggiBenda, jarakBenda, titikFokus) {
    return jarakBayangan(jarakBenda, titikFokus) * tinggiBenda / jarakBenda;
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
    // canvas.drawLine(
    //     Offset(width / 2 - jarakBenda, height / 2 - 1 / 3 * (tinggiBenda)),
    //     Offset(width / 2 - jarakBenda, height / 2 - tinggiBenda),
    //     blue);
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
    //     Offset(width / 2 - jarakBayangan(jarakBenda,titikFokus), height / 2),
    //     Offset(width / 2 - jarakBayangan(jarakBenda,titikFokus), height / 2 + tinggiBayangan(tinggiBenda,jarakBenda,titikFokus)),
    //     green);
    canvas.drawLine(
        Offset(width / 2 - jarakBayangan(jarakBenda, titikFokus),
            height / 2 + tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)),
        Offset(
            width / 2 -
                jarakBayangan(jarakBenda, titikFokus) +
                (1 / 6 * (jarakBayangan(jarakBenda, titikFokus))),
            height / 2),
        green);
    canvas.drawLine(
        Offset(width / 2 - jarakBayangan(jarakBenda, titikFokus),
            height / 2 + tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)),
        Offset(
            width / 2 -
                jarakBayangan(jarakBenda, titikFokus) -
                (1 / 6 * (jarakBayangan(jarakBenda, titikFokus))),
            height / 2),
        green);
    canvas.drawLine(
        Offset(
            width / 2 -
                jarakBayangan(jarakBenda, titikFokus) -
                (1 / 4 * (jarakBayangan(jarakBenda, titikFokus))),
            height / 2 +
                tinggiBayangan(tinggiBenda, jarakBenda, titikFokus) -
                (1 /
                    3 *
                    (tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)))),
        Offset(
            width / 2 -
                jarakBayangan(jarakBenda, titikFokus) +
                (1 / 6 * (jarakBayangan(jarakBenda, titikFokus))),
            height / 2),
        green);
    canvas.drawLine(
        Offset(
            width / 2 -
                jarakBayangan(jarakBenda, titikFokus) +
                (1 / 4 * (jarakBayangan(jarakBenda, titikFokus))),
            height / 2 +
                tinggiBayangan(tinggiBenda, jarakBenda, titikFokus) -
                (1 /
                    3 *
                    (tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)))),
        Offset(
            width / 2 -
                jarakBayangan(jarakBenda, titikFokus) -
                (1 / 6 * (jarakBayangan(jarakBenda, titikFokus))),
            height / 2),
        green);
    canvas.drawLine(
        Offset(
            width / 2 -
                jarakBayangan(jarakBenda, titikFokus) +
                (1 / 4 * (jarakBayangan(jarakBenda, titikFokus))),
            height / 2 +
                tinggiBayangan(tinggiBenda, jarakBenda, titikFokus) -
                (1 /
                    3 *
                    (tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)))),
        Offset(
            width / 2 -
                jarakBayangan(jarakBenda, titikFokus) -
                (1 / 4 * (jarakBayangan(jarakBenda, titikFokus))),
            height / 2 +
                tinggiBayangan(tinggiBenda, jarakBenda, titikFokus) -
                (1 /
                    3 *
                    (tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)))),
        green);

    // sinar pantul
    canvas.drawLine(
        Offset(width / 2, height / 2 - this.tinggiBenda),
        Offset(width / 2 - jarakBayangan(jarakBenda, titikFokus),
            height / 2 + tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)),
        purple);
    canvas.drawLine(
        Offset(width / 2,
            height / 2 + tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)),
        Offset(width / 2 - jarakBayangan(jarakBenda, titikFokus),
            height / 2 + tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)),
        purple);
    // sinar datang
    canvas.drawLine(
        Offset(width / 2 - jarakBenda, height / 2 - tinggiBenda),
        Offset(width / 2,
            height / 2 + tinggiBayangan(tinggiBenda, jarakBenda, titikFokus)),
        red);
    canvas.drawLine(Offset(width / 2, height / 2 - tinggiBenda),
        Offset(width / 2 - jarakBenda, height / 2 - tinggiBenda), red);
  }

  @override
  bool shouldRepaint(CanvasGraph oldDelegate) => false;
}
