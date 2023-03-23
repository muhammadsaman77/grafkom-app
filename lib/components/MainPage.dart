import 'package:flutter/material.dart';
import 'package:grafkom_app/components/DTextField.dart';
import 'package:grafkom_app/components/DCanvas.dart';
import 'package:grafkom_app/components/InitGraph.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static double tinggi = 128;
  static double jarak = 184;
  static double titikFokus = 84;
  static double jarakBayangan = DCanvas.jarakBayangan(jarak, titikFokus);
  static double tinggiBayangan =
      DCanvas.tinggiBayangan(tinggi, jarak, titikFokus);

  // DCanvas Dgraph = DCanvas()
  // static double
  TextEditingController jarakField =
      TextEditingController(text: jarak.toString());
  TextEditingController tinggiField =
      TextEditingController(text: tinggi.toString());
  TextEditingController titikFokusField =
      TextEditingController(text: titikFokus.toString());
  bool isShow = false;
  _MainPageState() {
    tinggiField.addListener(() {
      setState(() {
        tinggi = double.parse(tinggiField.text);
        tinggiBayangan = DCanvas.tinggiBayangan(tinggi, jarak, titikFokus);
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
        tinggiBayangan = DCanvas.tinggiBayangan(tinggi, jarak, titikFokus);
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
                            min: -size.height / 2,
                            max: size.height / 2,
                            value: tinggi,
                            onChanged: (value) {
                              setState(() {
                                tinggi = value;
                                tinggiBayangan = DCanvas.tinggiBayangan(
                                    tinggi, jarak, titikFokus);
                                tinggiField = TextEditingController(
                                    text: tinggi.toString());
                              });
                            },
                          ),
                          DTextField(controller: tinggiField),
                        ],
                      ),
                      Row(
                        children: [
                          Text('s'),
                          Slider(
                            min: 0,
                            max: size.width / 2,
                            value: jarak,
                            onChanged: (value) {
                              setState(() {
                                jarak = value;
                                jarakField = TextEditingController(
                                    text: jarak.toString());
                                jarakBayangan =
                                    DCanvas.jarakBayangan(jarak, titikFokus);
                                tinggiBayangan = DCanvas.tinggiBayangan(
                                    tinggi, jarak, titikFokus);
                              });
                            },
                          ),
                          DTextField(controller: jarakField)
                        ],
                      ),
                      Row(
                        children: [
                          Text('f'),
                          Slider(
                            min: 0,
                            max: size.width / 2,
                            value: titikFokus,
                            onChanged: (value) {
                              setState(() {
                                titikFokus = value;
                                titikFokusField = TextEditingController(
                                    text: titikFokus.toString());
                                jarakBayangan =
                                    DCanvas.jarakBayangan(jarak, titikFokus);
                                tinggiBayangan = DCanvas.tinggiBayangan(
                                    tinggi, jarak, titikFokus);
                              });
                            },
                          ),
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
                              tinggiBayangan.toString(),
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
