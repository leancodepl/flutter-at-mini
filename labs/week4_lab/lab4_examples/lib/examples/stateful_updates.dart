import 'package:flutter/material.dart';

class SimpleStatefulExample extends StatelessWidget {
  const SimpleStatefulExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful widget with updates'),
      ),
      body: const Center(
        child: Counter(
          initialValue: 3,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({
    super.key,
    required this.initialValue,
    required this.color,
  });

  final int initialValue;
  final Color color;

  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter> {
  int _value = 0;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  void didUpdateWidget(Counter oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Reset counter when different initialValue is passed
    if (oldWidget.initialValue != widget.initialValue) {
      _value = widget.initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: TextStyle(color: widget.color),
      ),
      onPressed: () {
        setState(() {
          _value++;
        });
      },
      child: Text('Counter: $_value'),
    );
  }
}
