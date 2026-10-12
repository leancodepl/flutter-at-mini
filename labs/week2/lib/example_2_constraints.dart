import 'package:flutter/material.dart';
import 'package:labs_week2/utils/constraint_viewer.dart';

class const Example2({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstraintsViewer(
      child: Container(width: 600, height: 300, color: Colors.red),
    );
  }
}
