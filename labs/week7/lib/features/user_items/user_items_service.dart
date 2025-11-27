class UserItemsService {
  UserItemsService(/* TODO: depend on FirebaseFirestore and FirebaseAuth */);

  // TODO: implement
  Stream<Iterable<UserItem>> get itemsStream => const Stream.empty();

  Future<void> addItem(String itemName) {
    // TODO: implement
    throw UnimplementedError();
  }
}

class UserItem {
  const UserItem({required this.name, required this.date});

  UserItem.fromJson(Map<String, dynamic> json)
    : name = json['name'] as String,
      date = DateTime.fromMicrosecondsSinceEpoch(json['date'] as int);

  final String name;
  final DateTime date;

  Map<String, dynamic> toJson() => {
    'name': name,
    'date': date.microsecondsSinceEpoch,
  };
}
