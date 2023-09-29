import 'package:flutter/material.dart';
import 'package:week2_lab/utils/constraint_viewer.dart';
import 'package:week2_lab/utils/tight_constraints.dart';

class Example6 extends StatelessWidget {
  const Example6({super.key});

  @override
  Widget build(BuildContext context) {
    return TightConstraints(
      child: ConstraintsViewer(
        tag: 'outside',
        // Center
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
