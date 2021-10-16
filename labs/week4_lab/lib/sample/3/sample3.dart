import 'package:flutter/material.dart';
import 'package:week4_lab/sample/1/pokedex_client.dart';
import 'package:week4_lab/sample/1/pokemon.dart';

class Sample3 extends StatefulWidget {
  const Sample3({Key? key}) : super(key: key);

  @override
  State<Sample3> createState() => _Sample3State();
}

class _Sample3State extends State<Sample3> {
  final _pokedexClient = PokedexClient();
  final _scrollController = ScrollController();
  bool _isLoading = true;
  bool _isLoadingMore = false;
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

    _scrollController.addListener(() {
      if (_scrollController.position.pixels + 150 >
              _scrollController.position.maxScrollExtent &&
          !_isLoadingMore) {
        setState(() {
          _isLoadingMore = true;
        });
        _pokedexClient.getNextPokemonsPage().then((result) {
          setState(() {
            _isLoadingMore = false;
            if (!result.isError) {
              _pokemons.addAll(result.pokemons);
            }
          });
        });
      }
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
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.count(
                        controller: _scrollController,
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
                    if (_isLoadingMore)
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: const CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        ),
                      )
                  ],
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
