import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:labs_week6/common/error_message.dart';
import 'package:labs_week6/common/loading_indicator.dart';
import 'package:labs_week6/common/pokemon_details.dart';
import 'package:labs_week6/mobx/pokemon_details_store.dart';
import 'package:provider/provider.dart';

class const MobxPokemonDetailsPage({
  super.key,
  required final String pokemonUrl,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) =>
          PokemonDetailsStore(pokemonUrl: pokemonUrl)..loadPokemonDetails(),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('MobX Pokémon')),
          body: Observer(
            builder: (context) {
              final store = context.watch<PokemonDetailsStore>();

              return switch (store) {
                PokemonDetailsStore(loading: true) => const LoadingIndicator(),
                PokemonDetailsStore(:final error?) => ErrorMessage(
                  error: error,
                ),
                PokemonDetailsStore(:final pokemon?) => PokemonDetails(pokemon),
                _ => const SizedBox(),
              };
            },
          ),
          floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.refresh),
            label: const Text('Reload'),
            onPressed: () {
              context.read<PokemonDetailsStore>().loadPokemonDetails();
            },
          ),
        );
      },
    );
  }
}
