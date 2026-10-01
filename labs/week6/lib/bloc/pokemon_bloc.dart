import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labs_week6/pokemon.dart';

class PokemonBloc() extends Bloc<PokemonEvent, PokemonState> {
  this : super(PokemonStateInitial()) {
    on<PokemonEventLoad>(_onLoadPokemon, transformer: droppable());
  }

  final dio = Dio();

  Future<void> _onLoadPokemon(
    PokemonEventLoad event,
    Emitter<PokemonState> emit,
  ) async {
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

// Events

sealed class PokemonEvent();

class PokemonEventLoad() extends PokemonEvent;

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
