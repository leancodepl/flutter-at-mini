import 'package:flutter/material.dart';

class SafeAreaExample extends StatelessWidget {
  const SafeAreaExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Top text',
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          'Bottom text',
          style: Theme.of(context).textTheme.headline3,
        ),
      ],
    );
  }
}
