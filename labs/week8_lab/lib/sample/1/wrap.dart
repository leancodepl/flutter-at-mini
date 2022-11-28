import 'package:flutter/material.dart';

class WrapExample extends StatelessWidget {
  const WrapExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Wrap(
        children: [
          ...List.generate(10, (i) => Chip(label: Text('Chip $i'))),
        ],
      ),
    );
  }
}
