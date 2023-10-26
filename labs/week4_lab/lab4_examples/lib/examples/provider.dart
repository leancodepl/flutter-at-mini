import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final theme = AppTheme(
  accentColor: Colors.purple,
  textColor: Colors.purple,
  backgroundColor: Colors.lightBlue.shade100,
);

class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: theme,
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

class SomeComplexHierarchy extends StatelessWidget {
  const SomeComplexHierarchy({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: Center(
        child: AppText('This is themed text in a themed scaffold'),
      ),
    );
  }
}

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
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
    final theme = context.watch<AppTheme>();
    // same as this:
    // final theme = Provider.of<AppTheme>(context);

    return Text(
      text,
      style: TextStyle(color: theme.textColor),
    );
  }
}
