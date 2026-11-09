import 'package:flutter/material.dart';

class const RiverpodPokemonDetailsPage({
  super.key,
  required final String pokemonUrl,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Pokémon')),
      body: const Placeholder(child: Center(child: Text('TODO'))),
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
