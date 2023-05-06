import 'package:flutter/material.dart';

class ComboButton extends StatelessWidget {
  const ComboButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {}, child: const Icon(Icons.chevron_left)),
          const SizedBox(
            width: 10.0,
          ),
          ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.keyboard_double_arrow_left)),
          const SizedBox(
            width: 20.0,
          ),
          Container(
              color: Colors.grey,
              width: 100,
              height: 30,
              child: TextFormField(
                controller: TextEditingController(text: ""),
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(border: OutlineInputBorder()),
              )),
          const SizedBox(
            width: 20.0,
          ),
          ElevatedButton(
              onPressed: () {}, child: const Icon(Icons.chevron_right)),
          const SizedBox(
            width: 10.0,
          ),
          ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.keyboard_double_arrow_right)),
        ],
      ),
    );
  }
}
