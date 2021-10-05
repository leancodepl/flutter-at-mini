import 'package:flutter/material.dart';
import 'package:week2_lab/utils/constraint_viewer.dart';
import 'package:week2_lab/utils/tight_constraints.dart';

class Example4 extends StatelessWidget {
  const Example4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TightConstraints(
      // Center
      child: ConstraintsViewer(
        tag: 'outside',
        child: Align(
          alignment: Alignment.centerLeft,
          child: ConstraintsViewer(
            tag: 'inside',
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
