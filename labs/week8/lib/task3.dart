import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

class const Task3Page({super.key}) extends StatefulWidget {
  @override
  State<Task3Page> createState() => _Task3PageState();
}

class _Task3PageState() extends State<Task3Page> {
  // TODO: Implement dragging and springing back.

  Offset _offset = Offset.zero;

  // TODO: Use the spring parameters.
  double _mass = 1;
  double _stiffness = 200;
  double _damping = 15;

  void _onPanStart(DragStartDetails details) {
    // TODO
  }

  void _onPanUpdate(DragUpdateDetails details) {
    // TODO
  }

  void _onPanEnd(DragEndDetails details) {
    // TODO
  }

  void _reset() {
    setState(() => _offset = Offset.zero);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Transform.translate(
              offset: _offset,
              child: GestureDetector(
                onPanStart: _onPanStart,
                onPanUpdate: _onPanUpdate,
                onPanEnd: _onPanEnd,
                child: const _DraggableCard(),
              ),
            ),
          ),
        ),
        _SpringControls(
          mass: _mass,
          stiffness: _stiffness,
          damping: _damping,
          onMassChanged: (value) => setState(() => _mass = value),
          onStiffnessChanged: (value) => setState(() => _stiffness = value),
          onDampingChanged: (value) => setState(() => _damping = value),
          onReset: _reset,
        ),
      ],
    );
  }
}

class const _DraggableCard() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return Container(
      width: 160,
      height: 200,
      decoration: ShapeDecoration(
        color: colorScheme.tertiaryContainer,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.touch_app,
            color: colorScheme.onTertiaryContainer,
            size: 48,
          ),
          const SizedBox(height: 12),
          Text(
            'Drag me!',
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onTertiaryContainer,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Release to spring back',
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onTertiaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

class const _SpringControls({
  required final double mass,
  required final double stiffness,
  required final double damping,
  required final ValueChanged<double> onMassChanged,
  required final ValueChanged<double> onStiffnessChanged,
  required final ValueChanged<double> onDampingChanged,
  required final VoidCallback onReset,
}) extends StatelessWidget {
  double get _dampingRatio => damping / (2 * math.sqrt(mass * stiffness));

  String get _description => switch (_dampingRatio) {
    < 0.95 => 'underdamped (bouncy)',
    > 1.05 => 'overdamped (sluggish)',
    _ => 'critically damped (smooth)',
  };

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.fromLTRB(20, 8, 8, 16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Spring parameters', style: textTheme.titleMedium),
              const Spacer(),
              IconButton(
                tooltip: 'Reset position',
                onPressed: onReset,
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
          _SliderRow(
            label: 'Mass',
            value: mass,
            min: 0.1,
            max: 10,
            onChanged: onMassChanged,
          ),
          _SliderRow(
            label: 'Stiffness',
            value: stiffness,
            min: 50,
            max: 500,
            onChanged: onStiffnessChanged,
          ),
          _SliderRow(
            label: 'Damping',
            value: damping,
            min: 1,
            max: 50,
            onChanged: onDampingChanged,
          ),
          Text(
            'ζ = ${_dampingRatio.toStringAsFixed(2)}, $_description',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
    );
  }
}

class const _SliderRow({
  required final String label,
  required final double value,
  required final double min,
  required final double max,
  required final ValueChanged<double> onChanged,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = TextTheme.of(context).labelLarge
        ?.copyWith(fontFeatures: const [FontFeature.tabularFigures()]);

    return Row(
      children: [
        SizedBox(width: 72, child: Text(label, style: style)),
        Expanded(
          child: Slider(value: value, min: min, max: max, onChanged: onChanged),
        ),
        SizedBox(
          width: 48,
          child: Text(
            value.toStringAsFixed(1),
            textAlign: TextAlign.end,
            style: style,
          ),
        ),
      ],
    );
  }
}
