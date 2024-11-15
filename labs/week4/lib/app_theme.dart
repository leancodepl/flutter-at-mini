import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppTheme extends ValueNotifier<Brightness> {
  AppTheme() : super(Brightness.light);

  void toggle() => value = switch (value) {
        Brightness.light => Brightness.dark,
        Brightness.dark => Brightness.light,
      };
}

class AppThemeSwitcher extends StatelessWidget {
  const AppThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();

    return IconButton(
      onPressed: appTheme.toggle,
      icon: switch (appTheme.value) {
        Brightness.light => const Icon(Icons.dark_mode_rounded),
        Brightness.dark => const Icon(Icons.light_mode_rounded),
      },
    );
  }
}
