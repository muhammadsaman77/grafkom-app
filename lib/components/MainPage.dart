import 'package:flutter/material.dart';
import 'package:grafkom_app/components/DTextField.dart';
import 'package:grafkom_app/components/DCanvas.dart';
import 'package:grafkom_app/components/InitGraph.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static double ukuran = 128;
  static double jarak = 184;
  static double titikFokus = 84;
  static double jarakBayangan = DCanvas.jarakBayangan(jarak, titikFokus);
  static double ukuranBayangan =
      DCanvas.ukuranBayangan(ukuran, jarak, titikFokus);

  // DCanvas Dgraph = DCanvas()
  // static double
  TextEditingController jarakField =
      TextEditingController(text: jarak.toString());
  TextEditingController ukuranField =
      TextEditingController(text: ukuran.toString());
  TextEditingController titikFokusField =
      TextEditingController(text: titikFokus.toString());
  bool isShow = false;
  _MainPageState() {
    ukuranField.addListener(() {
      setState(() {
        ukuran = double.parse(ukuranField.text);
        ukuranBayangan = DCanvas.ukuranBayangan(ukuran, jarak, titikFokus);
      });
    });
    jarakField.addListener(() {
      setState(() {
        jarak = double.parse(jarakField.text);
        jarakBayangan = DCanvas.jarakBayangan(jarak, titikFokus);
      });
    });
    titikFokusField.addListener(() {
      setState(() {
        titikFokus = double.parse(titikFokusField.text);
        jarakBayangan = DCanvas.jarakBayangan(jarak, titikFokus);
        ukuranBayangan = DCanvas.ukuranBayangan(ukuran, jarak, titikFokus);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Stack(children: [
        InitGraph(
          titikFokus: titikFokus,
          jarakBenda: jarak,
          ukuranBenda: ukuran,
        ),
        Container(
          margin: EdgeInsets.only(
              top: size.height * 4 / 8, left: size.width * 12 / 16),
          child: Visibility(
            visible: isShow,
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
                          SfSlider(
                            min: -300,
                            max: 300,
                            value: ukuran,
                            interval: 150,
                            showTicks: true,
                            showLabels: true,
                            enableTooltip: true,
                            minorTicksPerInterval: 1,
                            onChanged: (dynamic value) {
                              setState(() {
                                ukuran = value;
                                ukuranBayangan = DCanvas.ukuranBayangan(
                                    ukuran, jarak, titikFokus);
                                ukuranField = TextEditingController(
                                    text: ukuran.toString());
                              });
                            },
                          ),
                          // Slider(
                          //   min: -size.height / 2,
                          //   max: size.height / 2,
                          //   value: ukuran,
                          //   onChanged: (value) {
                          //     setState(() {
                          //       ukuran = value;
                          //       ukuranBayangan = DCanvas.ukuranBayangan(
                          //           ukuran, jarak, titikFokus);
                          //       ukuranField = TextEditingController(
                          //           text: ukuran.toString());
                          //     });
                          //   },
                          // ),
                          DTextField(controller: ukuranField),
                        ],
                      ),
                      Row(
                        children: [
                          Text('s'),
                          SfSlider(
                            min: -640,
                            max: 640,
                            value: jarak,
                            interval: 320,
                            showTicks: true,
                            showLabels: true,
                            enableTooltip: true,
                            minorTicksPerInterval: 1,
                            onChanged: (dynamic value) {
                              setState(() {
                                jarak = value;
                                jarakField = TextEditingController(
                                    text: jarak.toString());
                                jarakBayangan =
                                    DCanvas.jarakBayangan(jarak, titikFokus);
                                ukuranBayangan = DCanvas.ukuranBayangan(
                                    ukuran, jarak, titikFokus);
                              });
                            },
                          ),
                          // Slider(
                          //   min: -size.width / 2,
                          //   max: size.width / 2,
                          //   value: jarak,
                          //   onChanged: (value) {
                          //     setState(() {
                          //       jarak = value;
                          //       jarakField = TextEditingController(
                          //           text: jarak.toString());
                          //       jarakBayangan =
                          //           DCanvas.jarakBayangan(jarak, titikFokus);
                          //       ukuranBayangan = DCanvas.ukuranBayangan(
                          //           ukuran, jarak, titikFokus);
                          //     });
                          //   },
                          // ),
                          DTextField(controller: jarakField)
                        ],
                      ),
                      Row(
                        children: [
                          Text('f'),
                          SfSlider(
                            min: -640,
                            max: 640,
                            value: titikFokus,
                            interval: 320,
                            showTicks: true,
                            showLabels: true,
                            enableTooltip: true,
                            minorTicksPerInterval: 1,
                            onChanged: (dynamic value) {
                              setState(() {
                                titikFokus = value;
                                titikFokusField = TextEditingController(
                                    text: titikFokus.toString());
                                jarakBayangan =
                                    DCanvas.jarakBayangan(jarak, titikFokus);
                                ukuranBayangan = DCanvas.ukuranBayangan(
                                    ukuran, jarak, titikFokus);
                              });
                            },
                          ),
                          // Slider(
                          //   min: -size.width / 2,
                          //   max: size.width / 2,
                          //   value: titikFokus,
                          //   onChanged: (value) {
                          //     setState(() {
                          //       titikFokus = value;
                          //       titikFokusField = TextEditingController(
                          //           text: titikFokus.toString());
                          //       jarakBayangan =
                          //           DCanvas.jarakBayangan(jarak, titikFokus);
                          //       ukuranBayangan = DCanvas.ukuranBayangan(
                          //           ukuran, jarak, titikFokus);
                          //     });
                          //   },
                          // ),
                          DTextField(controller: titikFokusField)
                        ],
                      ),
                      Row(
                        children: [
                          Text("h'"),
                          SizedBox(
                            width: 190,
                          ),
                          Container(
                            width: 50,
                            height: 40,
                            child: Text(
                              ukuranBayangan.toString(),
                              style: TextStyle(fontSize: 14),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("s'"),
                          SizedBox(
                            width: 190,
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
