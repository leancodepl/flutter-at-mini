import 'package:flutter/material.dart';
import 'package:lecture_week3/demo_info.dart';

/// Demo: widget tree vs element tree (slides 4–13, 18–22, 26–31).
///
/// Run: `fvm flutter run -d macos -t lib/demo_01_element_tree.dart`
///
/// 1. Open DevTools → Widget Inspector and expand MyWidget2.
///    Point out ColoredBox, RawImage and RichText – widgets that Container,
///    Image and Text create in their own build methods.
/// 2. Tap "Hide image" and watch only the Image/RawImage subtree disappear,
///    while the rest of the tree (and its elements) stays.
/// 3. Container internals (slides 8–9): expand the lower Container in the
///    inspector, then turn on padding / alignment → Padding and Align appear
///    in the tree only when the parameter is set.
void main() {
  runApp(const MaterialApp(home: ElementTreeDemo()));
}

class const ElementTreeDemo({super.key}) extends StatefulWidget {
  @override
  State<ElementTreeDemo> createState() => _ElementTreeDemoState();
}

class _ElementTreeDemoState() extends State<ElementTreeDemo> {
  var _showImage = true;
  var _padding = false;
  var _alignment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget tree vs element tree'),
        actions: const [
          DemoInfo(
            title: 'Widget tree vs element tree',
            steps: [
              'Open DevTools → Widget Inspector and expand MyWidget2. Find ColoredBox, RawImage and RichText – widgets that Container, Image and Text create in their own build().',
              'Tap "Hide image": only the Image / RawImage subtree disappears, the rest of the tree (and its elements) stays.',
              'Expand the teal Container in the inspector and turn on padding / alignment: Padding and Align appear in the tree only when the parameter is set.',
            ],
            watch: 'the DevTools Widget Inspector',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(child: MyWidget2(showImage: _showImage)),
          const Divider(height: 48),
          SwitchListTile(
            title: const Text('Container(padding: …)'),
            value: _padding,
            onChanged: (value) => setState(() => _padding = value),
          ),
          SwitchListTile(
            title: const Text('Container(alignment: …)'),
            value: _alignment,
            onChanged: (value) => setState(() => _alignment = value),
          ),
          Container(
            color: Colors.teal.shade100,
            height: 120,
            padding: _padding ? const EdgeInsets.all(24) : null,
            alignment: _alignment ? Alignment.bottomRight : null,
            child: const Text('Container internals'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() => _showImage = !_showImage),
        label: Text(_showImage ? 'Hide image' : 'Show image'),
      ),
    );
  }
}

class const MyWidget({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade100,
      width: 100,
      height: 100,
      child: Row(
        children: [
          Image.network('https://picsum.photos/200/300'),
          const Text('Hello World!'),
        ],
      ),
    );
  }
}

class const MyWidget2({super.key, required final bool showImage})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade100,
      width: 200,
      height: 100,
      child: Row(
        children: [
          if (showImage) Image.network('https://picsum.photos/200/300'),
          const Flexible(child: Text('Hello World!')),
        ],
      ),
    );
  }
}

class const StatelessCounter({
  super.key,
  required final int value,
  required final ValueChanged<int> onChanged,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(value.toString()),
        ElevatedButton(
          onPressed: () => onChanged(value + 1),
          child: const Text('+'),
        ),
        ElevatedButton(
          onPressed: () => onChanged(value - 1),
          child: const Text('-'),
        ),
      ],
    );
  }
}

class const StatefulCounter({super.key, required final int initialValue})
    extends StatefulWidget {
  @override
  State<StatefulCounter> createState() => _StatefulCounterState();
}

class _StatefulCounterState() extends State<StatefulCounter> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void _increment() {
    setState(() => _value++);
  }

  void _decrement() {
    setState(() => _value--);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(_value.toString()),
        ElevatedButton(onPressed: _increment, child: const Text('+')),
        ElevatedButton(onPressed: _decrement, child: const Text('-')),
      ],
    );
  }
}
