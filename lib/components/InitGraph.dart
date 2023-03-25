import 'package:flutter/material.dart';
import 'package:grafkom_app/components/DCanvas.dart';

class InitGraph extends StatelessWidget {
  double ukuranBenda, jarakBenda, titikFokus;
  InitGraph(
      {required this.ukuranBenda,
      required this.jarakBenda,
      required this.titikFokus});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: CustomPaint(
        painter: DCanvas(
            height: size.height,
            width: size.width,
            titikFokus: titikFokus,
            ukuranBenda: ukuranBenda,
            jarakBenda: jarakBenda),
      ),
    );
  }
}
