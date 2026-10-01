import 'package:flutter/material.dart';
import 'package:labs_week2/utils/constraint_viewer.dart';

class const Example5({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstraintsViewer(
          child: Container(
            width: constraints.maxWidth / 2,
            height: constraints.maxHeight / 3,
            color: Colors.red,
          ),
        );
      },
    );
  }
}
