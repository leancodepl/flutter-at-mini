import 'package:flutter/material.dart';

class Task2Page extends StatefulWidget {
  const Task2Page({super.key});

  @override
  State<Task2Page> createState() => _Task2PageState();
}

class _Task2PageState extends State<Task2Page>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _opacityAnimation = Tween<double>(
      begin: 0.4,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _play() {
    _controller.repeat(reverse: true);
  }

  void _pause() {
    _controller.stop();
  }

  void _reset() {
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 2: Pulsing Indicator')),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return _StatusIndicator(
                  scale: _scaleAnimation.value,
                  opacity: _opacityAnimation.value,
                );
              },
            ),
            const SizedBox(height: 48),
            _ControlButtons(onPlay: _play, onPause: _pause, onReset: _reset),
            const SizedBox(height: 24),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return _AnimationValueDisplay(value: _controller.value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusIndicator extends StatelessWidget {
  const _StatusIndicator({required this.scale, required this.opacity});

  final double scale;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Opacity(
        opacity: opacity,
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF7EE787), Color(0xFF3FB950)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF7EE787).withAlpha(100),
                blurRadius: 32,
                spreadRadius: 8,
              ),
            ],
          ),
          child: const Center(
            child: Icon(Icons.check, color: Colors.white, size: 56),
          ),
        ),
      ),
    );
  }
}

class _ControlButtons extends StatelessWidget {
  const _ControlButtons({
    required this.onPlay,
    required this.onPause,
    required this.onReset,
  });

  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: [
        _ActionButton(label: 'Play', icon: Icons.play_arrow, onPressed: onPlay),
        _ActionButton(
          label: 'Pause',
          icon: Icons.pause,
          onPressed: onPause,
          color: const Color(0xFFFFA657),
        ),
        _ActionButton(
          label: 'Reset',
          icon: Icons.refresh,
          onPressed: onReset,
          color: const Color(0xFFF85149),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.color = const Color(0xFF238636),
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    );
  }
}

class _AnimationValueDisplay extends StatelessWidget {
  const _AnimationValueDisplay({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF21262D),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF30363D)),
      ),
      child: Text(
        'Value: ${value.toStringAsFixed(3)}',
        style: const TextStyle(
          color: Color(0xFF8B949E),
          fontSize: 14,
          fontFamily: 'monospace',
        ),
      ),
    );
  }
}
