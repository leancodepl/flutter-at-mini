import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/matches/matches_repository.dart';

import 'matches_models.dart';

class MatchesCubit extends Cubit<MatchesState> {
  MatchesCubit(this._matchesRepository) : super(MatchesLoading());

  final MatchesRepository _matchesRepository;

  Future<void> fetch() async {
    try {
      final response = await _matchesRepository.fetchMatches();
      emit(MatchesLoaded(response.reversed.toList()));
    } catch (e) {
      emit(const MatchesError());
    }
  }
}

abstract class MatchesState {
  const MatchesState();
}

class MatchesLoading extends MatchesState {}

class MatchesLoaded extends MatchesState {
  const MatchesLoaded(this.matches);

  final List<Match> matches;
}

class MatchesError extends MatchesState {
  const MatchesError();
}
