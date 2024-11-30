import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
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
        title: const Text('Week 8'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: _PageCard(
                label: 'In-memory',
                onTap: () => context.go('/in-memory'),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _PageCard(
                label: 'Drift',
                onTap: () => context.go('/drift'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'in-memory',
          builder: (context, state) => throw UnimplementedError(),
        ),
        GoRoute(
          path: 'drift',
          builder: (context, state) => throw UnimplementedError(),
        ),
      ],
    ),
  ],
);

class _PageCard extends StatelessWidget {
  const _PageCard({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
