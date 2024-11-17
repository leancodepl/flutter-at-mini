import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6/bloc/dog_list_state.dart';
import 'package:week6/data/dog_api.dart';

class DogListCubit extends Cubit<DogListState> {
  DogListCubit() : super(const EmptyDogList());

  final _api = DogApi();

  Future<void> fetchDogs() async {
    if (state is! FetchedDogList) {
      emit(const LoadingDogList());
    }
    await Future<void>.delayed(const Duration(seconds: 5));
    final dogs = await _api.fetchAll();
    emit(FetchedDogList(dogs: dogs));
  }
}
