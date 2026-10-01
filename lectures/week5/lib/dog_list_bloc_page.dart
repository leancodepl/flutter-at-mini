import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecture_week5/bloc/dog_list_bloc.dart';
import 'package:lecture_week5/bloc/dog_list_event.dart';
import 'package:lecture_week5/bloc/dog_list_state.dart';
import 'package:lecture_week5/widgets/dog_list_data_widget.dart';
import 'package:lecture_week5/widgets/empty_dog_list_widget.dart';
import 'package:lecture_week5/widgets/loading_widget.dart';

class const DogListBlocPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogListBloc, DogListState>(
      builder: (context, state) => switch (state) {
        LoadingDogList() => const LoadingWidget(),
        EmptyDogList() => EmptyDogListWidget(
          onFetch: () => context.read<DogListBloc>().add(FetchDogs()),
        ),
        final FetchedDogList dogList => DogListDataWidget(
          dogList: dogList,
          onFetch: () async => context.read<DogListBloc>().add(FetchDogs()),
        ),
      },
    );
  }
}
