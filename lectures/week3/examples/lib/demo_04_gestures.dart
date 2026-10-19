import 'package:flutter/material.dart';

import 'package:lecture_week3/demo_info.dart';

/// Demo: hit testing & gesture arena (slides 40–41).
///
/// Run: `fvm flutter run -d macos -t lib/demo_04_gestures.dart`
///
/// 1. HitTestBehavior: tap the empty padding inside the dashed box.
///    deferToChild → nothing happens, opaque → tap counted.
/// 2. Gesture arena: tap a list item → tap wins. Drag on an item → the list
///    scrolls and the tap never fires (scroll won the arena).
///    Turn on "items listen to vertical drag" → now the items win and the
///    list stops scrolling when you drag on them.
void main() {
  runApp(const MaterialApp(home: GesturesDemo()));
}

class const GesturesDemo({super.key}) extends StatefulWidget {
  @override
  State<GesturesDemo> createState() => _GesturesDemoState();
}

class _GesturesDemoState() extends State<GesturesDemo> {
  var _opaque = false;
  var _itemsHandleDrag = false;
  var _boxTaps = 0;
  var _lastEvent = '–';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hit testing & gesture arena'),
        actions: const [
          DemoInfo(
            title: 'Hit testing & gesture arena',
            steps: [
              'deferToChild: tap the empty padding inside the box → nothing happens. Switch to opaque → taps in empty space count too.',
              'Tap a list item → the tap wins. Drag on an item → the list scrolls and the tap never fires (scroll won the arena).',
              'Turn on "Items listen to vertical drag" → now the item wins the drag and the list stops scrolling under your finger.',
            ],
            watch: '"Box taps" and "Last item event"',
          ),
        ],
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text(
              _opaque
                  ? 'behavior: HitTestBehavior.opaque'
                  : 'behavior: HitTestBehavior.deferToChild',
            ),
            value: _opaque,
            onChanged: (value) => setState(() => _opaque = value),
          ),
          DecoratedBox(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: GestureDetector(
              behavior: _opaque
                  ? HitTestBehavior.opaque
                  : HitTestBehavior.deferToChild,
              onTap: () => setState(() => _boxTaps++),
              child: Padding(
                padding: const EdgeInsets.all(48),
                child: Text('Box taps: $_boxTaps'),
              ),
            ),
          ),
          const Divider(height: 32),
          SwitchListTile(
            title: const Text('Items listen to vertical drag'),
            value: _itemsHandleDrag,
            onChanged: (value) => setState(() => _itemsHandleDrag = value),
          ),
          Text('Last item event: $_lastEvent'),
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => setState(() => _lastEvent = 'tap on item $index'),
                onVerticalDragUpdate: _itemsHandleDrag
                    ? (_) => setState(() => _lastEvent = 'drag on item $index')
                    : null,
                child: ListTile(title: Text('Item $index')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
