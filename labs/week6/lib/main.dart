import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class const MyApp({super.key}) extends StatelessWidget {
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

class const HomePage({super.key}) extends StatelessWidget {
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
                onTap: () => throw UnimplementedError('TODO'),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _PageCard(
                label: 'Bloc',
                onTap: () => throw UnimplementedError('TODO'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final _router = GoRouter(routes: [/* TODO: use generated routes */]);

class const _PageCard({
  required final String label,
  required final VoidCallback onTap,
}) extends StatelessWidget {
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
