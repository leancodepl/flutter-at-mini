import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import '../../widgets/demo_scaffold.dart';

class SpringDemo extends StatefulWidget {
  const SpringDemo({super.key});

  @override
  State<SpringDemo> createState() => _SpringDemoState();
}

class _SpringDemoState extends State<SpringDemo> with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<double>> _animations;
  bool _isAnimating = false;

  static const _springs = [
    (
      name: 'Bouncy',
      desc: 'Low damping',
      color: Color(0xFFF85149),
      spring: SpringDescription(mass: 1, stiffness: 200, damping: 5),
    ),
    (
      name: 'Smooth',
      desc: 'Critical damping',
      color: Color(0xFF7EE787),
      spring: SpringDescription(mass: 1, stiffness: 200, damping: 20),
    ),
    (
      name: 'Heavy',
      desc: 'High mass',
      color: Color(0xFF58A6FF),
      spring: SpringDescription(mass: 100, stiffness: 200, damping: 15),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(3, (_) => AnimationController(vsync: this));
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
      controller.reset();
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
    return ExplicitDemoScaffold(
      actions: [
        ActionButton(
          label: 'Animate',
          icon: Icons.play_arrow,
          onPressed: _animate,
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
              Text(
                spring.name,
                style: TextStyle(
                  color: spring.color,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                spring.desc,
                style: const TextStyle(color: Color(0xFF8B949E), fontSize: 12),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                width: 60,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      left: 27,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: 6,
                        decoration: BoxDecoration(
                          color: const Color(0xFF30363D),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                    Positioned(
                      top: value * 150,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: spring.color,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: spring.color.withAlpha(100),
                              blurRadius: 16,
                              spreadRadius: 2,
                            ),
                          ],
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


