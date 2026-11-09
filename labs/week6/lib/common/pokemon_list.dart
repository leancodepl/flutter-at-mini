import 'package:flutter/material.dart';
import 'package:labs_week6/pokemon.dart';

class const PokemonList({
  super.key,
  required final List<PokemonEntry> entries,
  required final ValueChanged<PokemonEntry> onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: entries.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) =>
          _PokemonEntryTile(entries[index], onTap: onTap),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}

class const _PokemonEntryTile(
  final PokemonEntry entry, {
  required final ValueChanged<PokemonEntry> onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card.filled(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: () => onTap(entry),
        title: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(entry.name),
        ),
      ),
    );
  }
}
