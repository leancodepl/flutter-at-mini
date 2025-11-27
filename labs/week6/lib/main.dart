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
      appBar: AppBar(title: const Text('Week 6')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: _PageCard(
                label: 'Cubit',
                onTap: () => const CubitRoute().go(context),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _PageCard(
                label: 'Bloc',
                onTap: () => const BlocRoute().go(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final _router = GoRouter(routes: $appRoutes);

class _PageCard extends StatelessWidget {
  const _PageCard({required this.label, required this.onTap});

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
          child: Text(label, style: Theme.of(context).textTheme.headlineSmall),
        ),
      ),
    );
  }
}
