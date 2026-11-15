import 'dart:math' as math;

import 'package:lecture_week7/widgets/demo_scaffold.dart';
import 'package:material_ui/material_ui.dart';

class const TweenAnimationBuilderDemo({super.key}) extends StatefulWidget {
  @override
  State<TweenAnimationBuilderDemo> createState() =>
      _TweenAnimationBuilderDemoState();
}

class _TweenAnimationBuilderDemoState()
    extends State<TweenAnimationBuilderDemo> {
  double _targetValue = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return DemoScaffold(
      onToggle: () => setState(() => _targetValue += 1),
      buttonLabel: 'Rotate',
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: _targetValue),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOutBack,
        builder: (context, value, child) {
          return Transform.rotate(angle: value * 2 * math.pi, child: child);
        },
        child: Container(
          width: 140,
          height: 140,
          decoration: ShapeDecoration(
            color: colorScheme.primaryContainer,
            shape: MaterialShapeBorder(shape: MaterialShapes.sunny),
          ),
          child: Icon(
            Icons.refresh,
            color: colorScheme.onPrimaryContainer,
            size: 48,
          ),
        ),
      ),
    );
  }
}
