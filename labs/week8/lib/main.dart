import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localstore/localstore.dart';
import 'package:provider/provider.dart';
import 'package:week8/data_source/drift_data_source.dart';
import 'package:week8/data_source/hive_data_source.dart';
import 'package:week8/data_source/in_memory.dart';
import 'package:week8/data_source/localstore_data_source.dart';
import 'package:week8/db/todo_database.dart';
import 'package:week8/todo_cubit.dart';
import 'package:week8/todo_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TodoAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: Localstore.instance),
        Provider(
          create: (context) => TodoDatabase(),
          dispose: (context, db) => db.close(),
        ),
        Provider(create: (context) => InMemoryTodoDataSource()),
        Provider(create: (context) => DriftTodoDataSource(db: context.read())),
        Provider(
          create: (context) =>
              HiveTodoDataSource(boxFuture: Hive.openBox('todos')),
        ),
        Provider(
          create: (context) =>
              LocalstoreTodoDataSource(localstore: context.read()),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
            dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
          ),
        ),
        routerConfig: _router,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Week 8')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _PageCard(
                      label: 'In-memory',
                      onTap: () => context.go('/in-memory'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _PageCard(
                      label: 'Drift',
                      onTap: () => context.go('/drift'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _PageCard(
                      label: 'Hive',
                      onTap: () => context.go('/hive'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _PageCard(
                      label: 'Localstore',
                      onTap: () => context.go('/localstore'),
                    ),
                  ),
                ],
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
          builder: (context, state) => BlocProvider(
            create: (context) =>
                TodoCubit(dataSource: context.read<InMemoryTodoDataSource>())
                  ..refresh(),
            child: const TodoPage(),
          ),
        ),
        GoRoute(
          path: 'drift',
          builder: (context, state) => BlocProvider(
            create: (context) =>
                TodoCubit(dataSource: context.read<DriftTodoDataSource>())
                  ..refresh(),
            child: const TodoPage(),
          ),
        ),
        GoRoute(
          path: 'hive',
          builder: (context, state) => BlocProvider(
            create: (context) =>
                TodoCubit(dataSource: context.read<HiveTodoDataSource>())
                  ..refresh(),
            child: const TodoPage(),
          ),
        ),
        GoRoute(
          path: 'localstore',
          builder: (context, state) => BlocProvider(
            create: (context) =>
                TodoCubit(dataSource: context.read<LocalstoreTodoDataSource>())
                  ..refresh(),
            child: const TodoPage(),
          ),
        ),
      ],
    ),
  ],
);

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
