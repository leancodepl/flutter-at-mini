import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: FormExample());
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade100,
      width: 100,
      height: 100,
      child: Row(
        children: [
          Image.network('https://picsum.photos/200/300'),
          Text('Hello World!'),
        ],
      ),
    );
  }
}

class MyWidget2 extends StatelessWidget {
  const MyWidget2({super.key, required this.showImage});

  final bool showImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade100,
      width: 100,
      height: 100,
      child: Row(
        children: [
          if (showImage) Image.network('https://picsum.photos/200/300'),
          Text('Hello World!'),
        ],
      ),
    );
  }
}

class StatelessCounter extends StatelessWidget {
  const StatelessCounter({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(value.toString()),
        ElevatedButton(onPressed: () => onChanged(value + 1), child: Text('+')),
        ElevatedButton(onPressed: () => onChanged(value - 1), child: Text('-')),
      ],
    );
  }
}

class StatefulCounter extends StatefulWidget {
  const StatefulCounter({super.key, required this.initialValue});

  final int initialValue;

  @override
  State<StatefulCounter> createState() => _StatefulCounterState();
}

class _StatefulCounterState extends State<StatefulCounter> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void _increment() {
    setState(() => _value++);
  }

  void _decrement() {
    setState(() => _value--);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(_value.toString()),
        ElevatedButton(onPressed: _increment, child: Text('+')),
        ElevatedButton(onPressed: _decrement, child: Text('-')),
      ],
    );
  }
}

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final _fieldsOrder = [0, 1, 2, 3];

  void _shuffleFields() {
    setState(() {
      _fieldsOrder.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    final fields = [
      TextFormField(
        // key: Key('Name'),
        decoration: InputDecoration(labelText: '1) Name'),
      ),
      TextFormField(
        // key: Key('Email'),
        decoration: InputDecoration(labelText: '2) Email'),
      ),
      TextFormField(
        // key: Key('Phone'),
        decoration: InputDecoration(labelText: '3) Phone'),
      ),
      TextFormField(
        // key: Key('Address'),
        decoration: InputDecoration(labelText: '4) Address'),
      ),
    ];

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Form(
            child: ListView(
              children: [
                for (final i in _fieldsOrder) ...[
                  fields[i],
                  const SizedBox(height: 16),
                ],
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffleFields,
        child: Text('Shuffle Fields'),
      ),
    );
  }
}
