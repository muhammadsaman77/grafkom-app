import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grafkom_app/simulasi_cermin/components/main_page.dart';
import 'package:grafkom_app/simulasi_glbb/combo_button.dart';
import 'package:grafkom_app/simulasi_glbb/init_graph.dart';

class MainPageGLBB extends StatefulWidget {
  const MainPageGLBB({super.key});

  @override
  State<MainPageGLBB> createState() => _MainPageGLBBState();
}

class _MainPageGLBBState extends State<MainPageGLBB> {
  static double x = -640;
  static double y = 480;
  static double diameter = 80;
  static double kecepatan = 300;
  double gravity = 1;
  onChangedY(dynamic value) {
    setState(() {
      y = value;
    });
  }

  onChangeX(dynamic value) {
    setState(() {
      x = value;
    });
  }

  startAnimation() {
    Timer.periodic(const Duration(milliseconds: 10), (Timer timer) {
      if (kecepatan > 0) {
        double curPos = x + (kecepatan / 10);
        if (curPos > 200.0) {
          curPos -= 200.0;
          x = 200.0 - curPos;
          kecepatan -= gravity;
          kecepatan *= -1;
        } else {
          x = curPos;
          kecepatan -= gravity;
        }
      } else if (kecepatan < 0) {
        double curPos = x + (kecepatan / 10);
        if (curPos < 0.0) {
          curPos -= 0.0;
          x = curPos - 0.0;
          kecepatan += gravity;
          kecepatan *= -1;
        } else {
          x = curPos;
          kecepatan += gravity;
        }
      }
      setState(() {}); // Memperbarui state dan membangun ulang tampilan
    });
  }

  bool isShow = false;
  @override
  Widget build(BuildContext context) {
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
          InitGraph(x: x, y: y, diameter: diameter, kecepatan: kecepatan),
          const Spacer(),
          ComboButton(
              x: x,
              y: y,
              diameter: diameter,
              kecepatan: kecepatan,
              onChangeY: onChangedY,
              onChangeX: onChangeX,
              startAnimation: startAnimation),
        ],
      ),
    );
  }
}
