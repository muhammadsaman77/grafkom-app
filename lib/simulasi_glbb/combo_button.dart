import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ComboButton extends StatelessWidget {
  late double x, y, diameter, kecepatan;
  final Function(dynamic value) onChangeY;
  final Function(dynamic value) onChangeX;
  final Function() startAnimation;
  double gravity = 1;
  ComboButton(
      {super.key,
      required this.x,
      required this.y,
      required this.diameter,
      required this.kecepatan,
      required this.onChangeY,
      required this.onChangeX,
      required this.startAnimation});

  void moveLeft() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey,
            height: 30,
            child: Row(
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
                  onChanged: onChangeX,
                  activeColor: Colors.green,
                  inactiveColor: Colors.lightGreen,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Icon(
                Icons.chevron_left,
                color: Colors.black54,
              )),
          const SizedBox(
            width: 10.0,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Icon(
                Icons.keyboard_double_arrow_left,
                color: Colors.black54,
              )),
          const SizedBox(
            width: 20.0,
          ),
          SizedBox(
              width: 100,
              height: 30,
              child: TextFormField(
                controller: TextEditingController(text: ""),
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54))),
              )),
          const SizedBox(
            width: 20.0,
          ),
          ElevatedButton(
              onPressed: startAnimation,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Icon(
                Icons.keyboard_double_arrow_right,
                color: Colors.black54,
              )),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Icon(
                Icons.chevron_right,
                color: Colors.black54,
              )),
          const SizedBox(
            width: 10.0,
          ),
          Container(
            height: 60,
            color: Colors.grey,
            padding: const EdgeInsets.only(left: 10),
            child: Row(
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
                  onChanged: onChangeY,
                  activeColor: Colors.green,
                  inactiveColor: Colors.lightGreen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
