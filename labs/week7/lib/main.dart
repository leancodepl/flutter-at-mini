import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:week7/app.dart';
import 'package:week7/firebase_options.dart';

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
  final _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        future: _initialization,
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
