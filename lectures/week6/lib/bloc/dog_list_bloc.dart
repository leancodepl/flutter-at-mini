import 'package:bloc/bloc.dart';
import 'package:week6/bloc/dog_list_event.dart';
import 'package:week6/bloc/dog_list_state.dart';
import 'package:week6/data/dog_api.dart';

class DogListBloc extends Bloc<DogListEvent, DogListState> {
  DogListBloc() : super(const EmptyDogList()) {
    on<FetchDogs>((_, emit) async {
      emit(const LoadingDogList());
      final dogs = await _api.fetchAll();
      emit(FetchedDogList(dogs: dogs));
    });
  }

  final _api = DogApi();
}
