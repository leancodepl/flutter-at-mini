import 'package:flutter/material.dart';

class const Example4({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tight(const Size(300, 200)),
      color: Colors.red,
      child: Container(width: 200, height: 100, color: Colors.green),
    );
  }
}
