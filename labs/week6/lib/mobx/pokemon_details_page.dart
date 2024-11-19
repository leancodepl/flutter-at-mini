import 'package:flutter/material.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX Pokémon'),
      ),
      body: const Placeholder(
        child: Center(child: Text('TODO')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.refresh),
        label: const Text('Load'),
        onPressed: () {
          throw UnimplementedError('TODO');
        },
      ),
    );
  }
}
