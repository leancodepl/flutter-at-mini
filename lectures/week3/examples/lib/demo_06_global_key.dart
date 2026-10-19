import 'package:flutter/material.dart';

import 'package:lecture_week3/demo_info.dart';

/// Demo: moving a stateful widget to another parent (slide 54).
///
/// Run: `fvm flutter run -d macos -t lib/demo_06_global_key.dart`
///
/// 1. Leave "use GlobalKey" off. Type something into the field and tap
///    "Swap" → the field moves into the card and the text is gone
///    (new Element, new State).
/// 2. Turn "use GlobalKey" on (this resets the field once – the key changed),
///    type again and tap "Swap" → the text survives: the same Element and
///    State are moved to the new parent (deactivate → activate).
void main() {
  runApp(const MaterialApp(home: GlobalKeyExample()));
}

class const GlobalKeyExample({super.key}) extends StatefulWidget {
  @override
  State<GlobalKeyExample> createState() => _GlobalKeyExampleState();
}

class _GlobalKeyExampleState() extends State<GlobalKeyExample> {
  final _globalKey = GlobalKey();

  var _swapped = false;
  var _useGlobalKey = false;

  @override
  Widget build(BuildContext context) {
    final travelingTextField = TextField(
      key: _useGlobalKey ? _globalKey : null,
      decoration: const InputDecoration(labelText: 'Traveling Text Field'),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('GlobalKey: moving a widget'),
        actions: const [
          DemoInfo(
            title: 'GlobalKey: moving a widget',
            steps: [
              'Leave "use GlobalKey" off. Type into the field and tap "Swap" → the field moves into the card and the text is gone (new Element, new State).',
              'Turn "use GlobalKey" on (resets the field once – the key changed), type again, tap "Swap" → the text survives: the same Element and State moved to the new parent.',
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('use GlobalKey'),
            value: _useGlobalKey,
            onChanged: (value) => setState(() => _useGlobalKey = value),
          ),
          Container(
            color: Colors.blue.shade100,
            height: 300,
            padding: const EdgeInsets.all(16),
            child: Center(
              child: _swapped
                  ? travelingTextField
                  : const Text('Hello, world!'),
            ),
          ),
          const SizedBox(height: 16),
          NiceCard(
            child: _swapped ? const Text('Card content') : travelingTextField,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _swapped = !_swapped),
        child: const Text('Swap'),
      ),
    );
  }
}

class const NiceCard({super.key, required final Widget child})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: const EdgeInsets.all(8), child: child),
    );
  }
}
