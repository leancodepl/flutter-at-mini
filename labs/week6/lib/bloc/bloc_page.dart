import 'package:flutter/material.dart';

class const BlocPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Pokémon')),
      body: const Placeholder(child: Center(child: Text('TODO'))),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.refresh),
        label: const Text('Reload'),
        onPressed: () {
          // TODO: reload Pokémon
          throw UnimplementedError('TODO');
        },
      ),
    );
  }
}
