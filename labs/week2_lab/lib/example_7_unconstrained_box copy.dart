import 'package:flutter/material.dart';
import 'package:week2_lab/utils/constraint_viewer.dart';
import 'package:week2_lab/utils/tight_constraints.dart';

class Example7 extends StatelessWidget {
  const Example7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TightConstraints(
      child: UnconstrainedBox(
        constrainedAxis: null, // Axis.horizontal
        clipBehavior: Clip.none, // hardEdge
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
