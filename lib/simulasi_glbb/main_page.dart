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
  static TextEditingController textController =
      TextEditingController(text: "0");

  _MainPageGLBBState();
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

  startAnimation(int koefiesien) {
    double kecepatan = koefiesien * double.parse(textController.text);
    Timer.periodic(const Duration(milliseconds: 10), (Timer timer) {
      if (kecepatan > 0) {
        double curPos = x + (kecepatan / 10);
        if (curPos > 640.0) {
          curPos -= 640.0;
          x = 640.0 - curPos;
          kecepatan -= gravity;
          kecepatan *= -1;
          textController.text = "${kecepatan.abs()}";
        } else {
          x = curPos;
          kecepatan -= gravity;
          textController.text = "${kecepatan.abs()}";
        }
      } else if (kecepatan < 0) {
        double curPos = x + (kecepatan / 10);
        if (curPos < -640.0) {
          curPos -= 0.0;
          x = curPos + 0.0;
          kecepatan += gravity;
          kecepatan *= -1;
          textController.text = "${kecepatan.abs()}";
        } else {
          x = curPos;
          kecepatan += gravity;
          textController.text = "${kecepatan.abs()}";
        }
      }
      setState(() {}); // Memperbarui state dan membangun ulang tampilan
    });
  }

  dropAnimation() async {
    double gravity = 0;
    bool isDrop = true;
    while (y < 480 || gravity > 0) {
      if (isDrop) {
        setState(() {
          gravity += 0.01;
          y += gravity;
          if (480 <= y) {
            isDrop = false;
          }
        });
      }
      while (!isDrop) {
        gravity -= 0.01;
        y -= gravity;
        if (gravity < 0) {
          isDrop = true;
        }
      }
      await Future.delayed(const Duration(microseconds: 950));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simulasi GLBB"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                'Grafika Komputer',
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
              leading: const Icon(Icons.sports_basketball),
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
          const Spacer(),
          ComboButton(
            x: x,
            y: y,
            startRightAnimation: () {
              startAnimation(1);
            },
            startLeftAnimaion: () {
              startAnimation(-1);
            },
            dropAnimation: dropAnimation,
            onChangeX: onChangeX,
            onChangeY: onChangedY,
            textController: textController,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
