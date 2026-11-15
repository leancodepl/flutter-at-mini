import 'package:lecture_week7/widgets/demo_scaffold.dart';
import 'package:material_ui/material_ui.dart';

class const AnimatedOpacityDemo({super.key}) extends StatefulWidget {
  @override
  State<AnimatedOpacityDemo> createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState() extends State<AnimatedOpacityDemo> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return DemoScaffold(
      onToggle: () => setState(() => _visible = !_visible),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        opacity: _visible ? 1.0 : 0.0,
        curve: Curves.easeInOut,
        child: Container(
          width: 150,
          height: 150,
          decoration: ShapeDecoration(
            color: colorScheme.secondaryContainer,
            shape: MaterialShapeBorder(shape: MaterialShapes.ghostish),
          ),
          child: Icon(
            Icons.visibility_outlined,
            color: colorScheme.onSecondaryContainer,
            size: 56,
          ),
        ),
      ),
    );
  }
}
