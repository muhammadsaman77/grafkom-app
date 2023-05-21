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
        if (curPos > 640.0) {
          curPos -= 640.0;
          x = 640.0 - curPos;
          kecepatan -= gravity;
          kecepatan *= -1;
        } else {
          x = curPos;
          kecepatan -= gravity;
        }
      } else if (kecepatan < 0) {
        double curPos = x + (kecepatan / 10);
        if (curPos < -640.0) {
          curPos -= 0.0;
          x = curPos + 0.0;
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

  dropAnimation() async {
    int gravity = 0;
    bool isDrop = true;
    while (y < 480 || gravity > 0) {
      if (isDrop) {
        setState(() {
          gravity += 1;
          y = y + gravity;
          if (480 >= y.round()) {
            gravity -= 1;
            y -= gravity;
            if (gravity < 0) {}
          }
        });
      }
      await Future.delayed(const Duration(milliseconds: 1));
    }
  }

  // late bool isDrop;
  // void run() {
  // setState(() {
  //   gravity = 0;
  //   isDrop = true;
  // });

  //   while (y < 480 || gravity > 0) {
  //     while (isDrop) {
  //       setState(() {
  //         gravity++;
  //         y -= gravity;
  //         if (y == 480) {
  //           isDrop = !isDrop;
  //         }
  //       });

  //       int delay = 10 + DateTime.now().millisecondsSinceEpoch;
  //       while (DateTime.now().millisecondsSinceEpoch < delay) {
  //         // Tunggu
  //       }
  //     }

  //     while (!isDrop) {
  //       setState(() {
  //         gravity -= 2;
  //         y += gravity;
  //         if (gravity < 0) {
  //           isDrop = !isDrop;
  //         }
  //       });

  //       int delay = 10 + DateTime.now().millisecondsSinceEpoch;
  //       while (DateTime.now().millisecondsSinceEpoch < delay) {
  //         // Tunggu
  //       }
  //     }
  //   }
  // }

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
            startAnimation: startAnimation,
            dropAnimation: dropAnimation,
            onChangeX: onChangeX,
            onChangeY: onChangedY,
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
