import 'package:flutter/physics.dart';
import 'package:lecture_week7/widgets/demo_scaffold.dart';
import 'package:material_ui/material_ui.dart';

class const SpringDemo({super.key}) extends StatefulWidget {
  @override
  State<SpringDemo> createState() => _SpringDemoState();
}

class _SpringDemoState()
    extends State<SpringDemo>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<double>> _animations;
  bool _isAnimating = false;

  static final _springs = [
    (
      name: 'Bouncy',
      desc: 'Low damping',
      spring: SpringDescription.withDampingRatio(
        mass: 1,
        stiffness: 200,
        ratio: 0.2,
      ),
    ),
    (
      name: 'Smooth',
      desc: 'Critical damping',
      spring: SpringDescription.withDampingRatio(mass: 1, stiffness: 200),
    ),
    (
      name: 'Heavy',
      desc: 'High mass',
      spring: SpringDescription.withDampingRatio(mass: 100, stiffness: 200),
    ),
  ];

  static const _ballSize = 50.0;
  static const _travel = 100.0;
  static const _trackHeight = _ballSize + _travel * 1.6;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      3,
      (_) => AnimationController.unbounded(vsync: this),
    );
    _animations = _controllers
        .map((c) => Tween<double>(begin: 0, end: 1).animate(c))
        .toList();

    for (final controller in _controllers) {
      controller
        ..addListener(() => setState(() {}))
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed ||
              status == AnimationStatus.dismissed) {
            _checkAllDone();
          }
        });
    }
  }

  void _checkAllDone() {
    final allDone = _controllers.every(
      (c) =>
          c.status == AnimationStatus.completed ||
          c.status == AnimationStatus.dismissed,
    );
    if (allDone && _isAnimating) {
      setState(() => _isAnimating = false);
    }
  }

  void _animate() {
    setState(() => _isAnimating = true);
    for (var i = 0; i < _controllers.length; i++) {
      final simulation = SpringSimulation(_springs[i].spring, 0, 1, 0);
      _controllers[i].animateWith(simulation);
    }
  }

  void _reset() {
    for (final controller in _controllers) {
      controller.value = 0;
    }
    setState(() => _isAnimating = false);
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return ExplicitDemoScaffold(
      actions: [
        ActionButton(
          label: 'Animate',
          icon: Icons.play_arrow,
          onPressed: _animate,
          isPrimary: true,
        ),
        ActionButton(label: 'Reset', icon: Icons.refresh, onPressed: _reset),
      ],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (i) {
          final spring = _springs[i];
          final value = _animations[i].value;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(spring.name, style: textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(
                spring.desc,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: _trackHeight,
                width: 60,
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 27,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: 6,
                        decoration: BoxDecoration(
                          color: colorScheme.outlineVariant,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                    Positioned(
                      top: _travel + _ballSize / 2 - 1,
                      child: Container(
                        width: 40,
                        height: 2,
                        color: colorScheme.outline,
                      ),
                    ),
                    Positioned(
                      top: value * _travel,
                      child: Container(
                        width: _ballSize,
                        height: _ballSize,
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
