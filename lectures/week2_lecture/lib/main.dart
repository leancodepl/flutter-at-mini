// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:week2_lecture/example_0.dart';
import 'package:week2_lecture/example_1.dart';
import 'package:week2_lecture/example_2.dart';
import 'package:week2_lecture/example_3.dart';

const examples = [
  Example0(),
  Example1(),
  Example2(),
  Example3(),
];

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lecture 2'),
        ),
        body: ListView.builder(
          itemBuilder: (context, i) {
            return ListTile(
              title: Text('${examples[i].runtimeType}'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => ExampleWrapper(
                    child: examples[i],
                  ),
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
  const ExampleWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          child.runtimeType.toString(),
        ),
      ),
      body: SafeArea(
        child: child,
      ),
    );
  }
}
