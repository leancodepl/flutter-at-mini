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
  RenderConstraintsViewer createRenderObject(BuildContext context) =>
      RenderConstraintsViewer(tag: tag);
}

class RenderConstraintsViewer extends RenderShiftedBox {
  RenderConstraintsViewer({
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

  List<String> get _descriptionParts => [
        if (tag != null) '$tag',
        'constraints: $constraints',
        if (child != null) 'child size: $size' else 'size: $size',
      ];

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
      debugPrint(_descriptionParts.join(' | '));
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);

    if (!kDebugMode) {
      return;
    }

    final builder = ParagraphBuilder(ParagraphStyle(fontSize: 10))
      ..addText(_descriptionParts.join('\n'));

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
