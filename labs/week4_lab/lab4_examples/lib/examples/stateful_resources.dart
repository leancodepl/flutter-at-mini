import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final timestampStream =
    Stream.periodic(const Duration(seconds: 1), (i) => DateTime.now());

/// State can be used to hold resources for as long as a widget
/// is on the screen. Here we subscribe to a stream that informs us every
/// second of the current time. To prevent memory leaks, the subscription
/// has to be canceled when it is no longer needed -- i.e. when the widget
/// is no longer displayed and the state is disposed.
class StatefulResourcesExample extends StatefulWidget {
  const StatefulResourcesExample({super.key});

  @override
  State<StatefulResourcesExample> createState() =>
      _StatefulResourcesExampleState();
}

class _StatefulResourcesExampleState extends State<StatefulResourcesExample> {
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _subscription = timestampStream.listen((timestamp) {
      setState(() {
        _now = timestamp;
      });
    });
  }

  StreamSubscription? _subscription;

  @override
  Widget build(BuildContext context) {
    final format = DateFormat.Hms();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful resources'),
      ),
      body: Center(
        child: Text('Now is: ${format.format(_now)}'),
      ),
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
