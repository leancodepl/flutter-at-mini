import 'package:material_ui/material_ui.dart';

class const DemoScaffold({
  super.key,
  required final VoidCallback onToggle,
  required final Widget child,
  final String buttonLabel = 'Toggle',
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExplicitDemoScaffold(
      actions: [
        ActionButton(
          label: buttonLabel,
          icon: Icons.play_arrow,
          onPressed: onToggle,
          isPrimary: true,
        ),
      ],
      child: child,
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
    return SizedBox.expand(
      child: Column(
        children: [
          Expanded(child: Center(child: child)),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
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
  final bool isPrimary = false,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        sizeVariant: .medium,
        backgroundColor: isPrimary
            ? colorScheme.primary
            : colorScheme.secondaryContainer,
        foregroundColor: isPrimary
            ? colorScheme.onPrimary
            : colorScheme.onSecondaryContainer,
      ).copyWith(elevation: const WidgetStatePropertyAll(0)),
    );
  }
}
