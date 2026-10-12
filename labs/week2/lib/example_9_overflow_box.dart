import 'package:flutter/material.dart';
import 'package:labs_week2/utils/constraint_viewer.dart';
import 'package:labs_week2/utils/tight_constraints.dart';

class const Example9({super.key}) extends StatelessWidget {
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
                child: Container(width: 400, height: 800, color: Colors.red),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
