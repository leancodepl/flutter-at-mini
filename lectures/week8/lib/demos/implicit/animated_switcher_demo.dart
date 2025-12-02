import 'package:flutter/material.dart';
import '../../widgets/demo_scaffold.dart';

class AnimatedSwitcherDemo extends StatefulWidget {
  const AnimatedSwitcherDemo({super.key});

  @override
  State<AnimatedSwitcherDemo> createState() => _AnimatedSwitcherDemoState();
}

class _AnimatedSwitcherDemoState extends State<AnimatedSwitcherDemo> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      onToggle: () => setState(() => _count++),
      buttonLabel: 'Increment',
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: Container(
          key: ValueKey<int>(_count),
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFA371F7), Color(0xFF8957E5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFA371F7).withAlpha(60),
                blurRadius: 24,
              ),
            ],
          ),
          child: Center(
            child: Text(
              '$_count',
              style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


