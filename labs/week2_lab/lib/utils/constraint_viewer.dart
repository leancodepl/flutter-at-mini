// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ConstraintsViewer extends SingleChildRenderObjectWidget {
  const ConstraintsViewer({
    Key? key,
    this.tag,
    Widget? child,
  }) : super(
          key: key,
          child: child,
        );

  final String? tag;

  @override
  RenderPositionedBox createRenderObject(BuildContext context) =>
      RenderPositionedBox(tag: tag);
}

class RenderPositionedBox extends RenderShiftedBox {
  RenderPositionedBox({
    required this.tag,
    RenderBox? child,
  }) : super(child);

  final String? tag;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final child = this.child;

    if (child != null) {
      return child.getDryLayout(constraints);
    } else {
      return constraints.biggest;
    }
  }

  @override
  void performLayout() {
    final child = this.child;

    if (child != null) {
      child.layout(constraints, parentUsesSize: true);

      size = child.size;

      print(
        'ConstraintsViewer ${tag != null ? '$tag ' : ''}received constraints $constraints',
      );
      print('ConstraintsViewer ${tag != null ? '$tag ' : ''}child size $size');
    } else {
      size = constraints.biggest;
    }
  }
}
