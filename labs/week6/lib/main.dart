import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:week6/routes/routes.dart';

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
            onTap: () => throw UnimplementedError('TODO'),
          ),
          ListTile(
            title: const Text('Bloc'),
            onTap: () => throw UnimplementedError('TODO'),
          ),
          ListTile(
            title: const Text('Comms'),
            onTap: () => throw UnimplementedError('TODO'),
          ),
        ],
      ),
    );
  }
}

final _router = GoRouter(
  routes: $appRoutes,
);
