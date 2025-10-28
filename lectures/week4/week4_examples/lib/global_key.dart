import 'package:flutter/material.dart';

void main() {
  runApp(const GlobalKeyExample());
}

class GlobalKeyExample extends StatefulWidget {
  const GlobalKeyExample({super.key});

  @override
  State<GlobalKeyExample> createState() => _GlobalKeyExampleState();
}

class _GlobalKeyExampleState extends State<GlobalKeyExample> {
  final globalKey = GlobalKey();

  var _swapped = false;

  @override
  Widget build(BuildContext context) {
    final travelingTextField = TextField(
      // key: globalKey,
      decoration: InputDecoration(labelText: 'Traveling Text Field'),
    );

    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Container(
              color: Colors.blue.shade100,
              height: 300,
              child: Center(
                child: _swapped ? travelingTextField : Text('Hello, world!'),
              ),
            ),
            SizedBox(height: 16),
            NiceCard(
              child: _swapped ? Text('Card content') : travelingTextField,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => _swapped = !_swapped),
          child: Text('Swap'),
        ),
      ),
    );
  }
}

class NiceCard extends StatelessWidget {
  const NiceCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: const EdgeInsets.all(8.0), child: child),
    );
  }
}
