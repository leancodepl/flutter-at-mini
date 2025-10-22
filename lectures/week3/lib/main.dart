import 'package:flutter/material.dart';
import 'package:week3/example_1.dart';
import 'package:week3/example_2.dart';
import 'package:week3/example_3.dart';

const examples = [Example1(), Example2(), Example3()];

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Lecture 2')),
        body: ListView.builder(
          itemBuilder: (context, i) {
            return ListTile(
              title: Text('${examples[i].runtimeType}'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => ExampleWrapper(child: examples[i]),
                ),
              ),
            );
          },
          itemCount: examples.length,
        ),
      ),
    );
  }
}

class ExampleWrapper extends StatelessWidget {
  const ExampleWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(child.runtimeType.toString())),
      body: SafeArea(child: child),
    );
  }
}
