import 'package:flutter/material.dart';
import 'package:week4_lab/exercise/pokemon_info.dart';
import 'package:week4_lab/sample/1/pokedex_client.dart';
import 'package:week4_lab/sample/1/pokemon.dart';

class PokemonDetails extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetails({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  final _pokedexClient = PokedexClient();
  late Future<PokemonInfo> _pokemonInfo;

  @override
  void initState() {
    _pokemonInfo = _pokedexClient.getPokemonInfo(widget.pokemon.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(title: Text(widget.pokemon.name)),
      body: FutureBuilder<PokemonInfo>(
        future: _pokemonInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final info = snapshot.data!;
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(32),
                    ),
                  ),
                  child: Center(
                      child: Image.network(widget.pokemon.photo, width: 300)),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    info.name,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: info.types
                      .map(
                        (type) => Chip(
                          label: Text(
                            type.name,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          backgroundColor: type.color,
                        ),
                      )
                      .toList(growable: false),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoChip(
                      label: "Weight",
                      value: (info.weight / 10).toString() + " KG",
                    ),
                    InfoChip(
                      label: "Height",
                      value: (info.height / 10).toString() + " M",
                    ),
                    InfoChip(
                      label: "Experience",
                      value: info.experience.toString(),
                    ),
                  ],
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class InfoChip extends StatelessWidget {
  final String label;
  final String value;

  const InfoChip({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 32, color: Colors.white),
        ),
        const SizedBox(height: 16),
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
