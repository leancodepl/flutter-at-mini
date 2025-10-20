import 'package:flutter/material.dart';

class Example2 extends StatelessWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: Row(
        children: [
          Container(width: 200, color: Colors.green),
          Expanded(child: Container(color: Colors.blue)),
          Container(width: 300, color: Colors.amber),
        ],
      ),
    );
  }
}
