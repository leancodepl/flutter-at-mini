import 'package:flutter/material.dart';
import '../../widgets/demo_scaffold.dart';

class StaggeredAnimationDemo extends StatefulWidget {
  const StaggeredAnimationDemo({super.key});

  @override
  State<StaggeredAnimationDemo> createState() => _StaggeredAnimationDemoState();
}

class _StaggeredAnimationDemoState extends State<StaggeredAnimationDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _slideAnimations;
  late final List<Animation<double>> _fadeAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _slideAnimations = List.generate(5, (index) {
      final start = index * 0.1;
      final end = start + 0.4;
      return Tween<double>(begin: 50, end: 0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end.clamp(0, 1), curve: Curves.easeOutCubic),
        ),
      );
    });

    _fadeAnimations = List.generate(5, (index) {
      final start = index * 0.1;
      final end = start + 0.4;
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end.clamp(0, 1), curve: Curves.easeOut),
        ),
      );
    });
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
          label: 'Play',
          icon: Icons.play_arrow,
          onPressed: () => _controller.forward(from: 0),
        ),
        ActionButton(
          label: 'Reset',
          icon: Icons.refresh,
          onPressed: () => _controller.reset(),
        ),
      ],
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              const colors = [
                Color(0xFFF85149),
                Color(0xFFFFA657),
                Color(0xFF7EE787),
                Color(0xFF58A6FF),
                Color(0xFFA371F7),
              ];
              return Transform.translate(
                offset: Offset(_slideAnimations[index].value, 0),
                child: Opacity(
                  opacity: _fadeAnimations[index].value,
                  child: Container(
                    width: 240,
                    height: 48,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: colors[index],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: colors[index].withAlpha(60),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Item ${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
