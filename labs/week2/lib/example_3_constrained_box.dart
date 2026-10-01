import 'package:flutter/material.dart';
import 'package:labs_week2/utils/constraint_viewer.dart';

class const Example3({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(const Size(500, 400)),
      child: ConstraintsViewer(
        child: Container(width: 50, height: 50, color: Colors.red),
      ),
    );
  }
}
