import 'package:flutter/material.dart';
import 'package:week2_lab/utils/constraint_viewer.dart';

class Example5 extends StatelessWidget {
  const Example5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstraintsViewer(
      tag: 'column',
      // Row
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:
            MainAxisAlignment.start, // spaceBetween, spaceAround, spaceEvenly
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstraintsViewer(
            tag: 'exact',
            child: Container(
              width: 100,
              height: 100, // 10000
              color: Colors.red,
            ),
          ),
          Expanded(
            child: ConstraintsViewer(
              tag: 'expanded',
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
          ),
          Flexible(
            child: ConstraintsViewer(
              tag: 'flexible',
              child: Container(
                width: 100,
                height: 100, // 100
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
