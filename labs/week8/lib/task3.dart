import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class const Task3Page({super.key}) extends StatefulWidget {
  @override
  State<Task3Page> createState() => _Task3PageState();
}

class _Task3PageState()
    extends State<Task3Page>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  Offset _dragOffset = Offset.zero;
  Offset _startOffset = Offset.zero;

  double _mass = 1;
  double _stiffness = 200;
  double _damping = 15;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
    _controller.addListener(_onAnimationTick);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onAnimationTick() {
    setState(() {
      _dragOffset = _startOffset * _controller.value;
    });
  }

  void _onPanStart(DragStartDetails details) {
    _controller.stop();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset += details.delta;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    _startOffset = _dragOffset;

    final spring = SpringDescription(
      mass: _mass,
      stiffness: _stiffness,
      damping: _damping,
    );

    final simulation = SpringSimulation(spring, 1, 0, 0);
    _controller.animateWith(simulation);
  }

  void _resetCard() {
    _controller.stop();
    setState(() {
      _dragOffset = Offset.zero;
      _startOffset = Offset.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 3: Spring Physics')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF161B22), Color(0xFF0D1117)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: GestureDetector(
                  onPanStart: _onPanStart,
                  onPanUpdate: _onPanUpdate,
                  onPanEnd: _onPanEnd,
                  child: Transform.translate(
                    offset: _dragOffset,
                    child: const _DraggableCard(),
                  ),
                ),
              ),
            ),
            _SpringControls(
              mass: _mass,
              stiffness: _stiffness,
              damping: _damping,
              onMassChanged: (v) => setState(() => _mass = v),
              onStiffnessChanged: (v) => setState(() => _stiffness = v),
              onDampingChanged: (v) => setState(() => _damping = v),
              onReset: _resetCard,
            ),
          ],
        ),
      ),
    );
  }
}

class const _DraggableCard() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFA371F7), Color(0xFF8957E5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFA371F7).withAlpha(80),
            blurRadius: 24,
            spreadRadius: 4,
          ),
        ],
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.touch_app, color: Colors.white, size: 48),
          SizedBox(height: 12),
          Text(
            'Drag me!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Release to spring back',
            style: TextStyle(color: Colors.white70, fontSize: 12),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF161B22),
        border: Border(top: BorderSide(color: Color(0xFF30363D))),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Spring Parameters',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: onReset,
                icon: const Icon(Icons.refresh, size: 16),
                label: const Text('Reset'),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF8B949E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
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
          const SizedBox(height: 8),
          Text(
            _getSpringDescription(),
            style: const TextStyle(color: Color(0xFF8B949E), fontSize: 12),
          ),
        ],
      ),
    );
  }

  String _getSpringDescription() =>
      switch (damping * damping - 4 * mass * stiffness) {
        > 0 => 'Overdamped (slow)',
        < 0 => 'Underdamped (bouncy)',
        _ => 'Critically damped (smooth)',
      };
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
    return Row(
      children: [
        SizedBox(
          width: 70,
          child: Text(
            label,
            style: const TextStyle(color: Color(0xFF8B949E), fontSize: 13),
          ),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderThemeData(
              activeTrackColor: const Color(0xFFA371F7),
              inactiveTrackColor: const Color(0xFF30363D),
              thumbColor: const Color(0xFFA371F7),
              overlayColor: const Color(0xFFA371F7).withAlpha(30),
              trackHeight: 4,
            ),
            child: Slider(
              value: value,
              min: min,
              max: max,
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(
          width: 50,
          child: Text(
            value.toStringAsFixed(1),
            style: const TextStyle(color: Color(0xFF8B949E), fontSize: 12),
          ),
        ),
      ],
    );
  }
}
