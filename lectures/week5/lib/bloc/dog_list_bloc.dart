import 'package:bloc/bloc.dart';
import 'package:lecture_week5/bloc/dog_list_event.dart';
import 'package:lecture_week5/bloc/dog_list_state.dart';
import 'package:lecture_week5/data/dog_api.dart';

class DogListBloc extends Bloc<DogListEvent, DogListState> {
  DogListBloc({required DogApi api}) : _api = api, super(const EmptyDogList()) {
    on<FetchDogs>((_, emit) async {
      emit(const LoadingDogList());
      final dogs = await _api.fetchAll();
      emit(FetchedDogList(dogs: dogs));
    });
  }

  final DogApi _api;
}
