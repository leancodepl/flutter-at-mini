import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:week8_lab/data_sources/in_memory.dart';
import 'package:week8_lab/data_sources/isar.dart';
import 'package:week8_lab/todo_cubit.dart';
import 'package:week8_lab/todo_page.dart';

void main() {
  runApp(const MyApp());
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
        title: const Text('Beer App'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('In-memory store'),
            onTap: () => context.push('/in-memory'),
          ),
          ListTile(
            title: const Text('Isar'),
            onTap: () => context.push('/isar'),
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
          path: 'in-memory',
          builder: (context, state) => BlocProvider(
            create: (_) => TodoCubit(
              dataSource: InMemoryTodoDataSource(),
            )..init(),
            child: const TodoPage(),
          ),
        ),
        GoRoute(
          path: 'isar',
          builder: (context, state) => BlocProvider(
            create: (_) => TodoCubit(
              dataSource: IsarTodoDataSource(),
            )..init(),
            child: const TodoPage(),
          ),
        ),
      ],
    ),
  ],
);
