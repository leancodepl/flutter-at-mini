import 'package:flutter/material.dart';
import 'package:labs_week5/pokemon_data.dart';

void main() {
  runApp(const MyApp());
}

class const MyApp({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
        ),
      ),
      home: const PokemonData(),
    );
  }
}
