import 'package:flutter/material.dart';

class KeysExample extends StatefulWidget {
  const KeysExample({super.key});

  @override
  State<KeysExample> createState() => _KeysExampleState();
}

class _KeysExampleState extends State<KeysExample> {
  bool _reversed = false;

  @override
  Widget build(BuildContext context) {
    final tiles = [
      const ExampleTile(
        // try removing the keys and shuffle
        key: Key('red'),
        color: Colors.red,
      ),
      const ExampleTile(
        // try removing the keys and shuffle
        key: Key('blue'),
        color: Colors.blue,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keys'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shuffle),
        onPressed: () => setState(() {
          _reversed = !_reversed;
        }),
      ),
      body: ListView(
        children: _reversed ? tiles.reversed.toList() : tiles,
      ),
    );
  }
}

class ExampleTile extends StatefulWidget {
  const ExampleTile({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  State<ExampleTile> createState() => _ExampleTileState();
}

class _ExampleTileState extends State<ExampleTile> {
  late Color _color;

  @override
  void initState() {
    super.initState();
    _color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
      width: 200,
      height: 200,
    );
  }
}
