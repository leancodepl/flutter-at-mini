// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:week2_lab/utils/constraint_viewer.dart';
import 'package:week2_lab/utils/tight_constraints.dart';

class Example8 extends StatelessWidget {
  const Example8({super.key});

  @override
  Widget build(BuildContext context) {
    return TightConstraints(
      child: UnconstrainedBox(
        constrainedAxis: null, //Axis.horizontal,
        child: ConstraintsViewer(
          child: Container(
            width: 100,
            height: 1000,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
