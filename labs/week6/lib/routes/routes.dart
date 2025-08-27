/// Generate type-safe routes for navigation.
/// Use the `go_router` package with its type-safe routing feature:
/// https://pub.dev/documentation/go_router/latest/topics/Type-safe%20routes-topic.html
/// https://pub.dev/documentation/go_router_builder/latest/
///
/// The tree should look like this:
/// ```text
/// / (HomePage)
/// ├── cubit (CubitPage)
/// │   └── pokemon (PokemonDetailsPage)
/// └── bloc (BlocPage)
///     └── pokemon (PokemonDetailsPage)
/// ```
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:week6/bloc/bloc_page.dart';
import 'package:week6/cubit/cubit_page.dart';
import 'package:week6/main.dart';
import 'package:week6/mobx/pokemon_details_page.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<CubitRoute>(
      path: 'cubit',
      routes: [
        TypedGoRoute<CubitPokemonDetailsRoute>(
          path: 'pokemon',
        ),
      ],
    ),
    TypedGoRoute<BlocRoute>(
      path: 'bloc',
      routes: [
        TypedGoRoute<BlocPokemonDetailsRoute>(
          path: 'pokemon',
        ),
      ],
    ),
  ],
)
class HomeRoute extends GoRouteData with _$HomeRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class CubitRoute extends GoRouteData with _$CubitRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CubitPage();
  }
}

class BlocRoute extends GoRouteData with _$BlocRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BlocPage();
  }
}

class CubitPokemonDetailsRoute extends GoRouteData with _$CubitPokemonDetailsRoute {
  CubitPokemonDetailsRoute({required this.url});

  final String url;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PokemonDetailsPage(
      pokemonUrl: url,
    );
  }
}

class BlocPokemonDetailsRoute extends GoRouteData with _$BlocPokemonDetailsRoute {
  BlocPokemonDetailsRoute({required this.url});

  final String url;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PokemonDetailsPage(
      pokemonUrl: url,
    );
  }
}
