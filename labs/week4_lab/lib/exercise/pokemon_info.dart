import 'package:flutter/material.dart';

class PokemonInfo {
  late final String name;
  late final int order;
  late final int weight;
  late final int height;
  late final int experience;
  late final List<Type> types;

  PokemonInfo._({
    required this.name,
    required this.order,
    required this.weight,
    required this.height,
    required this.experience,
    required this.types,
  });

  factory PokemonInfo.fromJson(Map<String, dynamic> json) {
    // Parse types
    final typesList = json['types'] as List;

    return PokemonInfo._(
      name: json['name'],
      order: json['order'],
      weight: json['weight'],
      height: json['height'],
      experience: json['base_experience'],
      types: typesList
          .map((i) => typeFromName(i['type']['name']))
          .toList(growable: false),
    );
  }
}

enum Type { grass, poison, fire, water, bug, normal, flying, other }

Type typeFromName(String name) {
  if (name == 'grass') {
    return Type.grass;
  } else if (name == 'poison') {
    return Type.poison;
  } else if (name == 'fire') {
    return Type.fire;
  } else if (name == 'water') {
    return Type.water;
  } else if (name == 'bug') {
    return Type.bug;
  } else if (name == 'normal') {
    return Type.normal;
  } else if (name == 'flying') {
    return Type.flying;
  } else {
    return Type.other;
  }
}

extension TypeExtension on Type {
  Color get color {
    switch (this) {
      case Type.grass:
        return Colors.green;
      case Type.poison:
        return Colors.purple;
      case Type.fire:
        return Colors.red;
      case Type.water:
        return Colors.blue;
      case Type.bug:
        return Colors.lightGreenAccent;
      case Type.normal:
        return Colors.brown;
      case Type.flying:
        return Colors.grey;
      case Type.other:
        return Colors.yellow;
    }
  }

  String get name {
    switch (this) {
      case Type.grass:
        return 'Grass';
      case Type.poison:
        return 'Poison';
      case Type.fire:
        return 'Fire';
      case Type.water:
        return 'Water';
      case Type.bug:
        return 'Bug';
      case Type.normal:
        return 'Normal';
      case Type.flying:
        return 'Flying';
      case Type.other:
        return 'Other';
    }
  }
}
