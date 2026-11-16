import 'package:flutter/material.dart';
import 'package:labs_week7/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const _App(child: Week7App()));
}

class const _App({required final Widget child}) extends StatefulWidget {
  @override
  State<_App> createState() => _AppState();
}

class _AppState() extends State<_App> {
  // TODO: initialize Firebase here
  // final _initialization = ...;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 7',
      theme: .from(
        colorScheme: .fromSeed(
          seedColor: Colors.green,
          dynamicSchemeVariant: .fidelity,
        ),
      ),
      home: FutureBuilder(
        // TODO: connect the initialization future here
        future: .value(),
        builder: (context, snapshot) {
          return switch (snapshot.connectionState) {
            .done => widget.child,
            _ => const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          };
        },
      ),
    );
  }
}
