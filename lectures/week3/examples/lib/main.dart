import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class const MainApp({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: FormExample());
  }
}

class const MyWidget({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade100,
      width: 100,
      height: 100,
      child: Row(
        children: [
          Image.network('https://picsum.photos/200/300'),
          const Text('Hello World!'),
        ],
      ),
    );
  }
}

class const MyWidget2({super.key, required final bool showImage})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade100,
      width: 100,
      height: 100,
      child: Row(
        children: [
          if (showImage) Image.network('https://picsum.photos/200/300'),
          const Text('Hello World!'),
        ],
      ),
    );
  }
}

class const StatelessCounter({
  super.key,
  required final int value,
  required final ValueChanged<int> onChanged,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(value.toString()),
        ElevatedButton(
          onPressed: () => onChanged(value + 1),
          child: const Text('+'),
        ),
        ElevatedButton(
          onPressed: () => onChanged(value - 1),
          child: const Text('-'),
        ),
      ],
    );
  }
}

class const StatefulCounter({super.key, required final int initialValue})
    extends StatefulWidget {
  @override
  State<StatefulCounter> createState() => _StatefulCounterState();
}

class _StatefulCounterState() extends State<StatefulCounter> {
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
        ElevatedButton(onPressed: _increment, child: const Text('+')),
        ElevatedButton(onPressed: _decrement, child: const Text('-')),
      ],
    );
  }
}

class const FormExample({super.key}) extends StatefulWidget {
  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState() extends State<FormExample> {
  final _fieldsOrder = [0, 1, 2, 3];

  void _shuffleFields() {
    setState(_fieldsOrder.shuffle);
  }

  @override
  Widget build(BuildContext context) {
    final fields = [
      TextFormField(
        // key: Key('Name'),
        decoration: const InputDecoration(labelText: '1) Name'),
      ),
      TextFormField(
        // key: Key('Email'),
        decoration: const InputDecoration(labelText: '2) Email'),
      ),
      TextFormField(
        // key: Key('Phone'),
        decoration: const InputDecoration(labelText: '3) Phone'),
      ),
      TextFormField(
        // key: Key('Address'),
        decoration: const InputDecoration(labelText: '4) Address'),
      ),
    ];

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
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
        child: const Text('Shuffle Fields'),
      ),
    );
  }
}
