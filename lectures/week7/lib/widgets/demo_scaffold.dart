import 'package:flutter/material.dart';

class const DemoScaffold({
  super.key,
  required final VoidCallback onToggle,
  required final Widget child,
  final String buttonLabel = 'Toggle',
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(child: Center(child: child)),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: ElevatedButton.icon(
              onPressed: onToggle,
              icon: const Icon(Icons.play_arrow, size: 20),
              label: Text(buttonLabel),
            ),
          ),
        ],
      ),
    );
  }
}

class const ExplicitDemoScaffold({
  super.key,
  required final List<Widget> actions,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(child: Center(child: child)),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: actions,
            ),
          ),
        ],
      ),
    );
  }
}

class const ActionButton({
  super.key,
  required final String label,
  required final IconData icon,
  required final VoidCallback onPressed,
  final bool isDestructive = false,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: isDestructive
            ? const Color(0xFFF85149)
            : const Color(0xFF238636),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    );
  }
}
