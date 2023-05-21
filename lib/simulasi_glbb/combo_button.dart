import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ComboButton extends StatelessWidget {
  final double x;
  final double y;
  final Function(dynamic value) onChangeY;
  final Function(dynamic value) onChangeX;
  final Function() startRightAnimation;
  final Function() dropAnimation;
  final Function() startLeftAnimaion;
  final TextEditingController textController;
  const ComboButton(
      {super.key,
      required this.x,
      required this.y,
      required this.onChangeY,
      required this.onChangeX,
      required this.startRightAnimation,
      required this.dropAnimation,
      required this.textController,
      required this.startLeftAnimaion});
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
              onPressed: startLeftAnimaion,
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
                controller: textController,
                keyboardType: TextInputType.number,
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
              onPressed: startRightAnimation,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Icon(
                Icons.keyboard_double_arrow_right,
                color: Colors.black54,
              )),
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
          const SizedBox(
            width: 10.0,
          ),
          ElevatedButton(
              onPressed: dropAnimation,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Icon(
                Icons.swipe_down_outlined,
                color: Colors.black54,
              ))
        ],
      ),
    );
  }
}
