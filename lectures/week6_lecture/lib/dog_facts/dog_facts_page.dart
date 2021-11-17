import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6_lecture/dog_facts/dog_facts_cubit.dart';

class DogFactsPage extends StatelessWidget {
  const DogFactsPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => DogFactsCubit()..fetch(),
          child: const DogFactsPage(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog facts'),
      ),
      body: BlocBuilder<DogFactsCubit, DogFactsState>(
        builder: (context, state) {
          if (state is DogFactsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DogFactsLoaded) {
            return RefreshIndicator(
              onRefresh: context.read<DogFactsCubit>().fetch,
              child: ListView(
                children: state.facts
                    .map((f) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(f),
                        ))
                    .toList(),
              ),
            );
          } else {
            return const Center(
              child: Text('error'),
            );
          }
        },
      ),
    );
  }
}
