import 'dart:async';
import 'dart:convert';

import 'package:comms/comms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:week6_lab/beer.dart';
import 'package:week6_lab/comms/cart_events.dart';

class BeersCubit extends Cubit<BeersState> with Sender<CartEvent> {
  BeersCubit() : super(BeersLoading());

  Future<void> fetch() async {
    send<CartEvent>(ResetBeers());
    emit(BeersLoading());
    final res = await http.get(_uri);
    final json = (jsonDecode(res.body) as List).cast<Map<String, dynamic>>();
    final beers = json.map(Beer.fromJson).toList();
    emit(BeersData(beers: beers));
  }

  final _uri = Uri.parse('https://api.sampleapis.com/beers/ale');
}

sealed class BeersState {}

class BeersData extends BeersState {
  BeersData({required this.beers}) : super();

  final List<Beer> beers;
}

class BeersLoading extends BeersState {}
