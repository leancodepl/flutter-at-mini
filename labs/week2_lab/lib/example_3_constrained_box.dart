import 'package:flutter/material.dart';
import 'package:week2_lab/utils/constraint_viewer.dart';

class Example3 extends StatelessWidget {
  const Example3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SizedBox
    return ConstrainedBox(
      constraints: BoxConstraints.tight(const Size(200, 200)), // loose
      child: ConstraintsViewer(
        child: Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
      ),
    );
  }
}
