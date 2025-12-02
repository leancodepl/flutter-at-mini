import 'package:flutter/material.dart';
import '../../widgets/demo_scaffold.dart';

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      onToggle: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
        width: _expanded ? 200 : 100,
        height: _expanded ? 200 : 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _expanded
                ? [const Color(0xFF7EE787), const Color(0xFF3FB950)]
                : [const Color(0xFF58A6FF), const Color(0xFF1F6FEB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(_expanded ? 32 : 8),
          boxShadow: [
            BoxShadow(
              color: (_expanded
                      ? const Color(0xFF7EE787)
                      : const Color(0xFF58A6FF))
                  .withAlpha(80),
              blurRadius: 24,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const Icon(Icons.flutter_dash, color: Colors.white, size: 40),
      ),
    );
  }
}


