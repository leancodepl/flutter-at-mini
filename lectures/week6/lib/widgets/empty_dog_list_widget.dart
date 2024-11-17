import 'package:flutter/material.dart';

class EmptyDogListWidget extends StatelessWidget {
  const EmptyDogListWidget({super.key, required this.onFetch});

  final VoidCallback onFetch;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/undraw_dog.png'),
            const Text('There are no dogs yet :('),
            OutlinedButton(
              onPressed: onFetch,
              child: const Text('More dogs!'),
            ),
          ],
        ),
      ),
    );
  }
}
