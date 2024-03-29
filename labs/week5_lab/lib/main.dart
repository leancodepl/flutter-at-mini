import 'package:flutter/material.dart';

import 'pokemon.dart';
import 'task.dart';

class _PokemonDataState extends State<PokemonData> {
  // ---------------------------------------------------------------
  void _loadPokemonSlow() async {
    _load(() async {
      return await loadPokemonSlow();
    });
  }

  void _loadPokemonFastAndEasy() async {
    _load(() async {
      return await loadPokemonFastAndEasy();
    });
  }

  void _loadPokemonFastAndComplex() async {
    _load(() async {
      return await loadPokemonFastAndComplex();
    });
  }
  // ---------------------------------------------------------------

  bool isLoading = false;
  Pokemon? selectedPokemon;

  void _load(Future<Pokemon> Function() callback) async {
    setState(() {
      selectedPokemon = null;
      isLoading = true;
    });
    final selected = await callback();
    setState(() {
      selectedPokemon = selected;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isLoading)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else if (selectedPokemon == null)
              const Expanded(child: Center(child: Text('Load one :)')))
            else
              Expanded(
                child: Center(
                  child: Text('Your pokemon: ${selectedPokemon!.name}'),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: _loadPokemonSlow,
                    child: const Text('Slow'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: _loadPokemonFastAndEasy,
                    child: const Text('Fast&Easy'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: _loadPokemonFastAndComplex,
                    child: const Text('Fast&Complex'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Pokemon.fromJson({}).name,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PokemonData(title: 'Pokemon!'),
    );
  }
}

class PokemonData extends StatefulWidget {
  const PokemonData({super.key, required this.title});

  final String title;

  @override
  State<PokemonData> createState() => _PokemonDataState();
}
