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
  static double y = 0;
  double ground = 480;
  static double diameter = 80;
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

  onPressedDown() {
    int gravitasi = 0;
    bool isDrop = true;
    while (y < 480 || gravitasi > 0) {
      gravitasi++;
      y = y + 1;
      if (y == 480) isDrop = !isDrop;
      print(y);
    }
    while (!isDrop) {
      gravitasi -= 2;
      y = y - gravitasi;
      if (gravitasi < 0) isDrop = !isDrop;
    }
    setState(() {});
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
            onChangeX: onChangeX,
            onChangeY: onChangedY,
            onPressedDown: onPressedDown,
          ),
        ],
      ),
    );
  }
}
