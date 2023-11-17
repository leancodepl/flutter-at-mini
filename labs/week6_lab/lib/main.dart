import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:week6_lab/bloc/bloc_page.dart';
import 'package:week6_lab/change_notifier/change_notifier_page.dart';
import 'package:week6_lab/comms/comms_page.dart';
import 'package:week6_lab/cubit/cubit_page.dart';
import 'package:week6_lab/riverpod/riverpod_page.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Beer App'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('ChangeNotifier'),
            onTap: () => context.push('/changeNotifier'),
          ),
          ListTile(
            title: Text('Cubit'),
            onTap: () => context.push('/cubit'),
          ),
          ListTile(
            title: Text('Bloc'),
            onTap: () => context.push('/bloc'),
          ),
          ListTile(
            title: Text('Riverpod'),
            onTap: () => context.push('/riverpod'),
          ),
          ListTile(
            title: Text('Comms'),
            onTap: () => context.push('/comms'),
          ),
        ],
      ),
    );
  }
}

final _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'home',
    builder: (context, state) => const HomePage(),
    routes: [
      GoRoute(
        path: 'changeNotifier',
        builder: (context, state) => ChangeNotifierPage(),
      ),
      GoRoute(
        path: 'cubit',
        builder: (context, state) => CubitPage(),
      ),
      GoRoute(
        path: 'bloc',
        builder: (context, state) => BlocPage(),
      ),
      GoRoute(
        path: 'riverpod',
        builder: (context, state) => RiverpodPage(),
      ),
      GoRoute(
        path: 'comms',
        builder: (context, state) => CommsPage(),
      ),
    ],
  ),
]);
