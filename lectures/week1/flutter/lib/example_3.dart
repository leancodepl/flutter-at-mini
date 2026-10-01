import 'package:flutter/material.dart';

class const Example3({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tight(const Size(300, 200)),
      // constraints: const BoxConstraints(minWidth: 300, minHeight: 200),
      color: Colors.red,
      // Uncomment to see how Align fills available space
      child: Align(
        alignment: Alignment.centerRight, // Alignment(1, 0)
        child: Container(
          width: 350,
          height: double.infinity,
          color: Colors.green,
        ),
      ),
    );
  }
}
