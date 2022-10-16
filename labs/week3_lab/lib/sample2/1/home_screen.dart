import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onPressed;

  const HomeScreen({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sample 2")),
      body: Center(
        child: MaterialButton(
          onPressed: onPressed,
          child: const Text('Next'),
        ),
      ),
    );
  }
}
