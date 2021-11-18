import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  Message({
    required this.content,
    required this.timestamp,
  });

  final String content;
  final DateTime timestamp;

  static Message fromSnapshot(
          QueryDocumentSnapshot<Map<String, dynamic>> snapshot) =>
      Message(
        content: snapshot.data()['content'],
        timestamp: (snapshot.data()['timestamp'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toMap() => {'content': content};
}
