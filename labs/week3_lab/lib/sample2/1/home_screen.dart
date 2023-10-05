import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample 2')),
      body: Center(
        child: MaterialButton(
          onPressed: onPressed,
          child: const Text('Next'),
        ),
      ),
    );
  }
}
