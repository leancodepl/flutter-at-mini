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

class ToggleThemeAction extends StatelessWidget {
  const ToggleThemeAction({super.key});

  void setThemeMode(BuildContext context, ThemeMode mode) {
    // TODO: implement
    throw UnimplementedError();
  }

  ThemeMode getThemeMode(BuildContext context) {
    // TODO: implement
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => setThemeMode(
        context,
        getThemeMode(context) == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light,
      ),
      icon: getThemeMode(context) == ThemeMode.light
          ? const Icon(Icons.light_mode)
          : const Icon(Icons.dark_mode),
    );
  }
}
