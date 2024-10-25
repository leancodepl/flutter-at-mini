import 'dart:math';

import 'package:flutter/material.dart';

class Task2 extends StatelessWidget {
  const Task2({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final BoxConstraints(:maxWidth, :maxHeight) = constraints;

        const count = 10;

        Widget makeBox(int index, {Widget? child}) {
          return Container(
            width: maxWidth / pow(2, index),
            height: maxHeight / pow(2, index),
            color: Colors.red,
            child: child,
          );
        }

        var child = makeBox(count);

        for (var i = count - 1; i > 0; i--) {
          child = makeBox(
            i,
            child: Align(
              alignment: const FractionalOffset(2, 2),
              child: child,
            ),
          );
        }

        return child;
      },
    );
  }
}
