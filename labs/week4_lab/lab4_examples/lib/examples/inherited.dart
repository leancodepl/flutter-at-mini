import 'package:flutter/material.dart';

final theme = AppTheme(
  accentColor: Colors.purple,
  textColor: Colors.purple,
  backgroundColor: Colors.lightBlue.shade100,
);

class InheritedExample extends StatelessWidget {
  const InheritedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return AppThemeProvider(
      appTheme: theme,
      child: const SomeComplexHierarchy(),
    );
  }
}

class AppTheme {
  const AppTheme({
    required this.accentColor,
    required this.textColor,
    required this.backgroundColor,
  });

  final Color accentColor;
  final Color backgroundColor;
  final Color textColor;
}

class AppThemeProvider extends InheritedWidget {
  const AppThemeProvider({
    super.key,
    required this.appTheme,
    required super.child,
  });

  final AppTheme appTheme;

  static AppTheme? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AppThemeProvider>()
        ?.appTheme;
  }

  @override
  bool updateShouldNotify(AppThemeProvider oldWidget) {
    return oldWidget.appTheme != appTheme;
  }
}

class SomeComplexHierarchy extends StatelessWidget {
  const SomeComplexHierarchy({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Inherited widget'),
      ),
      body: const Center(
        child: AppText('This is themed text in a themed scaffold'),
      ),
    );
  }
}

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.appBar,
    required this.body,
  });

  final PreferredSizeWidget appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeProvider.of(context)!;

    return Scaffold(
      appBar: appBar,
      backgroundColor: theme.backgroundColor,
      body: body,
    );
  }
}

class AppText extends StatelessWidget {
  const AppText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeProvider.of(context)!;

    return Text(
      text,
      style: TextStyle(color: theme.textColor),
    );
  }
}
