import 'dart:math' as math;

import 'package:flutter/material.dart';

class Task1 extends StatelessWidget {
  const Task1({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return switch (constraints.maxWidth) {
          < 600 => const VerticalLayoutWidget(),
          _ => const WideLayoutWidget(),
        };
      },
    );
  }
}

class VerticalLayoutWidget extends StatelessWidget {
  const VerticalLayoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final BoxConstraints(:maxWidth, :maxHeight) = constraints;

          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: math.max(maxHeight - 64, 0),
              width: maxWidth,
              color: Colors.red,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: maxHeight / 2,
                  color: Colors.green,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 64,
                      width: 120,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class WideLayoutWidget extends StatelessWidget {
  const WideLayoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final BoxConstraints(:maxWidth, :maxHeight) = constraints;

          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: math.max(maxHeight - 64, 0),
              width: maxWidth,
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: math.max(
                    maxWidth * 3 / 4,
                    maxWidth - 300,
                  ),
                  color: Colors.green,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 64,
                      width: 120,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
