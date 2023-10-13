import 'dart:math' as math;

import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth < 600
            ? const VerticalLayoutWidget()
            : const WideLayoutWidget();
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
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: constraints.maxHeight - 64,
              width: constraints.maxWidth,
              color: Colors.red,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: constraints.maxHeight * 2 / 4,
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
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: constraints.maxHeight - 64,
              width: constraints.maxWidth,
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: math.max(
                    constraints.maxWidth * 3 / 4,
                    constraints.maxWidth - 300,
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
