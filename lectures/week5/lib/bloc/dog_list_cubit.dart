import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecture_week5/bloc/dog_list_state.dart';
import 'package:lecture_week5/data/dog_api.dart';

class DogListCubit({required final DogApi _api}) extends Cubit<DogListState> {
  this : super(const EmptyDogList());

  Future<void> fetchDogs() async {
    if (state is! FetchedDogList) {
      emit(const LoadingDogList());
    }
    await Future<void>.delayed(const Duration(seconds: 5));
    final dogs = await _api.fetchAll();
    emit(FetchedDogList(dogs: dogs));
  }
}
