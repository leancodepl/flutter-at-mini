import 'dart:convert';

class Pokemons {
  Pokemons({required this.pokemons});

  factory Pokemons.fromResponse(String response) {
    return Pokemons.fromJson(jsonDecode(response) as Map<String, dynamic>);
  }

  Pokemons.fromJson(Map<String, dynamic> json) : pokemons = [] {
    if (json['pokemon'] != null) {
      final elements = json['pokemon'] as List<dynamic>;
      for (var i = 0; i < elements.length; i++) {
        pokemons.add(Pokemon.fromJson(elements[i] as Map<String, dynamic>));

        if (i % 50 == 0) {
          // we're doing _a lot_ of work here :)
          final sw = Stopwatch()..start();
          while (sw.elapsedMilliseconds < 10) {}
        }
      }
    }
  }
  final List<Pokemon> pokemons;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['pokemon'] = pokemons.map((v) => v.toJson()).toList();
    return data;
  }
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

  Pokemon.empty()
      : id = 0,
        num = '',
        name = '',
        img = '',
        type = [],
        height = '',
        weight = '',
        candy = '',
        candyCount = 0,
        egg = '',
        spawnChance = 0.0,
        avgSpawns = 0.0,
        spawnTime = '',
        multipliers = [],
        weaknesses = [],
        nextEvolution = [],
        prevEvolution = [];

  Pokemon.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int? ?? 0,
        num = json['num'] as String? ?? '',
        name = json['name'] as String? ?? '',
        img = json['img'] as String? ?? '',
        type = (json['type'] as List?)?.cast<String>() ?? [],
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
        weaknesses = (json['weaknesses'] as List?)?.cast<String>() ?? [],
        nextEvolution = <Evolution>[],
        prevEvolution = <Evolution>[] {
    (json['next_evolution'] as List?)?.forEach((v) {
      nextEvolution.add(Evolution.fromJson(v as Map<String, dynamic>));
    });
    (json['prev_evolution'] as List?)?.forEach((v) {
      prevEvolution.add(Evolution.fromJson(v as Map<String, dynamic>));
    });
  }
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

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['num'] = num;
    data['name'] = name;
    data['img'] = img;
    data['type'] = type;
    data['height'] = height;
    data['weight'] = weight;
    data['candy'] = candy;
    data['candy_count'] = candyCount;
    data['egg'] = egg;
    data['spawn_chance'] = spawnChance;
    data['avg_spawns'] = avgSpawns;
    data['spawn_time'] = spawnTime;
    data['multipliers'] = multipliers;
    data['weaknesses'] = weaknesses;
    data['next_evolution'] = nextEvolution.map((v) => v.toJson()).toList();
    data['prev_evolution'] = prevEvolution.map((v) => v.toJson()).toList();
    return data;
  }

  static double asDouble(dynamic v) {
    if (v == null) {
      return 0;
    } else if (v is int) {
      // ignore: unnecessary_cast
      return (v as int).toDouble();
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

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['num'] = num;
    data['name'] = name;
    return data;
  }
}
