import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:week6/bloc/bloc_page.dart';
import 'package:week6/comms/comms_page.dart';
import 'package:week6/cubit/cubit_page.dart';
import 'package:week6/main.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<CubitRoute>(path: 'cubit'),
    TypedGoRoute<BlocRoute>(path: 'bloc'),
    TypedGoRoute<CommsRoute>(path: 'comms'),
  ],
)
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class CubitRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CubitPage();
  }
}

class BlocRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BlocPage();
  }
}

class CommsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CommsPage();
  }
}
