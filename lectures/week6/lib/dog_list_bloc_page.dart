import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6/bloc/dog_list_bloc.dart';
import 'package:week6/bloc/dog_list_state.dart';
import 'package:week6/widgets/dog_list_data_widget.dart';
import 'package:week6/widgets/empty_dog_list_widget.dart';
import 'package:week6/widgets/loading_widget.dart';

class DogListBlocPage extends StatelessWidget {
  const DogListBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog List with Bloc/Cubit'),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<DogListBloc, DogListState>(
        builder: (context, state) => switch (state) {
          LoadingDogList _ => const LoadingWidget(),
          EmptyDogList _ => const EmptyDogListWidget(),
          FetchedDogList dogList => DogListDataWidget(dogList: dogList),
        },
      ),
    );
  }
}
