import 'package:flutter/material.dart';
import 'package:testing/matches/matches_models.dart';

class MatchResult extends StatelessWidget {
  const MatchResult({
    super.key,
    required this.match,
  });

  final Match match;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${match.homeTeam.goals?.toString() ?? '-'} : ${match.awayTeam.goals?.toString() ?? '-'}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (match.finishedWithPenalties)
          Text(
            '${match.homeTeam.penalties?.toString() ?? ''} (P) ${match.awayTeam.penalties?.toString() ?? ''}',
            style: const TextStyle(fontSize: 12),
          ),
      ],
    );
  }
}
