import 'package:flutter/material.dart';
import 'package:week6/bloc/dog_list_state.dart';

class DogListDataWidget extends StatelessWidget {
  const DogListDataWidget({
    super.key,
    required FetchedDogList dogList,
    required Future<void> Function() onFetch,
  }) : _dogList = dogList,
       _onFetch = onFetch;

  final FetchedDogList _dogList;
  final Future<void> Function() _onFetch;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onFetch,
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: _dogList.dogs.length,
        itemBuilder: (context, index) =>
            Image.network(_dogList.dogs[index].url),
      ),
    );
  }
}
