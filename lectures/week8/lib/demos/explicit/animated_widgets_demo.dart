import 'package:flutter/material.dart';
import '../../widgets/demo_scaffold.dart';

class AnimatedWidgetsDemo extends StatefulWidget {
  const AnimatedWidgetsDemo({super.key});

  @override
  State<AnimatedWidgetsDemo> createState() => _AnimatedWidgetsDemoState();
}

class _AnimatedWidgetsDemoState extends State<AnimatedWidgetsDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
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
          label: _controller.isAnimating ? 'Pause' : 'Play',
          icon: _controller.isAnimating ? Icons.pause : Icons.play_arrow,
          onPressed: () {
            setState(() {
              if (_controller.isAnimating) {
                _controller.stop();
              } else {
                _controller.repeat(reverse: true);
              }
            });
          },
        ),
      ],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _TransitionShowcase(
            label: 'Scale',
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.5, end: 1).animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
              ),
              child: _buildBox(const Color(0xFFF85149)),
            ),
          ),
          _TransitionShowcase(
            label: 'Rotation',
            child: RotationTransition(
              turns: _controller,
              child: _buildBox(const Color(0xFF7EE787)),
            ),
          ),
          _TransitionShowcase(
            label: 'Fade',
            child: FadeTransition(
              opacity: _controller,
              child: _buildBox(const Color(0xFF58A6FF)),
            ),
          ),
          _TransitionShowcase(
            label: 'Slide',
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -0.3),
                end: const Offset(0, 0.3),
              ).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Curves.easeInOut,
                ),
              ),
              child: _buildBox(const Color(0xFFA371F7)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBox(Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: color.withAlpha(80), blurRadius: 16)],
      ),
    );
  }
}

class _TransitionShowcase extends StatelessWidget {
  const _TransitionShowcase({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 70, height: 70, child: Center(child: child)),
        const SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(color: Color(0xFF8B949E), fontSize: 13),
        ),
      ],
    );
  }
}


