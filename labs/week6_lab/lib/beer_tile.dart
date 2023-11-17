import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:week6_lab/beer.dart';

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
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox.square(
            dimension: 64,
            child: Image.network(
              beer.imageUrl,
              errorBuilder: (_, __, ___) => Placeholder(),
            ),
          ),
          SizedBox(width: 8),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(beer.name),
                SizedBox(height: 8),
                Text('Rating: ${_formatter.format(beer.avgRating)}'),
              ],
            ),
          ),
          Spacer(),
          SizedBox(width: 8),
          Text(beer.price),
        ],
      ),
    );
  }
}
