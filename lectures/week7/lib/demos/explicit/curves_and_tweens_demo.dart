import 'package:lecture_week7/widgets/demo_scaffold.dart';
import 'package:material_ui/material_ui.dart';

class const CurvesAndTweensDemo({super.key}) extends StatefulWidget {
  @override
  State<CurvesAndTweensDemo> createState() => _CurvesAndTweensDemoState();
}

class _CurvesAndTweensDemoState()
    extends State<CurvesAndTweensDemo>
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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setupAnimations();
  }

  void _setupAnimations() {
    final colorScheme = ColorScheme.of(context);
    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: _selectedCurve,
    );

    _animation = Tween<double>(begin: -100, end: 100).animate(curvedAnimation);

    _colorAnimation = ColorTween(
      begin: colorScheme.tertiary,
      end: colorScheme.primary,
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
    final colorScheme = ColorScheme.of(context);

    return ExplicitDemoScaffold(
      actions: [
        ActionButton(
          label: 'Animate',
          icon: Icons.play_arrow,
          onPressed: () => _controller.forward(from: 0),
          isPrimary: true,
        ),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                for (final MapEntry(key: name, value: curve) in _curves.entries)
                  ChoiceChip(
                    label: Text(name),
                    selected: _selectedCurve == curve,
                    onSelected: (_) {
                      setState(() {
                        _selectedCurve = curve;
                        _setupAnimations();
                      });
                    },
                  ),
              ],
            ),
          ),
          const SizedBox(height: 48),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                width: 320,
                height: 120,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 260,
                      height: 4,
                      decoration: BoxDecoration(
                        color: colorScheme.outlineVariant,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(_animation.value, 0),
                      child: Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: _colorAnimation.value,
                            shape: BoxShape.circle,
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
