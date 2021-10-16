import 'package:flutter/material.dart';
import 'package:week4_lab/sample/1/pokedex_client.dart';
import 'package:week4_lab/sample/1/pokemon.dart';

class Sample2 extends StatefulWidget {
  const Sample2({Key? key}) : super(key: key);

  @override
  State<Sample2> createState() => _Sample2State();
}

class _Sample2State extends State<Sample2> {
  final _pokedexClient = PokedexClient();
  bool _isLoading = true;
  final List<Pokemon> _pokemons = List.empty(growable: true);

  @override
  void initState() {
    _pokedexClient.getFirstPokemonsPage().then((result) {
      setState(() {
        _isLoading = false;
        if (!result.isError) {
          _pokemons.addAll(result.pokemons);
        }
      });
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
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                color: Colors.blueGrey,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  padding: const EdgeInsets.all(8),
                  children: List.generate(
                    _pokemons.length,
                    (index) => ListItem(pokemon: _pokemons[index]),
                  ),
                ),
              ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Pokemon pokemon;

  const ListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: Colors.grey[900],
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            pokemon.photo,
            height: 100,
          ),
          const SizedBox(height: 8.0),
          Text(pokemon.name),
        ],
      ),
    );
  }
}
