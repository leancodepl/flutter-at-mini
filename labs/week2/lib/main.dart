import 'package:flutter/material.dart';
import 'package:week2/example_0.dart';
import 'package:week2/example_1_container.dart';
import 'package:week2/example_2_constraints.dart';
import 'package:week2/example_3_constrained_box.dart';
import 'package:week2/example_4_aspect_ratio.dart';
import 'package:week2/example_5_layout_builder.dart';
import 'package:week2/example_6_align.dart';
import 'package:week2/example_7_intrinsic.dart';
import 'package:week2/example_8_unconstrained_box.dart';
import 'package:week2/example_9_overflow_box.dart';

const examples = [
  Example0(),
  Example1(),
  Example2(),
  Example3(),
  Example4(),
  Example5(),
  Example6(),
  Example7(),
  Example8(),
  Example9(),
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
            title: const Text('Labs 2'),
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
