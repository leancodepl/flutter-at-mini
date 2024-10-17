import 'package:flutter/material.dart';

class Example3 extends StatelessWidget {
  const Example3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tight(const Size(300, 200)),
      // constraints: const BoxConstraints(minWidth: 300, minHeight: 200),
      color: Colors.red,
      // Uncomment to see how Align fills available space
      child: Align(
        alignment: const Alignment(1, 0),
        child: Container(
          width: 350,
          height: double.infinity,
          color: Colors.green,
        ),
      ),
    );
  }
}
