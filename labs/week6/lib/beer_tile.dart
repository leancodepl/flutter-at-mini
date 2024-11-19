import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:week6/beer.dart';

final _formatter = NumberFormat('#.0#');

class BeerTile extends StatelessWidget {
  const BeerTile({
    super.key,
    required this.beer,
  });

  final Beer beer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Image.network(
            beer.imageUrl,
            errorBuilder: (_, __, ___) => const Placeholder(),
            width: 64,
            height: 64,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(beer.name),
                const SizedBox(height: 8),
                Text('Rating: ${_formatter.format(beer.avgRating)}'),
              ],
            ),
          ),
          const Spacer(),
          const SizedBox(width: 8),
          Text(beer.price),
        ],
      ),
    );
  }
}
