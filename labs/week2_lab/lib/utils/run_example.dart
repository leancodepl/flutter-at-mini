import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
