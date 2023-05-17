import 'package:flutter/material.dart';
import 'package:grafkom_app/simulasi_cermin/components/main_page.dart';
import 'package:grafkom_app/simulasi_glbb/combo_button.dart';
import 'package:grafkom_app/simulasi_glbb/init_graph.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MainPageGLBB extends StatefulWidget {
  const MainPageGLBB({super.key});

  @override
  State<MainPageGLBB> createState() => _MainPageGLBBState();
}

class _MainPageGLBBState extends State<MainPageGLBB> {
  static double x = -640;
  static double y = 480;
  static double diameter = 80;

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
          InitGraph(x: x, y: y, diameter: diameter),
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
                                    min: 0,
                                    max: 480,
                                    value: y,
                                    interval: 140,
                                    showTicks: true,
                                    showLabels: true,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        y = value;
                                      });
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
                                        x = value;
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
