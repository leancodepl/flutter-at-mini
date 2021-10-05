import 'package:flutter/material.dart';
import 'package:week2_lab/utils/constraint_viewer.dart';
import 'package:week2_lab/utils/tight_constraints.dart';

class Example3 extends StatelessWidget {
  const Example3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TightConstraints(
      // SizedBox
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(const Size(100, 100)),
        child: ConstraintsViewer(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
