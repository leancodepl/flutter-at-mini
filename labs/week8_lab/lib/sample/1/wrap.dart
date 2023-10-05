import 'package:flutter/material.dart';

class WrapExample extends StatelessWidget {
  const WrapExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Wrap(
        children: [
          ...List.generate(100, (i) {
            if (i.isEven) {
              return SizedBox(
                width: 30 + i * 10,
                height: 30 + i * 10,
                child: const ColoredBox(color: Colors.green),
              );
            }
            return Chip(
              label: Text('Chip $i'),
            );
          }),
        ],
      ),
    );
  }
}
