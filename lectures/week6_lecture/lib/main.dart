// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    hide ChangeNotifierProvider;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:state/bloc/counter.dart';
import 'package:state/change_notifier/counter.dart';
import 'package:state/cubit/counter.dart';
import 'package:state/home_page.dart';
import 'package:state/hydrated_cubit/counter.dart';
import 'package:state/redux/counter.dart';
import 'package:state/value_notifier/counter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await createStorage();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterChangeNotifier()),
        ChangeNotifierProvider(create: (_) => CounterValueNotifier()),
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => CounterHydratedCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'State Management Demo'),
      ),
    );
  }
}

Future<Storage> createStorage() async => HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory(),
    );
