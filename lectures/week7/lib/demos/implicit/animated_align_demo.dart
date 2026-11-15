import 'package:lecture_week7/widgets/demo_scaffold.dart';
import 'package:material_ui/material_ui.dart';

class const AnimatedAlignDemo({super.key}) extends StatefulWidget {
  @override
  State<AnimatedAlignDemo> createState() => _AnimatedAlignDemoState();
}

class _AnimatedAlignDemoState() extends State<AnimatedAlignDemo> {
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
    final colorScheme = ColorScheme.of(context);

    return DemoScaffold(
      onToggle: () => setState(
        () => _alignmentIndex = (_alignmentIndex + 1) % _alignments.length,
      ),
      buttonLabel: 'Move',
      child: Container(
        width: 280,
        height: 280,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(32),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutBack,
          alignment: _alignments[_alignmentIndex],
          child: Container(
            width: 64,
            height: 64,
            decoration: ShapeDecoration(
              color: colorScheme.primary,
              shape: MaterialShapeBorder(shape: MaterialShapes.cookie4Sided),
            ),
            child: Icon(Icons.navigation, color: colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}
