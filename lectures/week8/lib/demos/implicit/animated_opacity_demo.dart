import 'package:flutter/material.dart';
import '../../widgets/demo_scaffold.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  const AnimatedOpacityDemo({super.key});

  @override
  State<AnimatedOpacityDemo> createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      onToggle: () => setState(() => _visible = !_visible),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        opacity: _visible ? 1.0 : 0.0,
        curve: Curves.easeInOut,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFF778BA), Color(0xFFFF7B72)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFF778BA).withAlpha(60),
                blurRadius: 24,
              ),
            ],
          ),
          child: const Center(
            child: Text('👻', style: TextStyle(fontSize: 48)),
          ),
        ),
      ),
    );
  }
}


