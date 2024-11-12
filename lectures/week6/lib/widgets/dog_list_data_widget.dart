import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6/bloc/dog_list_bloc.dart';
import 'package:week6/bloc/dog_list_event.dart';
import 'package:week6/bloc/dog_list_state.dart';

class DogListDataWidget extends StatelessWidget {
  const DogListDataWidget({
    super.key,
    required FetchedDogList dogList,
  }) : _dogList = dogList;

  final FetchedDogList _dogList;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<DogListBloc>().add(FetchDogs()),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _dogList.dogs.length,
        itemBuilder: (context, index) =>
            Image.network(_dogList.dogs[index].url),
      ),
    );
  }
}
