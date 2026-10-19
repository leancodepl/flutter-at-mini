import 'package:flutter/material.dart';
import 'package:lecture_week3/demo_00_all.dart' show DemoBrowser;

/// Default entrypoint (`fvm flutter run -d macos`) opens the demo browser.
/// The widgets below are the code shown on the slides.
void main() {
  runApp(const MaterialApp(home: DemoBrowser()));
}
