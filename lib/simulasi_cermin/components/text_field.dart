import 'package:flutter/material.dart';

class DTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController controller;
  const DTextField(
      {Key? key, required this.controller, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 40,
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        style: const TextStyle(fontSize: 14),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            border: OutlineInputBorder()),
      ),
    );
  }
}
