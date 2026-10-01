import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labs_week6/pokemon.dart';

class PokemonCubit() extends Cubit<PokemonState> {
  this : super(PokemonStateInitial());

  final dio = Dio();

  Future<void> loadPokemon() async {
    if (state is PokemonStateLoading) {
      return;
    }

    emit(PokemonStateLoading());

    await Future<void>.delayed(const Duration(seconds: 2));

    try {
      final response = await dio.get<Map<String, dynamic>>(
        'https://pokeapi.co/api/v2/pokemon?limit=100',
      );

      final entries = Pokemons.fromJson(response.data!);
      emit(PokemonStateLoaded(entries));
    } catch (err) {
      emit(PokemonStateError(err));
    }
  }
}

// States

sealed class PokemonState() with Equatable {
  @override
  List<Object> get props => [];
}

class PokemonStateInitial() extends PokemonState;

class PokemonStateLoading() extends PokemonState;

class PokemonStateError(final Object error) extends PokemonState {
  @override
  List<Object> get props => [error];
}

class PokemonStateLoaded(final Pokemons entries) extends PokemonState {
  @override
  List<Object> get props => [entries];
}
