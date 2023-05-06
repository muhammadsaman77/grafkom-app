import 'package:flutter/material.dart';

class Instruction extends StatelessWidget {
  final Color color;
  final String title;
  const Instruction({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 50,
        height: 20,
        color: color,
        margin: const EdgeInsets.only(right: 20),
      ),
      Text(title)
    ]);
  }
}
