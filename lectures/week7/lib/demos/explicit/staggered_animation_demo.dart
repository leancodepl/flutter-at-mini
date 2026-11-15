import 'package:lecture_week7/widgets/demo_scaffold.dart';
import 'package:material_ui/material_ui.dart';

class const StaggeredAnimationDemo({super.key}) extends StatefulWidget {
  @override
  State<StaggeredAnimationDemo> createState() => _StaggeredAnimationDemoState();
}

class _StaggeredAnimationDemoState()
    extends State<StaggeredAnimationDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _slideAnimations;
  late final List<Animation<double>> _fadeAnimations;

  static final _shapes = [
    MaterialShapes.cookie4Sided,
    MaterialShapes.clover4Leaf,
    MaterialShapes.sunny,
    MaterialShapes.cookie6Sided,
    MaterialShapes.puffy,
  ];

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
          isPrimary: true,
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
          final colorScheme = ColorScheme.of(context);

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return Transform.translate(
                offset: Offset(_slideAnimations[index].value, 0),
                child: Opacity(
                  opacity: _fadeAnimations[index].value,
                  child: SizedBox(
                    width: 280,
                    child: Card.filled(
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(index == 0 ? 20 : 4),
                          bottom: Radius.circular(index == 4 ? 20 : 4),
                        ),
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: colorScheme.primary,
                            shape: MaterialShapeBorder(shape: _shapes[index]),
                          ),
                          child: Text(
                            '${index + 1}',
                            style: TextTheme.of(context).titleMedium
                                ?.copyWith(color: colorScheme.onPrimary),
                          ),
                        ),
                        title: Text('Item ${index + 1}'),
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
