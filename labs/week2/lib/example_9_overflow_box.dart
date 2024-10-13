import 'package:flutter/material.dart';
import 'package:week2/utils/constraint_viewer.dart';
import 'package:week2/utils/tight_constraints.dart';

class Example9 extends StatelessWidget {
  const Example9({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstraintsViewer(
        child: Container(
          width: 1000,
          height: 400,
          color: Colors.blue,
          child: TightConstraints(
            child: OverflowBox(
              minWidth: 0,
              maxWidth: double.infinity,
              // maxWidth: null,
              minHeight: 0,
              maxHeight: double.infinity,
              // maxHeight: null,
              child: ConstraintsViewer(
                child: Container(
                  width: 400,
                  height: 800,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
