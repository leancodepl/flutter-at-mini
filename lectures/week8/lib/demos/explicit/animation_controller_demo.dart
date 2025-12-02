import 'dart:math' as math;

import 'package:flutter/material.dart';
import '../../widgets/demo_scaffold.dart';

class AnimationControllerDemo extends StatefulWidget {
  const AnimationControllerDemo({super.key});

  @override
  State<AnimationControllerDemo> createState() =>
      _AnimationControllerDemoState();
}

class _AnimationControllerDemoState extends State<AnimationControllerDemo>
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
    return ExplicitDemoScaffold(
      actions: [
        ActionButton(
          label: 'Forward',
          icon: Icons.play_arrow,
          onPressed: () => _controller.forward(from: 0),
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
          isDestructive: true,
        ),
      ],
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 200,
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xFF21262D),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: _controller.value,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF58A6FF), Color(0xFF7EE787)],
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Value: ${_controller.value.toStringAsFixed(3)}',
                style: const TextStyle(color: Color(0xFF8B949E), fontSize: 14),
              ),
              const SizedBox(height: 32),
              Transform.rotate(
                angle: _controller.value * 2 * math.pi,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.lerp(
                          const Color(0xFF58A6FF),
                          const Color(0xFF7EE787),
                          _controller.value,
                        )!,
                        Color.lerp(
                          const Color(0xFF1F6FEB),
                          const Color(0xFF3FB950),
                          _controller.value,
                        )!,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Color.lerp(
                          const Color(0xFF58A6FF),
                          const Color(0xFF7EE787),
                          _controller.value,
                        )!.withAlpha(80),
                        blurRadius: 24,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.settings,
                    color: Colors.white,
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
