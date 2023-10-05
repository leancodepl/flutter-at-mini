import 'package:flutter/material.dart';

class GridExample extends StatelessWidget {
  const GridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView(
          gridDelegate: _delegate2,
          // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 2,
          //   mainAxisSpacing: 8,
          //   crossAxisSpacing: 8,
          // ),
          children: [
            ...List.generate(
              10,
              (i) => ColoredBox(
                color: Colors.grey,
                child: Center(child: Text('Block $i')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const _delegate2 = SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 200,
  mainAxisSpacing: 8,
  crossAxisSpacing: 8,
);
