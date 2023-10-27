import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: const [
          ToggleThemeAction(),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: body,
        ),
      ),
    );
  }
}

class ToggleThemeAction extends StatefulWidget {
  const ToggleThemeAction({super.key});

  @override
  State<ToggleThemeAction> createState() => _ToggleThemeActionState();
}

class _ToggleThemeActionState extends State<ToggleThemeAction> {
  var themeMode = ThemeMode.system;

  void updateThemeMode() {
    // TODO: implement
  }

  void setThemeMode(ThemeMode mode) {
    // TODO: implement
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => setThemeMode(
        themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
      ),
      icon: themeMode == ThemeMode.light
          ? const Icon(Icons.light_mode)
          : const Icon(Icons.dark_mode),
    );
  }
}
