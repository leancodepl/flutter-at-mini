import 'package:flutter/material.dart';
import 'package:week2/utils/constraint_viewer.dart';

class Example2 extends StatelessWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstraintsViewer(
      child: Container(
        width: 600,
        height: 300,
        color: Colors.red,
      ),
    );
  }
}
