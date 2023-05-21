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

  startLeftAnimation() {
    double kecepatan = double.parse(textController.text);
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (kecepatan < 0) {
        double curPos = x + (kecepatan / 10);
        if (curPos < -640) {
          curPos -= 0;
          x = curPos;
          kecepatan += gravity;
          kecepatan *= -1;
          textController.text = "${kecepatan.abs()}";
        } else {
          x = curPos;
          kecepatan += gravity;
          textController.text = "${kecepatan.abs()}";
        }
      } else if (kecepatan > 0) {
        double curPos = x + (kecepatan / 10);
        if (curPos > 640) {
          kecepatan -= gravity;
          kecepatan *= -1;
          textController.text = "${kecepatan.abs()}";
        } else {
          x = curPos;
          kecepatan -= gravity;
          textController.text = "${kecepatan.abs()}";
        }
      }

      setState(() {});
    });
  }

  startRightAnimation() {
    double kecepatan = double.parse(textController.text);
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

  dropAnimation() {
    Timer.periodic(const Duration(milliseconds: 10), (Timer timer) {
      int gravity = 0;
      bool isDrop = true;
      if (y < 480 || 0 < gravity) {
        if (isDrop) {
          gravity++;
          y = y + gravity;
          if (480 == y) isDrop = !isDrop;
        }
        if (!isDrop) {
          gravity -= 2;
          y = y - gravity;
          if (gravity < 0) isDrop = !isDrop;
        }
      }
      setState(() {});
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
          InitGraph(x: x, y: y, diameter: diameter),
          const Spacer(),
          ComboButton(
            x: x,
            y: y,
            startRightAnimation: startRightAnimation,
            startLeftAnimaion: startLeftAnimation,
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
