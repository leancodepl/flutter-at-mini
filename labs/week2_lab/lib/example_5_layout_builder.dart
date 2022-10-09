import 'package:flutter/material.dart';

class Example5 extends StatelessWidget {
  const Example5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth / 2,
          height: constraints.maxHeight / 3,
          color: Colors.red,
        );
      },
    );
  }
}
