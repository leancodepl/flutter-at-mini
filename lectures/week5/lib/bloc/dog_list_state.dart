import 'package:lecture_week5/data/dog.dart';

sealed class const DogListState();

class const LoadingDogList() extends DogListState;

class const EmptyDogList() extends DogListState;

class const FetchedDogList({required final List<Dog> dogs})
    extends DogListState;
