import 'package:flutter/material.dart';
import '../../widgets/demo_scaffold.dart';

class CurvesAndTweensDemo extends StatefulWidget {
  const CurvesAndTweensDemo({super.key});

  @override
  State<CurvesAndTweensDemo> createState() => _CurvesAndTweensDemoState();
}

class _CurvesAndTweensDemoState extends State<CurvesAndTweensDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _scaleAnimation;

  Curve _selectedCurve = Curves.easeInOutCubic;

  static const _curves = {
    'linear': Curves.linear,
    'easeIn': Curves.easeIn,
    'easeOut': Curves.easeOut,
    'easeInOut': Curves.easeInOut,
    'easeInOutCubic': Curves.easeInOutCubic,
    'bounceOut': Curves.bounceOut,
    'elasticOut': Curves.elasticOut,
    'easeInOutBack': Curves.easeInOutBack,
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _setupAnimations();
  }

  void _setupAnimations() {
    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: _selectedCurve,
    );

    _animation = Tween<double>(begin: -100, end: 100).animate(curvedAnimation);

    _colorAnimation = ColorTween(
      begin: const Color(0xFFF85149),
      end: const Color(0xFF7EE787),
    ).animate(curvedAnimation);

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: _selectedCurve));
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
          label: 'Animate',
          icon: Icons.play_arrow,
          onPressed: () => _controller.forward(from: 0),
        ),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: _curves.entries.map((entry) {
              final isSelected = _selectedCurve == entry.value;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCurve = entry.value;
                    _setupAnimations();
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF238636)
                        : const Color(0xFF21262D),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF3FB950)
                          : const Color(0xFF30363D),
                    ),
                  ),
                  child: Text(
                    entry.key,
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF8B949E),
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 48),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                width: 320,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFF21262D),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF30363D)),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 260,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFF30363D),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(_animation.value, 0),
                      child: Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: _colorAnimation.value,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: (_colorAnimation.value ?? Colors.white)
                                    .withAlpha(100),
                                blurRadius: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
