// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'cubit',
          factory: $CubitRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'pokemon',
              factory: $CubitPokemonDetailsRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'bloc',
          factory: $BlocRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'pokemon',
              factory: $BlocPokemonDetailsRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CubitRouteExtension on CubitRoute {
  static CubitRoute _fromState(GoRouterState state) => CubitRoute();

  String get location => GoRouteData.$location(
        '/cubit',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CubitPokemonDetailsRouteExtension on CubitPokemonDetailsRoute {
  static CubitPokemonDetailsRoute _fromState(GoRouterState state) =>
      CubitPokemonDetailsRoute(
        url: state.uri.queryParameters['url']!,
      );

  String get location => GoRouteData.$location(
        '/cubit/pokemon',
        queryParams: {
          'url': url,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BlocRouteExtension on BlocRoute {
  static BlocRoute _fromState(GoRouterState state) => BlocRoute();

  String get location => GoRouteData.$location(
        '/bloc',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BlocPokemonDetailsRouteExtension on BlocPokemonDetailsRoute {
  static BlocPokemonDetailsRoute _fromState(GoRouterState state) =>
      BlocPokemonDetailsRoute(
        url: state.uri.queryParameters['url']!,
      );

  String get location => GoRouteData.$location(
        '/bloc/pokemon',
        queryParams: {
          'url': url,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
