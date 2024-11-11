import 'dart:convert';

class Pokemons {
  Pokemons({required this.pokemons});

  factory Pokemons.fromResponse(String response) {
    return Pokemons.fromJson(jsonDecode(response) as Map<String, dynamic>);
  }

  Pokemons.fromJson(Map<String, dynamic> json) : pokemons = [] {
    if (json case {'pokemon': final List<dynamic> elements}) {
      for (final (i, json as Map) in elements.indexed) {
        pokemons.add(Pokemon.fromJson(json.cast()));

        if (i % 50 == 0) {
          // we're doing _a lot_ of work here :)
          final sw = Stopwatch()..start();
          while (sw.elapsedMilliseconds < 10) {}
        }
      }
    }
  }

  final List<Pokemon> pokemons;
}

class Pokemon {
  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    required this.multipliers,
    required this.weaknesses,
    required this.nextEvolution,
    required this.prevEvolution,
  });

  Pokemon.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int? ?? 0,
        num = json['num'] as String? ?? '',
        name = json['name'] as String? ?? '',
        img = json['img'] as String? ?? '',
        type = (json['type'] as List?)?.cast() ?? [],
        height = json['height'] as String? ?? '',
        weight = json['weight'] as String? ?? '',
        candy = json['candy'] as String? ?? '',
        candyCount = json['candy_count'] as int? ?? 0,
        egg = json['egg'] as String? ?? '',
        spawnChance = asDouble(json['spawn_chance']),
        avgSpawns = asDouble(json['avg_spawns']),
        spawnTime = json['spawn_time'] as String? ?? '',
        multipliers =
            (json['multipliers'] as List<dynamic>?)?.map(asDouble).toList() ??
                [],
        weaknesses = (json['weaknesses'] as List?)?.cast() ?? [],
        nextEvolution = [
          if (json['next_evolution'] case final List<dynamic> elements)
            for (final (json as Map) in elements)
              Evolution.fromJson(json.cast()),
        ],
        prevEvolution = [
          if (json['prev_evolution'] case final List<dynamic> elements)
            for (final (json as Map) in elements)
              Evolution.fromJson(json.cast()),
        ];

  final int id;
  final String num;
  final String name;
  final String img;
  final List<String> type;
  final String height;
  final String weight;
  final String candy;
  final int candyCount;
  final String egg;
  final double spawnChance;
  final double avgSpawns;
  final String spawnTime;
  final List<double> multipliers;
  final List<String> weaknesses;
  final List<Evolution> nextEvolution;
  final List<Evolution> prevEvolution;

  static double asDouble(dynamic v) {
    if (v == null) {
      return 0;
    } else if (v is int) {
      return v.toDouble();
    } else {
      return v as double;
    }
  }
}

class Evolution {
  Evolution({required this.num, required this.name});

  Evolution.fromJson(Map<String, dynamic> json)
      : num = json['num'] as String? ?? '',
        name = json['name'] as String? ?? '';

  final String num;
  final String name;
}
