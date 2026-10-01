import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppTheme() extends ValueNotifier<Brightness> {
  this : super(Brightness.light);

  void toggle() => value = switch (value) {
    Brightness.light => Brightness.dark,
    Brightness.dark => Brightness.light,
  };
}

class const AppThemeSwitcher({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();

    return IconButton(
      onPressed: appTheme.toggle,
      icon: Icon(switch (appTheme.value) {
        Brightness.light => Icons.dark_mode_rounded,
        Brightness.dark => Icons.light_mode_rounded,
      }),
    );
  }
}
