import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6/common/error_message.dart';
import 'package:week6/common/loading_indicator.dart';
import 'package:week6/common/pokemon_list.dart';
import 'package:week6/cubit/pokemon_cubit.dart';
import 'package:week6/routes/routes.dart';

class CubitPage extends StatelessWidget {
  const CubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonCubit()..loadPokemon(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Cubit Pokémon'),
            ),
            body: BlocBuilder<PokemonCubit, PokemonState>(
              builder: (context, state) {
                return switch (state) {
                  PokemonInitial() => const SizedBox(),
                  PokemonLoading() => const LoadingIndicator(),
                  PokemonError(:final error) => ErrorMessage(error: error),
                  PokemonLoaded(:final entries) => PokemonList(
                      entries: entries.pokemons,
                      onTap: (entry) {
                        CubitPokemonDetailsRoute(url: entry.url).go(context);
                      },
                    ),
                };
              },
            ),
            floatingActionButton: FloatingActionButton.extended(
              icon: const Icon(Icons.refresh),
              label: const Text('Reload'),
              onPressed: () {
                context.read<PokemonCubit>().loadPokemon();
              },
            ),
          );
        },
      ),
    );
  }
}
