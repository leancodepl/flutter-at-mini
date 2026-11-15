import 'package:lecture_week7/widgets/demo_scaffold.dart';
import 'package:material_ui/material_ui.dart';

class const AnimatedContainerDemo({super.key}) extends StatefulWidget {
  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState() extends State<AnimatedContainerDemo> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return DemoScaffold(
      onToggle: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
        width: _expanded ? 200 : 100,
        height: _expanded ? 200 : 100,
        decoration: ShapeDecoration(
          color: _expanded
              ? colorScheme.tertiaryContainer
              : colorScheme.primaryContainer,
          shape: MaterialShapeBorder(
            shape: _expanded
                ? MaterialShapes.cookie9Sided
                : MaterialShapes.square,
            side: .new(
              width: _expanded ? 16 : 2,
              color: _expanded
                  ? colorScheme.onTertiaryContainer
                  : colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        child: Icon(
          Icons.flutter_dash,
          color: _expanded
              ? colorScheme.onTertiaryContainer
              : colorScheme.onPrimaryContainer,
          size: 40,
        ),
      ),
    );
  }
}
