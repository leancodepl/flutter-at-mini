import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:week6/bloc/bloc_page.dart';
import 'package:week6/comms/comms_page.dart';
import 'package:week6/cubit/cubit_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Week 6',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
        ),
      ),
      routerConfig: _router,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beer App'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubit'),
            onTap: () => context.go('/cubit'),
          ),
          ListTile(
            title: const Text('Bloc'),
            onTap: () => context.go('/bloc'),
          ),
          ListTile(
            title: const Text('Comms'),
            onTap: () => context.go('/comms'),
          ),
        ],
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'cubit',
          builder: (context, state) => const CubitPage(),
        ),
        GoRoute(
          path: 'bloc',
          builder: (context, state) => const BlocPage(),
        ),
        GoRoute(
          path: 'comms',
          builder: (context, state) => const CommsPage(),
        ),
      ],
    ),
  ],
);
