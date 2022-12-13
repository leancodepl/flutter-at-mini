import 'package:flutter/material.dart';
import 'package:testing/ui/match_result.dart';

import '../matches/matches_models.dart';

class MatchItem extends StatelessWidget {
  const MatchItem({
    super.key,
    required this.match,
    required this.onTap,
  });

  final Match match;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const countryStyle = TextStyle(
      fontSize: 16,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      match.homeTeam.country,
                      style: countryStyle,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      match.awayTeam.country,
                      style: countryStyle,
                    ),
                  ],
                ),
                MatchResult(match: match),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
