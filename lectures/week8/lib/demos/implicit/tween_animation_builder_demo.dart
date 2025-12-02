import 'package:flutter/material.dart';
import '../../widgets/demo_scaffold.dart';

class TweenAnimationBuilderDemo extends StatefulWidget {
  const TweenAnimationBuilderDemo({super.key});

  @override
  State<TweenAnimationBuilderDemo> createState() =>
      _TweenAnimationBuilderDemoState();
}

class _TweenAnimationBuilderDemoState extends State<TweenAnimationBuilderDemo> {
  double _targetValue = 0;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      onToggle: () => setState(() => _targetValue += 1),
      buttonLabel: 'Rotate',
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: _targetValue),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutBack,
        builder: (context, value, child) {
          return Transform.rotate(
            angle: value * 2 * 3.14159,
            child: Transform.scale(scale: 1 + (value % 1) * 0.1, child: child),
          );
        },
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF79C0FF), Color(0xFF58A6FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF58A6FF).withAlpha(60),
                blurRadius: 24,
              ),
            ],
          ),
          child: const Icon(Icons.refresh, color: Colors.white, size: 48),
        ),
      ),
    );
  }
}
