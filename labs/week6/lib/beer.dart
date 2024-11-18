class Beer {
  const Beer({
    required this.name,
    required this.price,
    required this.avgRating,
    required this.imageUrl,
    required this.id,
  });

  Beer.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'] as String,
          price: json['price'] as String,
          avgRating:
              ((json['rating'] as Map<String, dynamic>)['average'] as num)
                  .toDouble(),
          id: json['id'] as int,
          imageUrl: json['image'] as String,
        );

  final String name;
  final String price;
  final double avgRating;
  final String imageUrl;
  final int id;
}
