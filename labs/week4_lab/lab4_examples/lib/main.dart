import 'package:flutter/material.dart';
import 'package:lab4_examples/examples/inherited.dart';
import 'package:lab4_examples/examples/keys.dart';
import 'package:lab4_examples/examples/listenable.dart';
import 'package:lab4_examples/examples/provider.dart';
import 'package:lab4_examples/examples/reusing_widgets.dart';
import 'package:lab4_examples/examples/simple_stateful.dart';
import 'package:lab4_examples/examples/stateful_resources.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 4 - State: examples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 04 examples'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Reusing widgets'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ReusingWidgetsExample(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Simple stateful widget'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SimpleStatefulExample(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Inherited widget'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const InheritedExample(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Provider'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProviderExample(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Stateful resources'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const StatefulResourcesExample(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Keys'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const KeysExample(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Listenable'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ListenableExample(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
