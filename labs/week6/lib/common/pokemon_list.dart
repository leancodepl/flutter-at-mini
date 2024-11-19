import 'package:flutter/material.dart';
import 'package:week6/pokemon.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({
    super.key,
    required this.entries,
  });

  final List<PokemonEntry> entries;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: entries.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) => _PokemonEntryTile(entries[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}

class _PokemonEntryTile extends StatelessWidget {
  const _PokemonEntryTile(this.entry);

  final PokemonEntry entry;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: () {
          // TODO: open details page
          throw UnimplementedError('TODO');
        },
        title: Text(entry.name),
      ),
    );
  }
}
