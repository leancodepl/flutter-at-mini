import 'package:lecture_week7/widgets/demo_scaffold.dart';
import 'package:material_ui/material_ui.dart';

class const AnimatedWidgetsDemo({super.key}) extends StatefulWidget {
  @override
  State<AnimatedWidgetsDemo> createState() => _AnimatedWidgetsDemoState();
}

class _AnimatedWidgetsDemoState()
    extends State<AnimatedWidgetsDemo>
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
          isPrimary: true,
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
              child: _buildBox(context, MaterialShapes.cookie4Sided),
            ),
          ),
          _TransitionShowcase(
            label: 'Rotation',
            child: RotationTransition(
              turns: _controller,
              child: _buildBox(context, MaterialShapes.clover4Leaf),
            ),
          ),
          _TransitionShowcase(
            label: 'Fade',
            child: FadeTransition(
              opacity: _controller,
              child: _buildBox(context, MaterialShapes.gem),
            ),
          ),
          _TransitionShowcase(
            label: 'Slide',
            child: SlideTransition(
              position:
                  Tween<Offset>(
                    begin: const Offset(0, -0.3),
                    end: const Offset(0, 0.3),
                  ).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: Curves.easeInOut,
                    ),
                  ),
              child: _buildBox(context, MaterialShapes.pill),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBox(BuildContext context, RoundedPolygon shape) {
    return Container(
      width: 120,
      height: 120,
      decoration: ShapeDecoration(
        color: ColorScheme.of(context).primary,
        shape: MaterialShapeBorder(shape: shape),
      ),
    );
  }
}

class const _TransitionShowcase({
  required final String label,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: child),
        const SizedBox(height: 36),
        Text(
          label,
          style: TextTheme.of(context).labelLarge
              ?.copyWith(color: ColorScheme.of(context).onSurfaceVariant),
        ),
      ],
    );
  }
}
