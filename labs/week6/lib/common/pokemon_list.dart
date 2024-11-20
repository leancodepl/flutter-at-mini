import 'package:flutter/material.dart';
import 'package:week6/pokemon.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({
    super.key,
    required this.entries,
    required this.onTap,
  });

  final List<PokemonEntry> entries;
  final ValueChanged<PokemonEntry> onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: entries.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) => _PokemonEntryTile(
        entries[index],
        onTap: onTap,
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}

class _PokemonEntryTile extends StatelessWidget {
  const _PokemonEntryTile(this.entry, {required this.onTap});

  final PokemonEntry entry;
  final ValueChanged<PokemonEntry> onTap;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: () => onTap(entry),
        title: Text(entry.name),
      ),
    );
  }
}
