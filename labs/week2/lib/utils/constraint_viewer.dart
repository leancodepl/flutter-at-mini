import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ConstraintsViewer extends SingleChildRenderObjectWidget {
  const ConstraintsViewer({
    super.key,
    this.tag,
    super.child,
  });

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
    } else {
      size = constraints.biggest;
    }

    if (kDebugMode) {
      debugPrint(
        [
          if (tag != null) '$tag',
          'constraints: $constraints',
          if (child != null) 'child size: $size' else 'size: $size',
        ].join(' | '),
      );
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);

    if (!kDebugMode) {
      return;
    }

    final builder = ParagraphBuilder(ParagraphStyle(fontSize: 10));

    if (tag != null) {
      builder.addText('$tag\n');
    }
    builder.addText('constraints: $constraints\n');
    if (child != null) {
      builder.addText('child size: $size');
    } else {
      builder.addText('size: $size');
    }

    final paragraph = builder.build()
      ..layout(ParagraphConstraints(width: size.width));

    context.canvas
      ..drawRect(
        offset &
            Size(
              min(paragraph.width, paragraph.maxIntrinsicWidth),
              paragraph.height,
            ),
        Paint()..color = Colors.black38,
      )
      ..drawParagraph(paragraph, offset);
  }
}
