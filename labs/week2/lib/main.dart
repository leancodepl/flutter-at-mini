import 'package:flutter/material.dart';
import 'package:week2/example_1_container.dart';
import 'package:week2/example_2_constraints.dart';
import 'package:week2/example_3_constrained_box.dart';
import 'package:week2/example_4_aspect_ratio.dart';
import 'package:week2/example_5_layout_builder.dart';
import 'package:week2/example_6_align.dart';
import 'package:week2/example_7_intrinsic.dart';
import 'package:week2/example_8_unconstrained_box.dart';
import 'package:week2/example_9_overflow_box.dart';
import 'package:week2/task1.dart';
import 'package:week2/task2.dart';

const entries = [
  (Example1(), '1. Container'),
  (Example2(), '2. Constraints'),
  (Example3(), '3. Constrained Box'),
  (Example4(), '4. Aspect Ratio'),
  (Example5(), '5. Layout Builder'),
  (Example6(), '6. Align'),
  (Example7(), '7. Intrinsic'),
  (Example8(), '8. Unconstrained Box'),
  (Example9(), '9. Overflow Box'),
  (Task1(), 'Task 1'),
  (Task2(), 'Task 2'),
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
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Labs – week 2'),
          ),
          body: ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, i) {
              final (child, title) = entries[i];
              return ListTile(
                title: Text(title),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => ExampleWrapper(title: title, child: child),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ExampleWrapper extends StatelessWidget {
  const ExampleWrapper({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: child,
      ),
    );
  }
}
