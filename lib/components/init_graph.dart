import 'package:flutter/material.dart';
import 'package:grafkom_app/components/canvas.dart';

@immutable
class InitGraph extends StatelessWidget {
  final double ukuranBenda, jarakBenda, titikFokus;
  const InitGraph(
      {Key? key,
      required this.ukuranBenda,
      required this.jarakBenda,
      required this.titikFokus})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CustomPaint(
      painter: DCanvas(
          height: size.height,
          width: size.width,
          titikFokus: titikFokus,
          ukuranBenda: ukuranBenda,
          jarakBenda: jarakBenda),
    );
  }
}
