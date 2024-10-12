import 'package:flutter/material.dart';
import 'package:week2/utils/constraint_viewer.dart';

class Example4 extends StatelessWidget {
  const Example4({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ConstraintsViewer(
        child: Container(
          color: Colors.red,
          height: 100,
        ),
      ),
    );
  }
}
