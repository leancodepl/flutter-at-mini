import 'dart:math';

import 'package:flutter/material.dart';

class Task2 extends StatelessWidget {
  const Task2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Task2v1();
    // return const Task2v2();
  }
}

const _count = 3;

// region Variant 1: imperative loop

class Task2v1 extends StatelessWidget {
  const Task2v1({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final BoxConstraints(:maxWidth, :maxHeight) = constraints;

        var child = _BoxV1(
          index: _count,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
        );

        for (var i = _count - 1; i > 0; i--) {
          child = _BoxV1(
            index: i,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            child: Align(alignment: const FractionalOffset(2, 2), child: child),
          );
        }

        return child;
      },
    );
  }
}

class _BoxV1 extends StatelessWidget {
  const _BoxV1({
    required this.index,
    required this.maxWidth,
    required this.maxHeight,
    this.child,
  });

  final int index;
  final double maxWidth;
  final double maxHeight;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: maxWidth / pow(2, index),
      height: maxHeight / pow(2, index),
      color: Colors.red,
      child: child,
    );
  }
}

// endregion

// region Variant 2: recursive

class Task2v2 extends StatelessWidget {
  const Task2v2({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final BoxConstraints(:maxWidth, :maxHeight) = constraints;

        return _BoxV2(index: _count, maxWidth: maxWidth, maxHeight: maxHeight);
      },
    );
  }
}

class _BoxV2 extends StatelessWidget {
  const _BoxV2({
    required this.index,
    required this.maxWidth,
    required this.maxHeight,
  });

  final int index;
  final double maxWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: maxWidth / 2,
      height: maxHeight / 2,
      color: Colors.red,
      child: index <= 1
          ? null
          : Align(
              alignment: const FractionalOffset(2, 2),
              child: _BoxV2(
                index: index - 1,
                maxWidth: maxWidth / 2,
                maxHeight: maxHeight / 2,
              ),
            ),
    );
  }
}

// endregion
