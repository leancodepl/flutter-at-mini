import 'package:flutter/material.dart';

class ReusingWidgetsExample extends StatelessWidget {
  const ReusingWidgetsExample({super.key});

  @override
  Widget build(BuildContext context) {
    final container = Container(
      color: Colors.green,
      height: 100,
    );
    const spacer = SizedBox(height: 16);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reusing widgets'),
      ),
      body: ListView(
        children: [
          container,
          spacer,
          container,
          spacer,
          container,
          spacer,
          container,
          spacer,
        ],
      ),
    );
  }
}
