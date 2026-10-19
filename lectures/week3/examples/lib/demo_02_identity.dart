import 'package:flutter/material.dart';

import 'package:lecture_week3/demo_info.dart';

/// Demo: creating vs building a widget, widget vs element identity
/// (slides 14–17, 23–25).
///
/// Run: `fvm flutter run -d macos -t lib/demo_02_identity.dart` and keep the console
/// visible.
///
/// 1. "Create a Probe (don't insert it)" → only the constructor runs.
///    No build, Flutter knows nothing about this widget.
/// 2. "Rebuild parent" → a new Probe widget every time (new widget #),
///    but the same Element (context #) – the element is updated, not replaced.
/// 3. "New key" → the key changes, so canUpdate is false: new widget AND
///    new element.
void main() {
  runApp(const MaterialApp(home: IdentityDemo()));
}

class const IdentityDemo({super.key}) extends StatefulWidget {
  @override
  State<IdentityDemo> createState() => _IdentityDemoState();
}

class _IdentityDemoState() extends State<IdentityDemo> {
  var _rebuilds = 0;
  var _generation = 0;

  void _createOnly() {
    final probe = Probe(rebuilds: -1);
    debugPrint('created ${probe.runtimeType}, but it is not in the tree');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creating vs building'),
        actions: const [
          DemoInfo(
            title: 'Creating vs building',
            steps: [
              '"Create a Probe (don\'t insert it)": only the constructor runs. No build – Flutter knows nothing about this widget.',
              '"Rebuild parent": a new widget # every time, but the same element # – the element is updated, not replaced.',
              '"New key": the key changes, canUpdate is false → a new widget AND a new element.',
            ],
            watch: 'the numbers on screen and the console',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 24,
          children: [
            Probe(key: ValueKey(_generation), rebuilds: _rebuilds),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: _createOnly,
                  child: const Text("Create a Probe (don't insert it)"),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => _rebuilds++),
                  child: const Text('Rebuild parent'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => _generation++),
                  child: const Text('New key'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Probe({super.key, required final int rebuilds}) extends StatelessWidget {
  this {
    debugPrint('constructor: Probe widget #${identityHashCode(this)}');
  }

  @override
  Widget build(BuildContext context) {
    final widgetId = identityHashCode(this);
    final elementId = identityHashCode(context);
    debugPrint('build: widget #$widgetId, element (context) #$elementId');

    final style = Theme.of(context).textTheme.headlineSmall;
    return Column(
      children: [
        Text('widget #$widgetId', style: style),
        Text('element #$elementId', style: style),
        Text('parent rebuilds: $rebuilds'),
      ],
    );
  }
}
