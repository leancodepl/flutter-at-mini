import 'package:flutter/material.dart';
import 'package:week5/pokemon.dart';
import 'package:week5/task.dart';

class PokemonData extends StatefulWidget {
  const PokemonData({super.key});

  @override
  State<PokemonData> createState() => _PokemonDataState();
}

class _PokemonDataState extends State<PokemonData> {
  // ---------------------------------------------------------------
  Future<void> _loadPokemonSlow() async {
    await _load(loadPokemonSlow);
  }

  Future<void> _loadPokemonFastAndEasy() async {
    await _load(loadPokemonFastAndEasy);
  }

  Future<void> _loadPokemonFastAndComplex() async {
    await _load(loadPokemonFastAndComplex);
  }
  // ---------------------------------------------------------------

  bool isLoading = false;
  Pokemon? selectedPokemon;

  Future<void> _load(Future<Pokemon> Function() callback) async {
    setState(() {
      selectedPokemon = null;
      isLoading = true;
    });
    try {
      final selected = await callback();
      setState(() => selectedPokemon = selected);
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon!'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selectedPokemon
                case Pokemon(
                  :final id,
                  :final name,
                  :final baseExperience,
                  :final height,
                  :final weight,
                ))
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(name, style: theme.textTheme.displayLarge),
                      const SizedBox(height: 16),
                      Image.network(
                        'https://raw.githubusercontent.com/HybridShivam/Pokemon/master/assets/images/${id.toString().padLeft(3, '0')}.png',
                        width: 200,
                        height: 200,
                        frameBuilder: (context, child, frame, _) {
                          return Container(
                            width: 216,
                            height: 216,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: theme.colorScheme.outlineVariant,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: frame == null
                                ? const CircularProgressIndicator()
                                : Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: child,
                                  ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Base XP: $baseExperience',
                        style: theme.textTheme.bodyMedium,
                      ),
                      Text(
                        'Height: ${(height / 10).toStringAsFixed(1)} m',
                        style: theme.textTheme.bodyMedium,
                      ),
                      Text(
                        'Weight: ${(weight / 10).toStringAsFixed(1)} kg',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              )
            else if (isLoading)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else
              const Expanded(child: Center(child: Text('Load one :)'))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: FilledButton.tonal(
                    onPressed: _loadPokemonSlow,
                    child: const Text('Slow'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: FilledButton.tonal(
                    onPressed: _loadPokemonFastAndEasy,
                    child: const Text('Fast & Easy'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: FilledButton.tonal(
                    onPressed: _loadPokemonFastAndComplex,
                    child: const Text('Fast & Complex'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
