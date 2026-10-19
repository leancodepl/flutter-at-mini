import 'package:flutter/material.dart';

import 'package:lecture_week3/demo_info.dart';

/// Demo: InheritedWidget (slides 68–69, 75).
///
/// Run: `fvm flutter run -d macos -t lib/demo_08_inherited.dart` and keep the console
/// visible.
///
/// 1. "Toggle theme" → only the root and AppText print "build".
///    SomeComplexHierarchy is const, so it is skipped – and AppText still
///    gets the new colour, because of(context) registered it as a dependent.
/// 2. PlainText doesn't use the provider → never rebuilds.
/// 3. ReadOnceText reads with getInheritedWidgetOfExactType – no subscription,
///    so it keeps the old colour (bc3: read vs watch).
void main() {
  runApp(const MaterialApp(home: InheritedDemo()));
}

class AppTheme({required final Color textColor});

class const AppThemeProvider({
  super.key,
  required final AppTheme appTheme,
  required super.child,
}) extends InheritedWidget {
  static AppTheme? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AppThemeProvider>()
        ?.appTheme;
  }

  static AppTheme of(BuildContext context) {
    final theme = maybeOf(context);
    assert(theme != null, 'No AppThemeProvider found in context');
    return theme!;
  }

  @override
  bool updateShouldNotify(AppThemeProvider oldWidget) {
    return oldWidget.appTheme != appTheme;
  }
}

class const InheritedDemo({super.key}) extends StatefulWidget {
  @override
  State<InheritedDemo> createState() => _InheritedDemoState();
}

class _InheritedDemoState() extends State<InheritedDemo> {
  final _blue = AppTheme(textColor: Colors.blue);
  final _red = AppTheme(textColor: Colors.red);

  var _isBlue = true;

  @override
  Widget build(BuildContext context) {
    debugPrint('\nbuild: InheritedDemo (root)');
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget'),
        actions: const [
          DemoInfo(
            title: 'InheritedWidget',
            steps: [
              '"Toggle theme": only the root and AppText print "build". SomeComplexHierarchy is const, so it is skipped – and AppText still gets the new colour, because of(context) registered it as a dependent.',
              "PlainText doesn't use the provider → never rebuilds.",
              'ReadOnceText reads with getInheritedWidgetOfExactType – no subscription, so it keeps the old colour.',
            ],
            watch: 'the colours and the console',
          ),
        ],
      ),
      body: AppThemeProvider(
        appTheme: _isBlue ? _blue : _red,
        child: const SomeComplexHierarchy(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() => _isBlue = !_isBlue),
        label: const Text('Toggle theme'),
      ),
    );
  }
}

class const SomeComplexHierarchy({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('build: SomeComplexHierarchy (const)');
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          AppText('AppText – depends on AppThemeProvider'),
          PlainText('PlainText – does not use it'),
          ReadOnceText('ReadOnceText – reads without subscribing'),
        ],
      ),
    );
  }
}

class const AppText(final String text, {super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('build: AppText');
    final theme = AppThemeProvider.of(context);
    return Text(
      text,
      style: TextStyle(color: theme.textColor, fontSize: 24),
    );
  }
}

class const PlainText(final String text, {super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('build: PlainText');
    return Text(text, style: const TextStyle(fontSize: 24));
  }
}

class const ReadOnceText(final String text, {super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('build: ReadOnceText');
    final theme = context
        .getInheritedWidgetOfExactType<AppThemeProvider>()!
        .appTheme;
    return Text(
      text,
      style: TextStyle(color: theme.textColor, fontSize: 24),
    );
  }
}
