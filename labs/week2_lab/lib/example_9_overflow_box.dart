import 'package:flutter/material.dart';
import 'package:week2_lab/utils/constraint_viewer.dart';
import 'package:week2_lab/utils/tight_constraints.dart';

class Example9 extends StatelessWidget {
  const Example9({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 400,
        color: Colors.blue,
        child: TightConstraints(
          child: OverflowBox(
            minWidth: 0,
            maxWidth: double.infinity, // null
            minHeight: 0,
            maxHeight: double.infinity, // null
            child: ConstraintsViewer(
              child: Container(
                width: 100,
                height: 1000,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
