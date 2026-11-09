// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonDetailsStore on PokemonDetailsStoreBase, Store {
  late final _$_loadingAtom = Atom(
    name: 'PokemonDetailsStoreBase._loading',
    context: context,
  );

  bool get loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  bool get _loading => loading;

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  late final _$_errorAtom = Atom(
    name: 'PokemonDetailsStoreBase._error',
    context: context,
  );

  Object? get error {
    _$_errorAtom.reportRead();
    return super._error;
  }

  @override
  Object? get _error => error;

  @override
  set _error(Object? value) {
    _$_errorAtom.reportWrite(value, super._error, () {
      super._error = value;
    });
  }

  late final _$_pokemonAtom = Atom(
    name: 'PokemonDetailsStoreBase._pokemon',
    context: context,
  );

  Pokemon? get pokemon {
    _$_pokemonAtom.reportRead();
    return super._pokemon;
  }

  @override
  Pokemon? get _pokemon => pokemon;

  @override
  set _pokemon(Pokemon? value) {
    _$_pokemonAtom.reportWrite(value, super._pokemon, () {
      super._pokemon = value;
    });
  }

  late final _$loadPokemonDetailsAsyncAction = AsyncAction(
    'PokemonDetailsStoreBase.loadPokemonDetails',
    context: context,
  );

  @override
  Future<void> loadPokemonDetails() {
    return _$loadPokemonDetailsAsyncAction.run(
      () => super.loadPokemonDetails(),
    );
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
