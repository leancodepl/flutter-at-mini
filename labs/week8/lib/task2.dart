import 'package:labs_week8/widgets/task_scaffold.dart';
import 'package:material_ui/material_ui.dart';

class const Task2Page({super.key}) extends StatefulWidget {
  @override
  State<Task2Page> createState() => _Task2PageState();
}

class _Task2PageState() extends State<Task2Page> {
  // TODO: Implement the pulsing animation.

  double get _scale => 1; // TODO: Replace with the animated value.
  double get _opacity => 1; // TODO: Replace with the animated value.
  double get _progress => 0; // TODO: Replace with the animation progress.
  AnimationStatus get _status => .dismissed; // TODO: Replace with the status.

  void _play() {
    // TODO
  }

  void _pause() {
    // TODO
  }

  void _reset() {
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    return TaskScaffold(
      actions: [
        ActionButton(
          label: 'Play',
          icon: Icons.play_arrow,
          onPressed: _play,
          isPrimary: true,
        ),
        ActionButton(label: 'Pause', icon: Icons.pause, onPressed: _pause),
        ActionButton(label: 'Reset', icon: Icons.refresh, onPressed: _reset),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StatusIndicator(scale: _scale, opacity: _opacity),
          const SizedBox(height: 48),
          _Progress(value: _progress, status: _status),
        ],
      ),
    );
  }
}

class const _StatusIndicator({
  required final double scale,
  required final double opacity,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return Transform.scale(
      scale: scale,
      child: Opacity(
        opacity: opacity,
        child: Container(
          width: 140,
          height: 140,
          decoration: ShapeDecoration(
            color: colorScheme.primary,
            shape: MaterialShapeBorder(shape: MaterialShapes.softBurst),
          ),
          child: Icon(Icons.favorite, color: colorScheme.onPrimary, size: 56),
        ),
      ),
    );
  }
}

class const _Progress({
  required final double value,
  required final AnimationStatus status,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final style = TextTheme.of(context).labelLarge?.copyWith(
      color: colorScheme.onSurfaceVariant,
      fontFeatures: const [FontFeature.tabularFigures()],
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 200, child: LinearProgressIndicator(value: value)),
        const SizedBox(height: 16),
        Text('Value: ${value.toStringAsFixed(3)}', style: style),
        Text('Status: ${status.name}', style: style),
      ],
    );
  }
}
