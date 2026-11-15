import 'dart:math' as math;

import 'package:flutter/physics.dart';
import 'package:lecture_week7/widgets/demo_scaffold.dart';
import 'package:material_ui/material_ui.dart';

typedef _SpringPair = ({
  String speed,
  SpringDescription spatial,
  SpringDescription effects,
});

/// The two Material 3 Expressive motion schemes, with their spring tokens.
enum _MotionScheme(final String label, final List<_SpringPair> springs) {
  standard('Standard', [
    (
      speed: 'Fast',
      spatial: Springs.standardFastSpatial,
      effects: Springs.standardFastEffects,
    ),
    (
      speed: 'Default',
      spatial: Springs.standardDefaultSpatial,
      effects: Springs.standardDefaultEffects,
    ),
    (
      speed: 'Slow',
      spatial: Springs.standardSlowSpatial,
      effects: Springs.standardSlowEffects,
    ),
  ]),
  expressive('Expressive', [
    (
      speed: 'Fast',
      spatial: Springs.expressiveFastSpatial,
      effects: Springs.expressiveFastEffects,
    ),
    (
      speed: 'Default',
      spatial: Springs.expressiveDefaultSpatial,
      effects: Springs.expressiveDefaultEffects,
    ),
    (
      speed: 'Slow',
      spatial: Springs.expressiveSlowSpatial,
      effects: Springs.expressiveSlowEffects,
    ),
  ]),
}

class const MaterialSpringsDemo({super.key}) extends StatefulWidget {
  @override
  State<MaterialSpringsDemo> createState() => _MaterialSpringsDemoState();
}

class _MaterialSpringsDemoState()
    extends State<MaterialSpringsDemo>
    with TickerProviderStateMixin {
  static const _trackWidth = 300.0;
  static const _shapeSize = 48.0;
  static const _padding = 4.0;
  static const _travel = _trackWidth - _shapeSize - 2 * _padding;

  late final _spatialControllers = List.generate(
    3,
    (_) => AnimationController.unbounded(vsync: this),
  );

  late final _effectsControllers = List.generate(
    3,
    (_) => AnimationController(vsync: this),
  );

  late final _allControllers = Listenable.merge([
    ..._spatialControllers,
    ..._effectsControllers,
  ]);

  _MotionScheme _scheme = .standard;
  bool _atEnd = false;

  void _toggle() {
    final target = _atEnd ? 0.0 : 1.0;
    setState(() => _atEnd = !_atEnd);

    for (final (i, springs) in _scheme.springs.indexed) {
      _animateTo(_spatialControllers[i], springs.spatial, target);
      _animateTo(_effectsControllers[i], springs.effects, target);
    }
  }

  /// Starts the spring from the controller's current value and velocity, so
  /// toggling mid-flight redirects the motion instead of restarting it.
  void _animateTo(
    AnimationController controller,
    SpringDescription spring,
    double target,
  ) {
    controller.animateWith(
      SpringSimulation(spring, controller.value, target, controller.velocity),
    );
  }

  @override
  void dispose() {
    for (final controller in [..._spatialControllers, ..._effectsControllers]) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return ExplicitDemoScaffold(
      actions: [
        ActionButton(
          label: 'Toggle',
          icon: Icons.swap_horiz,
          onPressed: _toggle,
          isPrimary: true,
        ),
      ],
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SegmentedButton<_MotionScheme>(
              segments: [
                for (final scheme in _MotionScheme.values)
                  ButtonSegment(value: scheme, label: Text(scheme.label)),
              ],
              selected: {_scheme},
              onSelectionChanged: (selection) =>
                  setState(() => _scheme = selection.single),
            ),
            const SizedBox(height: 12),
            Text(
              'Spatial springs move the shape,\n'
              'effects springs change its color.',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            AnimatedBuilder(
              animation: _allControllers,
              builder: (context, child) {
                return Column(
                  spacing: 24,
                  children: [
                    for (final (i, springs) in _scheme.springs.indexed)
                      _SpringTrack(
                        springs: springs,
                        position: _spatialControllers[i].value * _travel,
                        color: .lerp(
                          colorScheme.outline,
                          colorScheme.primary,
                          _effectsControllers[i].value,
                        )!,
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class const _SpringTrack({
  required final _SpringPair springs,
  required final double position,
  required final Color color,
}) extends StatelessWidget {
  static double _dampingRatio(SpringDescription spring) =>
      spring.damping / (2 * math.sqrt(spring.mass * spring.stiffness));

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);
    final spatial = springs.spatial;

    return SizedBox(
      width: _MaterialSpringsDemoState._trackWidth,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Text(springs.speed, style: textTheme.titleSmall),
              const Spacer(),
              Text(
                'stiffness ${spatial.stiffness.toStringAsFixed(0)}, '
                'ζ ${_dampingRatio(spatial).toStringAsFixed(1)}',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height:
                _MaterialSpringsDemoState._shapeSize +
                2 * _MaterialSpringsDemoState._padding,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(28),
            ),
            // The shape may overshoot past the end of the track.
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: _MaterialSpringsDemoState._padding + position,
                  top: _MaterialSpringsDemoState._padding,
                  child: Container(
                    width: _MaterialSpringsDemoState._shapeSize,
                    height: _MaterialSpringsDemoState._shapeSize,
                    decoration: ShapeDecoration(
                      color: color,
                      shape: MaterialShapeBorder(
                        shape: MaterialShapes.softBurst,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
