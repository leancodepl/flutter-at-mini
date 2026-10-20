import 'package:flutter/material.dart';

import 'package:lecture_week3/demo_info.dart';

/// Demo: what setState actually rebuilds (slides 50, 89).
///
/// Run: `fvm flutter run -d macos -t lib/demo_05_rebuilds.dart` and keep the console visible.
///
/// 1. Tap "+": CounterPage and Label print "build", the const StaticHeader
///    does not – Flutter skips identical (const) widgets.
/// 2. Tap "+ without setState": the value changes, but nothing rebuilds and
///    the UI stays the same – until the next setState.
/// 3. Bonus: remove `const` before StaticHeader() and tap "+" again.
void main() {
  runApp(const MaterialApp(home: CounterPage()));
}

class const CounterPage({super.key}) extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState() extends State<CounterPage> {
  var _value = 0;

  void _increment() {
    setState(() => _value++);
  }

  void _incrementWithoutSetState() {
    _value++;
    debugPrint('_value = $_value, but nobody asked for a rebuild');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build: CounterPage');
    return Scaffold(
      appBar: AppBar(
        title: const Text('setState & rebuilds'),
        actions: const [
          DemoInfo(
            title: 'setState & rebuilds',
            steps: [
              'Tap "+": CounterPage and Label print "build", the const StaticHeader does not – Flutter skips identical (const) widgets.',
              'Tap "+ without setState": the value changes, but nothing rebuilds and the UI stays the same – until the next setState.',
              'Bonus: remove const before StaticHeader(), hot reload, tap "+" again.',
            ],
            watch: 'the console',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 24,
          children: [
            const StaticHeader(),
            Label(text: 'Counter: $_value'),
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                ElevatedButton(onPressed: _increment, child: const Text('+')),
                OutlinedButton(
                  onPressed: _incrementWithoutSetState,
                  child: const Text('+ without setState'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class const StaticHeader({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('build: StaticHeader (const)');
    return const Text('I never change');
  }
}

class const Label({super.key, required final String text})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('build: Label');
    return Text(text, style: Theme.of(context).textTheme.headlineMedium);
  }
}
