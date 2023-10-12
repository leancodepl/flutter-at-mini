import 'package:flutter/material.dart';

void runExample(Widget child) {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: child,
        ),
      ),
    ),
  );
}
