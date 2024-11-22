import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6/bloc/dog_list_cubit.dart';
import 'package:week6/bloc/dog_list_state.dart';
import 'package:week6/widgets/dog_list_data_widget.dart';
import 'package:week6/widgets/empty_dog_list_widget.dart';
import 'package:week6/widgets/loading_widget.dart';

class DogListCubitPage extends StatelessWidget {
  const DogListCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog List with Bloc/Cubit'),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<DogListCubit, DogListState>(
        builder: (context, state) => switch (state) {
          LoadingDogList() => const LoadingWidget(),
          EmptyDogList() => EmptyDogListWidget(
              onFetch: () => context.read<DogListCubit>().fetchDogs(),
            ),
          final FetchedDogList dogList => DogListDataWidget(
              dogList: dogList,
              onFetch: () => context.read<DogListCubit>().fetchDogs(),
            ),
        },
      ),
    );
  }
}
