import 'package:flutter/material.dart';

class const Example1({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tight(const Size(300, 200)),
      color: Colors.red,
      // Uncomment this to see
      // child: Align(
      // alignment: const Alignment(1, 0),
      child: Container(
        width: 350,
        height: 50,
        color: Colors.green,
        // ),
      ),
    );
  }
}
