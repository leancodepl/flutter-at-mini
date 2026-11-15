import 'dart:math' as math;

import 'package:lecture_week7/widgets/demo_scaffold.dart';
import 'package:material_ui/material_ui.dart';

class const AnimationControllerDemo({super.key}) extends StatefulWidget {
  @override
  State<AnimationControllerDemo> createState() =>
      _AnimationControllerDemoState();
}

class _AnimationControllerDemoState()
    extends State<AnimationControllerDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return ExplicitDemoScaffold(
      actions: [
        ActionButton(
          label: 'Forward',
          icon: Icons.play_arrow,
          onPressed: () => _controller.forward(from: 0),
          isPrimary: true,
        ),
        ActionButton(
          label: 'Reverse',
          icon: Icons.replay,
          onPressed: () => _controller.reverse(from: 1),
        ),
        ActionButton(
          label: 'Repeat',
          icon: Icons.repeat,
          onPressed: () => _controller.repeat(),
        ),
        ActionButton(
          label: 'Stop',
          icon: Icons.stop,
          onPressed: () => _controller.stop(),
        ),
      ],
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(value: _controller.value),
              ),
              const SizedBox(height: 16),
              Text(
                'Value: ${_controller.value.toStringAsFixed(3)}',
                style: TextTheme.of(context).labelLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
              const SizedBox(height: 32),
              Transform.rotate(
                angle: _controller.value * 2 * math.pi,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: ShapeDecoration(
                    color: Color.lerp(
                      colorScheme.primaryContainer,
                      colorScheme.inverseSurface,
                      _controller.value,
                    ),
                    shape: MaterialShapeBorder(
                      shape: MaterialShapes.cookie9Sided,
                    ),
                  ),
                  child: Icon(
                    Icons.settings,
                    color: Color.lerp(
                      colorScheme.onPrimaryContainer,
                      colorScheme.onInverseSurface,
                      _controller.value,
                    ),
                    size: 44,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
