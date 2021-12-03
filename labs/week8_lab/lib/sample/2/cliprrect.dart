import 'package:flutter/material.dart';

class ClipRRectExample extends StatelessWidget {
  const ClipRRectExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // try moving this padding to the margin of the container
            Padding(
              padding: const EdgeInsets.all(24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: Colors.indigo,
                  height: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScrollingThing extends StatelessWidget {
  const _ScrollingThing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      height: 200,
      child: ListView(
        children: [
          ...List.generate(10, (i) => ListTile(title: Text('Item $i'))),
        ],
      ),
    );
  }
}
