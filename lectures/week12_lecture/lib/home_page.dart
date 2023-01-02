import 'package:flutter/material.dart';

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
      body: LayoutBuilder(builder: (context, constraints) {
        return Row(
          children: [
            if (constraints.maxWidth >= 900) ...[
              SizedBox(
                width: 300,
                child: ListView(
                  children: const [
                    ListTile(
                      title: Text('Home'),
                    ),
                    ListTile(
                      title: Text('Another feature'),
                    ),
                    ListTile(
                      title: Text('Settings'),
                    ),
                  ],
                ),
              ),
              const VerticalDivider(),
            ],
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
