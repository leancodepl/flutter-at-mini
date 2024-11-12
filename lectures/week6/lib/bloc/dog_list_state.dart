import 'package:week6/data/dog.dart';

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
