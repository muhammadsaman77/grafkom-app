import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grafkom_app/simulasi_cermin/components/main_page.dart';
import 'package:grafkom_app/simulasi_glbb/combo_button.dart';
import 'package:grafkom_app/simulasi_glbb/init_graph.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'canvas.dart';

class MainPageGLBB extends StatefulWidget {
  const MainPageGLBB({super.key});

  @override
  State<MainPageGLBB> createState() => _MainPageGLBBState();
}

class _MainPageGLBBState extends State<MainPageGLBB> {
  static double x = 0;
  static double y = 490;
  static double diameterBola = 100;
  static double skel = 0;
  static double axis = 15;
  static double x2 = DCanvas.fx2(x, skel);
  static double y2 = DCanvas.fy2(y, skel, diameterBola);

  bool isShow = false;
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
              title: const Text("Simulasi Cermin"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const MainPage();
                  },
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Simulasi GLBB"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          InitGraph(x: x, y: y, x2: x2, y2: y2, diameterBola: diameterBola),
          Container(
            margin: EdgeInsets.only(
                top: size.height * 3 / 8, left: size.width * 12 / 16 - 100),
            child: Visibility(
              visible: isShow,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 225, 222, 222),
                  ),
                  width: 250,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text('y:'),
                                  SfSlider(
                                    min: -600,
                                    max: 600,
                                    value: y,
                                    interval: 300,
                                    showTicks: true,
                                    showLabels: true,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      setState(() {});
                                    },
                                    activeColor: Colors.green,
                                    inactiveColor: Colors.lightGreen,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('x:'),
                                  SfSlider(
                                    min: -640,
                                    max: 640,
                                    value: x,
                                    interval: 320,
                                    showTicks: true,
                                    showLabels: true,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        axis = (-1 * (x - value));
                                        x = value;

                                        final radians = pi / 180 * axis;
                                        final sinValue = sin(radians);
                                        final cosValue = cos(radians);

                                        final rotatedX =
                                            (x - diameterBola / 2) +
                                                ((x2 - x) * cosValue) -
                                                ((y2 - y) * sinValue);
                                        final rotatedY =
                                            (y - diameterBola / 2) +
                                                ((x2 - x) * sinValue) +
                                                ((y2 - y) * cosValue);

                                        x2 = rotatedX;
                                        y2 = rotatedY;
                                      });
                                    },
                                    activeColor: Colors.green,
                                    inactiveColor: Colors.lightGreen,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ])
                      ],
                    ),
                  )),
            ),
          ),
          const Spacer(),
          const ComboButton(),
        ],
      ),
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
