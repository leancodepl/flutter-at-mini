import 'package:flutter/material.dart';
import 'package:labs_week2/utils/constraint_viewer.dart';

class const Example4({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: ConstraintsViewer(
        child: Container(color: Colors.red, height: 100),
      ),
    );
  }
}
