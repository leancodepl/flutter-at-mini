import 'package:testing/matches/matches_models.dart';

final finishedMatch = Match(
  id: 1,
  location: 'Doha',
  status: 'completed',
  venue: 'Stadium',
  awayTeam: Team(country: 'POL', name: 'Poland', goals: 0, penalties: 0),
  homeTeam: Team(country: 'ARG', name: 'Argentina', goals: 2, penalties: 0),
);

final futureMatch = Match(
  id: 1,
  location: 'Doha',
  status: 'completed',
  venue: 'Stadium',
  awayTeam: Team(country: 'POL', name: 'Poland', goals: null, penalties: null),
  homeTeam:
      Team(country: 'ARG', name: 'Argentina', goals: null, penalties: null),
);

final penaltiesMatch = Match(
  id: 1,
  location: 'Doha',
  status: 'completed',
  venue: 'Stadium',
  awayTeam: Team(country: 'POL', name: 'Poland', goals: 0, penalties: 3),
  homeTeam: Team(country: 'ARG', name: 'Argentina', goals: 0, penalties: 0),
);
