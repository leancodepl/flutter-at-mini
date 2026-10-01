// print used for displaying constraints
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class const ConstraintsViewer({super.key, final String? tag, super.child})
    extends SingleChildRenderObjectWidget {
  @override
  RenderPositionedBox createRenderObject(BuildContext context) =>
      RenderPositionedBox(tag: tag);
}

class RenderPositionedBox({required final String? tag, RenderBox? child})
    extends RenderShiftedBox {
  this : super(child);

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
