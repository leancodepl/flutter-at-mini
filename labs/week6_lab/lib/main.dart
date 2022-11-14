// ignore_for_file: unused_import

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:week6_lab/firebase_options.dart';
import 'package:week6_lab/sample/0/page.dart';
import 'package:week6_lab/sample/1/page.dart';
import 'package:week6_lab/sample/2/page.dart';
import 'package:week6_lab/sample/3/page.dart';
import 'package:week6_lab/sample/4/page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // const app = ShoutboxPage0();
  // const app = ShoutboxPage1();
  // const app = ShoutboxPage2();
  // const app = ShoutboxPage3();
  const app = ShoutboxPage4();

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
        });
  }
}
