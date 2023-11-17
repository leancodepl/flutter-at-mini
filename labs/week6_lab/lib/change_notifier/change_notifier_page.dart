import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_lab/beer_tile.dart';
import 'package:week6_lab/change_notifier/beers_notifier.dart';

class ChangeNotifierPage extends StatelessWidget {
  const ChangeNotifierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BeersNotifier>(
      create: (_) => BeersNotifier()..fetch(),
      builder: (context, _) {
        final beersNotifier = context.watch<BeersNotifier>();
        return Scaffold(
          appBar: AppBar(
            title: Text('ChangeNotifier Beers'),
          ),
          body: beersNotifier.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: beersNotifier.beers.length,
                  itemBuilder: (_, i) {
                    final beer = beersNotifier.beers[i];

                    return BeerTile(beer: beer);
                  },
                ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () => context.read<BeersNotifier>().fetch(),
          ),
        );
      },
    );
  }
}
