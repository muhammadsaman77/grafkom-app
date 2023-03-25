import 'package:flutter/material.dart';

class DTextField extends StatelessWidget {
  final controller;
  DTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 40,
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            border: OutlineInputBorder()),
      ),
    );
  }
}
