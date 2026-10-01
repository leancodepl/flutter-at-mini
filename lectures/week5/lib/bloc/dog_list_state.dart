import 'package:lecture_week5/data/dog.dart';

sealed class DogListState {
  const DogListState();
}

class LoadingDogList extends DogListState {
  const LoadingDogList();
}

class EmptyDogList extends DogListState {
  const EmptyDogList();
}

class FetchedDogList extends DogListState {
  const FetchedDogList({required this.dogs});

  final List<Dog> dogs;
}
