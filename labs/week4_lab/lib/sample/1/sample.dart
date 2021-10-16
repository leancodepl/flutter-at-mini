import 'package:flutter/material.dart';
import 'package:week4_lab/sample/1/pokedex_client.dart';

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  final _pokedexClient = PokedexClient();

  @override
  void initState() {
    _pokedexClient.getFirstPokemonsPage().then((value) {
      print(value.isError);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Pokedex")),
        body: Container(),
      ),
    );
  }
}
