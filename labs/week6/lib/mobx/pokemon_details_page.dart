import 'package:flutter/material.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    super.key,
    required this.pokemonUrl,
  });

  final String pokemonUrl;

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
        label: const Text('Reload'),
        onPressed: () {
          // TODO: reload Pokémon details
          throw UnimplementedError('TODO');
        },
      ),
    );
  }
}
