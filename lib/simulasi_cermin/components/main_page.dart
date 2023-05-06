import 'package:flutter/material.dart';
import 'package:grafkom_app/simulasi_cermin/components/instruction.dart';
import 'package:grafkom_app/simulasi_cermin/components/text_field.dart';
import 'package:grafkom_app/simulasi_cermin/components/canvas.dart';
import 'package:grafkom_app/simulasi_cermin/components/init_graph.dart';
import 'package:grafkom_app/simulasi_glbb/main_page.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController jarakField =
      TextEditingController(text: jarak.toString());
  TextEditingController ukuranField =
      TextEditingController(text: ukuran.toString());
  TextEditingController titikFokusField =
      TextEditingController(text: titikFokus.toString());
  static double ukuran = 128;
  static double jarak = 184;
  static double titikFokus = 60;
  static double jarakBayangan = DCanvas.jarakBayangan(jarak, titikFokus);
  static double ukuranBayangan =
      DCanvas.ukuranBayangan(ukuran, jarak, titikFokus);
  // DCanvas Dgraph = DCanvas()
  // static double

  bool isShow = false;
  String sifatBayangan() {
    if (jarak < titikFokus) {
      return 'Sifat Bayangan: maya, tegak, diperbesar';
    } else if (jarak > titikFokus && jarak < 2 * titikFokus) {
      return 'Sifat Bayangan: nyata, terbalik, diperbesar';
    } else if (jarak == 2 * titikFokus) {
      return 'Sifat Bayangan: nyata, terbalik, sama besar';
    } else if (jarak > 2 * titikFokus) {
      return 'Sifat Bayangan: nyata, terbalik, diperkecil';
    }
    return '';
  }

  @override
  void dispose() {
    jarakField.dispose();
    ukuranField.dispose();
    titikFokusField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Graphkom',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text("Simulasi Cermin"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Simulasi GLBB"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return MainPageGLBB();
                  },
                ));
              },
            ),
          ],
        ),
      ),
      body: Stack(children: [
        InitGraph(
          titikFokus: titikFokus,
          jarakBenda: jarak,
          ukuranBenda: ukuran,
        ),
        Container(
          margin: EdgeInsets.only(
              top: size.height * 3 / 8 + 60, left: size.width * 12 / 16 - 100),
          child: Visibility(
            visible: isShow,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 225, 222, 222),
                ),
                width: 400,
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text('h:'),
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
                                        jarakBayangan = DCanvas.jarakBayangan(
                                            jarak, titikFokus);
                                        ukuranField = TextEditingController(
                                            text: ukuran.toString());
                                      });
                                    },
                                    activeColor: Colors.green,
                                    inactiveColor: Colors.lightGreen,
                                  ),
                                  DTextField(
                                    controller: ukuranField,
                                    onChanged: (data) {
                                      setState(() {
                                        ukuran = double.parse(data);
                                        ukuranBayangan = DCanvas.ukuranBayangan(
                                            ukuran, jarak, titikFokus);
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text("h':"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 15,
                                    child: Text(
                                      ukuranBayangan.toString(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('s:'),
                                  SfSlider(
                                    min: 0,
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
                                        jarakBayangan = DCanvas.jarakBayangan(
                                            jarak, titikFokus);
                                        ukuranBayangan = DCanvas.ukuranBayangan(
                                            ukuran, jarak, titikFokus);
                                      });
                                    },
                                    activeColor: Colors.green,
                                    inactiveColor: Colors.lightGreen,
                                  ),
                                  DTextField(
                                    controller: jarakField,
                                    onChanged: (data) {
                                      setState(() {
                                        jarak = double.parse(data);
                                        ukuranBayangan = DCanvas.ukuranBayangan(
                                            ukuran, jarak, titikFokus);
                                        jarakBayangan = DCanvas.jarakBayangan(
                                            jarak, titikFokus);
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text("s':"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 15,
                                    child: Text(
                                      jarakBayangan.toString(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('f:'),
                                  SfSlider(
                                    min: 0,
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
                                        jarakBayangan = DCanvas.jarakBayangan(
                                            jarak, titikFokus);
                                        ukuranBayangan = DCanvas.ukuranBayangan(
                                            ukuran, jarak, titikFokus);
                                      });
                                    },
                                    activeColor: Colors.green,
                                    inactiveColor: Colors.lightGreen,
                                  ),
                                  DTextField(
                                    controller: titikFokusField,
                                    onChanged: (data) {
                                      setState(() {
                                        titikFokus = double.parse(data);
                                        jarakBayangan = DCanvas.jarakBayangan(
                                            jarak, titikFokus);
                                        ukuranBayangan = DCanvas.ukuranBayangan(
                                            ukuran, jarak, titikFokus);
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text("M:"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 15,
                                    child: Text(
                                      (ukuranBayangan / ukuran)
                                          .abs()
                                          .toString(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Instruction(
                                  title: 'Benda',
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Instruction(
                                  title: 'Bayangan',
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Instruction(
                                    title: 'Garis Benda', color: Colors.red),
                                SizedBox(
                                  height: 10,
                                ),
                                Instruction(
                                    title: 'Garis Bayangan',
                                    color: Colors.purpleAccent)
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 28),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(sifatBayangan()),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 10, top: 10),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange),
                                        onPressed: () {
                                          setState(() {
                                            jarak = titikFokus;
                                            jarakField = TextEditingController(
                                                text: jarak.toString());
                                            jarakBayangan =
                                                DCanvas.jarakBayangan(
                                                    jarak, titikFokus);
                                            ukuranBayangan =
                                                DCanvas.ukuranBayangan(
                                                    ukuran, jarak, titikFokus);
                                          });
                                        },
                                        child: const Text('Set To Focus ')),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.lightGreen),
                                      onPressed: () {
                                        setState(() {
                                          jarak = 2 * titikFokus;
                                          jarakField = TextEditingController(
                                              text: jarak.toString());
                                          jarakBayangan = DCanvas.jarakBayangan(
                                              jarak, titikFokus);
                                          ukuranBayangan =
                                              DCanvas.ukuranBayangan(
                                                  ukuran, jarak, titikFokus);
                                        });
                                      },
                                      child: const Text('Set To Radius')),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ]),
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
