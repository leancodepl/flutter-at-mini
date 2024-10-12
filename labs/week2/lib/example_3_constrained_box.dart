import 'package:flutter/material.dart';
import 'package:week2/utils/constraint_viewer.dart';

class Example3 extends StatelessWidget {
  const Example3({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(const Size(200, 200)),
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
