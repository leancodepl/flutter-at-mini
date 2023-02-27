import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            CounterValue(counter: _counter),
            TextButton(
              child: const Text('HTTP Request'),
              onPressed: () => http.get(Uri.parse('https://google.com/')),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterValue extends StatelessWidget {
  const CounterValue({
    Key? key,
    required int counter,
  })  : _counter = counter,
        super(key: key);

  final int _counter;

  @override
  Widget build(BuildContext context) {
    //someCpuWork();

    final largeByteList = MyClass();

    stream.listen((event) {
      print(largeByteList.list.first);
    });

    return Text(
      '$_counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MyClass {
  final list = List.filled(1024 * 1024, 0);
}

void someCpuWork() {
  final stopwatch = Stopwatch()..start();
  while (stopwatch.elapsedMilliseconds < 200) {}
}

final stream = StreamController.broadcast().stream;
