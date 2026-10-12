import 'package:flutter/material.dart';
import 'package:labs_week2/utils/constraint_viewer.dart';

class const Example7({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ConstraintsViewer(
            child: Container(width: 200, height: 200, color: Colors.red),
          ),
          ConstraintsViewer(
            child: Container(width: 200, height: 400, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
