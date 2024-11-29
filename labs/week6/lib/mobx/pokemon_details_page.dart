import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:week6/common/error_message.dart';
import 'package:week6/common/loading_indicator.dart';
import 'package:week6/mobx/pokemon_details_store.dart';
import 'package:week6/pokemon.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    super.key,
    required this.pokemonUrl,
  });

  final String pokemonUrl;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) =>
          PokemonDetailsStore(pokemonUrl: pokemonUrl)..loadPokemonDetails(),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('MobX Pokémon'),
          ),
          body: Observer(
            builder: (context) {
              final store = context.read<PokemonDetailsStore>();

              return switch (store) {
                PokemonDetailsStore(loading: true) => const LoadingIndicator(),
                PokemonDetailsStore(:final error?) =>
                  ErrorMessage(error: error),
                PokemonDetailsStore(:final pokemon?) =>
                  _PokemonDetails(pokemon),
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

class _PokemonDetails extends StatelessWidget {
  const _PokemonDetails(this.pokemon);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            pokemon.name,
            style: theme.textTheme.displayLarge,
          ),
          const SizedBox(height: 16),
          Image.network(
            'https://raw.githubusercontent.com/HybridShivam/Pokemon/master/assets/images/${pokemon.id.toString().padLeft(3, '0')}.png',
            width: 200,
            height: 200,
            frameBuilder: (context, child, frame, _) {
              return Container(
                width: 216,
                height: 216,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: theme.colorScheme.outlineVariant,
                  ),
                ),
                alignment: Alignment.center,
                child: frame == null
                    ? const CircularProgressIndicator()
                    : Padding(
                        padding: const EdgeInsets.all(8),
                        child: child,
                      ),
              );
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Base XP: ${pokemon.baseExperience}',
            style: theme.textTheme.bodyMedium,
          ),
          Text(
            'Height: ${(pokemon.height / 10).toStringAsFixed(1)} m',
            style: theme.textTheme.bodyMedium,
          ),
          Text(
            'Weight: ${(pokemon.weight / 10).toStringAsFixed(1)} kg',
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
