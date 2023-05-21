import 'package:flutter/material.dart';
import 'package:grafkom_app/simulasi_glbb/canvas.dart';

class InitGraph extends StatelessWidget {
  final double x, y, diameter;
  const InitGraph(
      {Key? key, required this.x, required this.y, required this.diameter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: DCanvas(x: x, y: y, diamater: diameter));
  }
}
