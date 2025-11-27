import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6/pokemon.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<LoadPokemon>(_onLoadPokemon, transformer: droppable());
  }

  final dio = Dio();

  Future<void> _onLoadPokemon(
    LoadPokemon event,
    Emitter<PokemonState> emit,
  ) async {
    emit(PokemonLoading());

    await Future<void>.delayed(const Duration(seconds: 2));

    try {
      final response = await dio.get<Map<String, dynamic>>(
        'https://pokeapi.co/api/v2/pokemon?limit=100',
      );

      final entries = Pokemons.fromJson(response.data!);
      emit(PokemonLoaded(entries));
    } catch (err) {
      emit(PokemonError(err));
    }
  }
}

// Events

sealed class PokemonEvent {}

class LoadPokemon extends PokemonEvent {}

// States

sealed class PokemonState with EquatableMixin {
  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonError extends PokemonState {
  PokemonError(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}

class PokemonLoaded extends PokemonState {
  PokemonLoaded(this.entries);

  final Pokemons entries;

  @override
  List<Object> get props => [entries];
}
