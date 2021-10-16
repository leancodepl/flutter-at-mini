class Pokemon {
  final String name;
  final String url;
  final String photo;

  Pokemon._({
    required this.name,
    required this.url,
    required this.photo,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final String url = json['url'];
    final parts = url.split('/')..removeLast();
    final index = parts.last;

    return Pokemon._(
      name: json['name'],
      url: url,
      photo:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$index.png",
    );
  }
}
