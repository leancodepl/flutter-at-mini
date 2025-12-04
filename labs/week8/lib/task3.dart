import 'package:flutter/material.dart';

class Task3Page extends StatefulWidget {
  const Task3Page({super.key});

  @override
  State<Task3Page> createState() => _Task3PageState();
}

class _Task3PageState extends State<Task3Page> {
  // TODO: Implement drag and spring-back behavior

  Offset _dragOffset = Offset.zero;

  // TODO: Use Spring parameters
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

  void _resetCard() {
    setState(() {
      _dragOffset = Offset.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 3: Spring Physics')),
      body: Center(
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
                    child: _DraggableCard(),
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

class _DraggableCard extends StatelessWidget {
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

class _SpringControls extends StatelessWidget {
  const _SpringControls({
    required this.mass,
    required this.stiffness,
    required this.damping,
    required this.onMassChanged,
    required this.onStiffnessChanged,
    required this.onDampingChanged,
    required this.onReset,
  });

  final double mass;
  final double stiffness;
  final double damping;
  final ValueChanged<double> onMassChanged;
  final ValueChanged<double> onStiffnessChanged;
  final ValueChanged<double> onDampingChanged;
  final VoidCallback onReset;

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

class _SliderRow extends StatelessWidget {
  const _SliderRow({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  final String label;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

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
