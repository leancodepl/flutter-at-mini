import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labs_week6/common/error_message.dart';
import 'package:labs_week6/common/loading_indicator.dart';
import 'package:labs_week6/common/pokemon_details.dart';
import 'package:labs_week6/pokemon.dart';

final pokemonDetailsProvider = FutureProvider.autoDispose
    .family<Pokemon, String>((ref, url) async {
      await Future<void>.delayed(const Duration(seconds: 2));

      final response = await Dio().get<Map<String, dynamic>>(url);

      return switch (response.data) {
        final json? => Pokemon.fromJson(json),
        null => throw const FormatException('Empty Pokémon response'),
      };
    });

class const RiverpodPokemonDetailsPage({
  super.key,
  required final String pokemonUrl,
}) extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(pokemonDetailsProvider(pokemonUrl));

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Pokémon')),
      body: switch (details) {
        AsyncValue(:final error?) => ErrorMessage(error: error),
        AsyncValue(isLoading: true) => const LoadingIndicator(),
        AsyncValue(:final value?) => PokemonDetails(value),
        _ => const SizedBox(),
      },
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.refresh),
        label: const Text('Reload'),
        onPressed: () => ref.invalidate(pokemonDetailsProvider(pokemonUrl)),
      ),
    );
  }
}
