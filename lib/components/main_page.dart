import 'package:flutter/material.dart';
import 'package:grafkom_app/components/instruction.dart';
import 'package:grafkom_app/components/text_field.dart';
import 'package:grafkom_app/components/canvas.dart';
import 'package:grafkom_app/components/init_graph.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
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
              top: size.height * 3 / 8 + 30, left: size.width * 12 / 16),
          child: Visibility(
            visible: isShow,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(0.1),
                ),
                width: 350,
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('h'),
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
                          const Text('s'),
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
                          const Text('f'),
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
                          const Text("h'"),
                          const SizedBox(
                            width: 190,
                          ),
                          SizedBox(
                            width: 50,
                            height: 40,
                            child: Text(
                              ukuranBayangan.ceil().toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Text("s'"),
                          const SizedBox(
                            width: 190,
                          ),
                          SizedBox(
                            width: 50,
                            height: 40,
                            child: Text(
                              jarakBayangan.ceil().toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                          )
                        ],
                      ),
                      const Instruction(
                        title: 'Benda',
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Instruction(
                        title: 'Bayangan',
                        color: Colors.green,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Instruction(
                          title: 'Garis Benda', color: Colors.red),
                      const SizedBox(
                        height: 10,
                      ),
                      const Instruction(
                          title: 'Garis Bayangan', color: Colors.purpleAccent)
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
          child: isShow == true
              ? const Icon(Icons.close)
              : const Icon(Icons.edit)),
    );
  }
}