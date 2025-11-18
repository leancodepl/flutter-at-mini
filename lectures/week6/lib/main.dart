import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6/balance_event_transformer_page.dart';
import 'package:week6/bloc/dog_list_bloc.dart';
import 'package:week6/bloc/dog_list_cubit.dart';
import 'package:week6/data/dog_api.dart';
import 'package:week6/dog_list_bloc_page.dart';
import 'package:week6/dog_list_cubit_page.dart';
import 'package:week6/dog_list_request_cubit_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => DogApi(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const _HomeTabsPage(),
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.trackpad,
          },
        ),
      ),
    );
  }
}

class _HomeTabsPage extends StatefulWidget {
  const _HomeTabsPage();

  @override
  State<_HomeTabsPage> createState() => _HomeTabsPageState();
}

class _HomeTabsPageState extends State<_HomeTabsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog List – Cubit vs Bloc'),
        actions: [
          IconButton(
            tooltip: 'Clear DogApi cache',
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              context.read<DogApi>().clearCache();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('DogApi cache cleared'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Cubit scope'),
            Tab(text: 'Bloc scope'),
            Tab(text: 'EventTransformer'),
            Tab(text: 'RequestCubit'),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _tabController,
        builder: (context, _) {
          switch (_tabController.index) {
            case 0:
              return const _CubitTab();
            case 1:
              return const _BlocTab();
            case 2:
              return const BalanceEventTransformerPage();
            case 3:
              return const DogListRequestCubitPage();
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class _CubitTab extends StatelessWidget {
  const _CubitTab();

  @override
  Widget build(BuildContext context) {
    final api = context.read<DogApi>();
    return BlocProvider(
      create: (_) => DogListCubit(api: api),
      child: const DogListCubitPage(),
    );
  }
}

class _BlocTab extends StatelessWidget {
  const _BlocTab();

  @override
  Widget build(BuildContext context) {
    final api = context.read<DogApi>();
    return BlocProvider(
      create: (_) => DogListBloc(api: api),
      child: const DogListBlocPage(),
    );
  }
}
