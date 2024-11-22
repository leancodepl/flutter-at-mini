import 'package:flutter/material.dart';

class CubitPage extends StatelessWidget {
  const CubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Pokémon'),
      ),
      body: const Placeholder(
        child: Center(child: Text('TODO')),
      ),
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
