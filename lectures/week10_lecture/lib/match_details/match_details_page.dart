import 'package:flutter/material.dart';
import 'package:testing/matches/matches_models.dart';
import 'package:testing/ui/match_result.dart';

class MatchDetailsPage extends StatelessWidget {
  const MatchDetailsPage({
    super.key,
    required this.match,
  });

  final Match match;

  @override
  Widget build(BuildContext context) {
    const countryStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    match.homeTeam.name,
                    style: countryStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(child: MatchResult(match: match)),
                Expanded(
                  child: Text(
                    match.awayTeam.name,
                    style: countryStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              match.venue,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.blueGrey,
              ),
            ),
            Text(
              match.location,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
