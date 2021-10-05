import 'package:flutter/material.dart';
import 'package:week2_lab/utils/constraint_viewer.dart';
import 'package:week2_lab/utils/tight_constraints.dart';

class Example6 extends StatelessWidget {
  const Example6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TightConstraints(
      child: Stack(
        fit: StackFit.loose, // tight, passthrough
        clipBehavior: Clip.hardEdge, // none
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
          Positioned(
            top: 16,
            left: 64,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ),
          ConstraintsViewer(
            child: Container(
              width: 100,
              height: 100, // 10000
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
