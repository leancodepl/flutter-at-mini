import 'package:flutter/material.dart';
import 'package:week7/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const _App(child: Week7App()));
}

class _App extends StatefulWidget {
  const _App({required this.child});

  final Widget child;

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  // TODO: initialize Firebase here
  // final _initialization = ...;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 7',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
        ),
      ),
      home: FutureBuilder(
        // TODO: connect the initialization future here
        future: Future<void>.value(),
        builder: (context, snapshot) {
          return switch (snapshot.connectionState) {
            ConnectionState.done => widget.child,
            _ => const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          };
        },
      ),
    );
  }
}
