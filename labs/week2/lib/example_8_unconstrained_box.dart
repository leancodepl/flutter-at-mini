import 'package:flutter/material.dart';
import 'package:week2/utils/constraint_viewer.dart';
import 'package:week2/utils/tight_constraints.dart';

class Example8 extends StatelessWidget {
  const Example8({super.key});

  @override
  Widget build(BuildContext context) {
    return TightConstraints(
      child: UnconstrainedBox(
        // constrainedAxis: null,
        // constrainedAxis: Axis.horizontal,
        child: ConstraintsViewer(
          child: Container(
            width: 100,
            height: 800,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
