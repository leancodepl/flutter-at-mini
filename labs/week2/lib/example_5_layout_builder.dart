import 'package:flutter/material.dart';
import 'package:week2/utils/constraint_viewer.dart';

class Example5 extends StatelessWidget {
  const Example5({super.key});

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
