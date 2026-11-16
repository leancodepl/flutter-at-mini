class UserItemsService(
  /* TODO: depend on FirebaseFirestore and FirebaseAuth */
) {
  Stream<Iterable<UserItem>> get itemsStream => const .empty();

  Future<void> addItem(String itemName) {
    // TODO: implement
    throw UnimplementedError();
  }
}

class const UserItem({
  required final String name,
  required final DateTime date,
}) {
  new fromJson(Map<String, dynamic> json)
    : this(
        name: json['name'] as String,
        date: .fromMicrosecondsSinceEpoch(json['date'] as int),
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'date': date.microsecondsSinceEpoch,
  };
}
