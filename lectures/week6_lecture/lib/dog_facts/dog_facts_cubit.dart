import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class DogFactsCubit extends Cubit<DogFactsState> {
  DogFactsCubit() : super(const DogFactsLoading());

  static const _endpoint =
      'https://dog-facts-api.herokuapp.com/api/v1/resources/dogs/all';
  final _client = http.Client();

  Future<void> fetch() async {
    emit(const DogFactsLoading());

    try {
      final response = await _client.get(Uri.parse(_endpoint));
      final dict = json.decode(response.body);
      final facts =
          (dict as List).map((f) => f['fact']).cast<String>().toList();

      emit(DogFactsLoaded(facts));
    } catch (e) {
      emit(const DogFactsError());
    }
  }
}

abstract class DogFactsState {
  const DogFactsState();
}

class DogFactsLoading extends DogFactsState {
  const DogFactsLoading();
}

class DogFactsLoaded extends DogFactsState {
  const DogFactsLoaded(this.facts);

  final List<String> facts;
}

class DogFactsError extends DogFactsState {
  const DogFactsError();
}
