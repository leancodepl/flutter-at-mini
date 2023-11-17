import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week6_lab/beer.dart';
import 'package:week6_lab/beer_tile.dart';
import 'package:week6_lab/riverpod/beers_notifier.dart';

class RiverpodPage extends ConsumerWidget {
  const RiverpodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beers = ref.watch(beersProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Riverpod Beers')),
      body: switch (beers) {
        AsyncLoading() => Center(
            child: CircularProgressIndicator(),
          ),
        AsyncValue<List<Beer>>(:final value!) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (_, i) {
              final beer = value[i];

              return BeerTile(beer: beer);
            },
          )
      },
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () => ref.refresh(beersProvider.future),
          );
        },
      ),
    );
  }
}
