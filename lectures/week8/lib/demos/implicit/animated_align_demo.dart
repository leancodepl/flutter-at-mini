import 'package:flutter/material.dart';
import '../../widgets/demo_scaffold.dart';

class AnimatedAlignDemo extends StatefulWidget {
  const AnimatedAlignDemo({super.key});

  @override
  State<AnimatedAlignDemo> createState() => _AnimatedAlignDemoState();
}

class _AnimatedAlignDemoState extends State<AnimatedAlignDemo> {
  int _alignmentIndex = 0;

  static const _alignments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
    Alignment.center,
  ];

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      onToggle: () => setState(
        () => _alignmentIndex = (_alignmentIndex + 1) % _alignments.length,
      ),
      buttonLabel: 'Move',
      child: Container(
        width: 280,
        height: 280,
        decoration: BoxDecoration(
          color: const Color(0xFF21262D),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF30363D)),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutBack,
          alignment: _alignments[_alignmentIndex],
          child: Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFFA657), Color(0xFFD29922)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFA657).withAlpha(60),
                  blurRadius: 16,
                ),
              ],
            ),
            child: const Icon(Icons.navigation, color: Colors.white),
          ),
        ),
      ),
    );
  }
}


