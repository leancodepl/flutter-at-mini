// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:week7_lab/sample/1/app.dart';
import 'package:week7_lab/sample/2/app.dart';
import 'package:week7_lab/sample/3/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // const app = WaterLogApp0();
  // const app = WaterLogApp1();
  // const app = WaterLogApp2();
  const app = WaterLogApp3();

  runApp(const _App(app: app));
}

class _App extends StatefulWidget {
  const _App({
    Key? key,
    required this.app,
  }) : super(key: key);

  final Widget app;

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return widget.app;
          default:
            return const ColoredBox(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            );
        }
      },
    );
  }
}
