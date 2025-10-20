import 'package:flutter/material.dart';

class Example1 extends StatelessWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: Row(
        children: [
          Container(width: 200, color: Colors.green),
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(200, 200)),
              child: const Text(
                'Hello I want to be visible please, I know I am long',
                // overflow: TextOverflow.visible,
              ),
            ),
          ),
          Container(width: 290, color: Colors.amber),
        ],
      ),
    );
  }
}
