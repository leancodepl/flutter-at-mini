import 'package:bloc/bloc.dart';
import 'package:lecture_week5/bloc/dog_list_event.dart';
import 'package:lecture_week5/bloc/dog_list_state.dart';
import 'package:lecture_week5/data/dog_api.dart';

class DogListBloc({required final DogApi _api})
    extends Bloc<DogListEvent, DogListState> {
  this : super(const EmptyDogList()) {
    on<FetchDogs>((_, emit) async {
      emit(const LoadingDogList());
      final dogs = await _api.fetchAll();
      emit(FetchedDogList(dogs: dogs));
    });
  }
}
