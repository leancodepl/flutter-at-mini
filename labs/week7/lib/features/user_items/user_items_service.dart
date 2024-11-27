import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week7/features/auth/auth_service.dart';

class UserItem {
  const UserItem({required this.name, required this.date});

  UserItem.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        date = DateTime.fromMicrosecondsSinceEpoch(json['date'] as int);

  final String name;
  final DateTime date;

  Map<String, dynamic> toJson() =>
      {'name': name, 'date': date.microsecondsSinceEpoch};
}

class UserItemsService {
  UserItemsService({required this.db, required this.auth});

  final FirebaseFirestore db;
  final AuthService auth;

  DocumentReference<Map<String, dynamic>> get _doc =>
      db.collection('items').doc(auth.currentUser!.uid);

  Stream<List<UserItem>> get itemsStream => _doc.snapshots().map(
        (snapshot) =>
            snapshot
                .data()
                ?.values
                .cast<Map<String, dynamic>>()
                .map(UserItem.fromJson)
                .toList() ??
            [],
      );

  Future<void> addItem(String itemName) {
    return _doc.set(
      {itemName: UserItem(name: itemName, date: DateTime.now()).toJson()},
      SetOptions(merge: true),
    );
  }
}
