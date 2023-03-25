import 'package:flutter/material.dart';

class DTextField extends StatelessWidget {
  final TextEditingController controller;
  const DTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 40,
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 14),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            border: OutlineInputBorder()),
      ),
    );
  }
}
