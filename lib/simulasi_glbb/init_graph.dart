import 'package:flutter/material.dart';
import 'package:grafkom_app/simulasi_glbb/canvas.dart';

class InitGraph extends StatelessWidget {
  final double x, y, x2, y2, diameterBola;
  const InitGraph(
      {Key? key,
      required this.x,
      required this.y,
      required this.x2,
      required this.y2,
      required this.diameterBola})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter:
            DCanvas(x: x, y: y, x2: x2, y2: y2, diameterBola: diameterBola));
  }
}
