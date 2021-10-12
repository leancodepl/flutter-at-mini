import 'package:flutter/material.dart';

class Example4 extends StatelessWidget {
  const Example4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
