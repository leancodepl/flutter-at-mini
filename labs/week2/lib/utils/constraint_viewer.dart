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

class RenderConstraintsViewer extends RenderProxyBox {
  RenderConstraintsViewer({
    required this.tag,
    RenderBox? child,
  }) : super(child);

  final String? tag;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return child?.getDryLayout(constraints) ?? constraints.biggest;
  }

  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    size = child?.size ?? constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);

    if (!kDebugMode) {
      return;
    }

    final parts = [
      if (tag != null) '$tag',
      'constraints: $constraints',
      if (child != null) 'child size: $size' else 'size: $size',
    ];

    final builder = ParagraphBuilder(ParagraphStyle(fontSize: 20))
      ..addText(parts.join('\n'));

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

    debugPrint(parts.join(' | '));
  }
}
