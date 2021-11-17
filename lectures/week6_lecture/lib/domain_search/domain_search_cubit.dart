import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

class DomainSearchBloc extends Bloc<SearchEvent, SearchState> {
  DomainSearchBloc() : super(const SearchEmpty()) {
    on<TextChanged>(_search,
        transformer: (events, mapper) => events
            .debounce(const Duration(milliseconds: 500))
            .switchMap(mapper));
  }

  static const _endpoint =
      'https://api.domainsdb.info/v1/domains/search?domain=';
  final _client = http.Client();

  _search(
    TextChanged event,
    Emitter emit,
  ) async {
    final text = event.text;

    if (text.isEmpty) {
      emit(const SearchEmpty());
      return;
    }

    emit(const SearchLoading());

    try {
      final response = await _client.get(Uri.parse(_endpoint + text));
      final dict = json.decode(response.body) as Map;
      final domains = (dict['domains'] as List)
          .map((f) => f['domain'])
          .cast<String>()
          .toList();

      emit(SearchLoaded(domains));
    } catch (e) {
      emit(const SearchError());
    }
  }
}

abstract class SearchEvent {
  const SearchEvent();
}

class TextChanged extends SearchEvent {
  const TextChanged(this.text);

  final String text;
}

abstract class SearchState {
  const SearchState();
}

class SearchEmpty extends SearchState {
  const SearchEmpty();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchLoaded extends SearchState {
  const SearchLoaded(this.domains);

  final List<String> domains;
}

class SearchError extends SearchState {
  const SearchError();
}
