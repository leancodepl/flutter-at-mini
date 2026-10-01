import 'package:dio/dio.dart';
import 'package:labs_week6/pokemon.dart';
import 'package:mobx/mobx.dart';

part 'pokemon_details_store.g.dart';

class PokemonDetailsStore = PokemonDetailsStoreBase with _$PokemonDetailsStore;

abstract class PokemonDetailsStoreBase({required final String pokemonUrl})
    with Store {
  final dio = Dio();

  @readonly
  bool _loading = false;

  @readonly
  Object? _error;

  @readonly
  Pokemon? _pokemon;

  @action
  Future<void> loadPokemonDetails() async {
    if (_loading) {
      return;
    }

    _loading = true;

    await Future<void>.delayed(const Duration(seconds: 2));

    try {
      final response = await dio.get<Map<String, dynamic>>(pokemonUrl);

      final pokemon = Pokemon.fromJson(response.data!);

      _pokemon = pokemon;
      _error = null;
    } on Exception catch (err) {
      _pokemon = null;
      _error = err;
    } finally {
      _loading = false;
    }
  }
}
