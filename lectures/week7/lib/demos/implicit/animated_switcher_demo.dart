import 'package:lecture_week7/widgets/demo_scaffold.dart';
import 'package:material_ui/material_ui.dart';

class const AnimatedSwitcherDemo({super.key}) extends StatefulWidget {
  @override
  State<AnimatedSwitcherDemo> createState() => _AnimatedSwitcherDemoState();
}

class _AnimatedSwitcherDemoState() extends State<AnimatedSwitcherDemo> {
  int _count = 0;

  static final _shapes = [
    MaterialShapes.cookie9Sided,
    MaterialShapes.pentagon,
    MaterialShapes.cookie6Sided,
    MaterialShapes.puffy,
    MaterialShapes.sunny,
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

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
          decoration: ShapeDecoration(
            color: colorScheme.tertiaryContainer,
            shape: MaterialShapeBorder(shape: _shapes[_count % _shapes.length]),
          ),
          child: Center(
            child: Text(
              '$_count',
              style: TextTheme.of(context).displayLarge?.copyWith(
                color: colorScheme.onTertiaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
