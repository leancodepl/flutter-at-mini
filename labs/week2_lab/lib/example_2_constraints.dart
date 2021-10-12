import 'package:flutter/material.dart';
import 'package:week2_lab/utils/constraint_viewer.dart';

class Example2 extends StatelessWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstraintsViewer(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
    );
  }
}
