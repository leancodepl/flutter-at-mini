// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$homeRoute];

RouteBase get $homeRoute => GoRouteData.$route(
  path: '/',
  factory: $HomeRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'cubit',
      factory: $CubitRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'pokemon',
          factory: $CubitPokemonDetailsRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: 'bloc',
      factory: $BlocRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'pokemon',
          factory: $BlocPokemonDetailsRoute._fromState,
        ),
      ],
    ),
  ],
);

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CubitRoute on GoRouteData {
  static CubitRoute _fromState(GoRouterState state) => const CubitRoute();

  @override
  String get location => GoRouteData.$location('/cubit');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CubitPokemonDetailsRoute on GoRouteData {
  static CubitPokemonDetailsRoute _fromState(GoRouterState state) =>
      CubitPokemonDetailsRoute(url: state.uri.queryParameters['url']!);

  CubitPokemonDetailsRoute get _self => this as CubitPokemonDetailsRoute;

  @override
  String get location =>
      GoRouteData.$location('/cubit/pokemon', queryParams: {'url': _self.url});

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BlocRoute on GoRouteData {
  static BlocRoute _fromState(GoRouterState state) => const BlocRoute();

  @override
  String get location => GoRouteData.$location('/bloc');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BlocPokemonDetailsRoute on GoRouteData {
  static BlocPokemonDetailsRoute _fromState(GoRouterState state) =>
      BlocPokemonDetailsRoute(url: state.uri.queryParameters['url']!);

  BlocPokemonDetailsRoute get _self => this as BlocPokemonDetailsRoute;

  @override
  String get location =>
      GoRouteData.$location('/bloc/pokemon', queryParams: {'url': _self.url});

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
