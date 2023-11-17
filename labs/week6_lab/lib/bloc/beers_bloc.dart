import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:week6_lab/beer.dart';

class BeersBloc extends Bloc<BeersEvent, BeersState> {
  BeersBloc() : super(BeersLoading()) {
    on<FetchBeers>(_fetch);
  }

  Future<void> _fetch(FetchBeers event, Emitter<BeersState> emit) async {
    emit(BeersLoading());
    final res = await http.get(_uri);
    final json = (jsonDecode(res.body) as List).cast<Map<String, dynamic>>();
    final beers = json.map(Beer.fromJson).toList();
    emit(BeersData(beers: beers));
  }

  final _uri = Uri.parse('https://api.sampleapis.com/beers/ale');
}

sealed class BeersEvent {}

class FetchBeers extends BeersEvent {}

sealed class BeersState {}

class BeersData extends BeersState {
  BeersData({required this.beers}) : super();

  final List<Beer> beers;
}

class BeersLoading extends BeersState {}
