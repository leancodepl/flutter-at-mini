import 'package:flutter/material.dart';

class Example2 extends StatelessWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 400, minHeight: 400),
      color: Colors.blue,
      child: Container(
        constraints: BoxConstraints.tight(const Size(300, 200)),
        color: Colors.red,
        child: Align(
          alignment: const Alignment(1, 0),
          child: Container(
            width: 100,
            height: 50,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
