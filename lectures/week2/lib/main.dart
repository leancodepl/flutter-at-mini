import 'package:flutter/material.dart';
import 'package:lecture_week2/example_1.dart';
import 'package:lecture_week2/example_2.dart';

const examples = [Example1(), Example2()];

void main() {
  runApp(const App());
}

class const App({super.key}) extends StatelessWidget {
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
                  builder: (context) => ExampleWrapper(child: examples[i]),
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

class const ExampleWrapper({super.key, required final Widget child})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(child.runtimeType.toString())),
      body: SafeArea(child: child),
    );
  }
}
