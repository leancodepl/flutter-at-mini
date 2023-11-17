import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6_lab/beer_tile.dart';
import 'package:week6_lab/bloc/beers_bloc.dart';

class BlocPage extends StatelessWidget {
  const BlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BeersBloc()..add(FetchBeers()),
      child: Scaffold(
        appBar: AppBar(title: Text('Bloc Beers')),
        body: BlocBuilder<BeersBloc, BeersState>(
          builder: (context, state) {
            switch (state) {
              case BeersLoading():
                return Center(
                  child: CircularProgressIndicator(),
                );
              case BeersData(beers: final beers):
                return ListView.builder(
                  itemCount: beers.length,
                  itemBuilder: (_, i) {
                    final beer = beers[i];

                    return BeerTile(beer: beer);
                  },
                );
            }
          },
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              child: Icon(Icons.refresh),
              onPressed: () => context.read<BeersBloc>().add(FetchBeers()),
            );
          },
        ),
      ),
    );
  }
}
