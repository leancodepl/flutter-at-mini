// {
//     "price": "$16.99",
//     "name": "Founders All Day IPA",
//     "rating": {
//       "average": 4.411243509154233,
//       "reviews": 453
//     },
//     "image": "https://www.totalwine.com/media/sys_master/twmmedia/h00/h94/11891416367134.png",
//     "id": 1
//  }

class Beer {
  Beer({
    required this.name,
    required this.price,
    required this.avgRating,
    required this.imageUrl,
    required this.id,
  });

  final String name;
  final String price;
  final double avgRating;
  final String imageUrl;
  final int id;

  factory Beer.fromJson(Map<String, dynamic> json) => Beer(
        name: json['name'],
        price: json['price'],
        avgRating: json['rating']['average'].toDouble(),
        id: json['id'],
        imageUrl: json['image'],
      );
}
