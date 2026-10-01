import 'package:flutter/material.dart';
import 'package:lecture_week5/bloc/dog_list_state.dart';

class const DogListDataWidget({
  super.key,
  required final FetchedDogList _dogList,
  required final Future<void> Function() _onFetch,
}) extends StatelessWidget {
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
