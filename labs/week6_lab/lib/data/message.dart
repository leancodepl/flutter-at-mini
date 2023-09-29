import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  Message({
    required this.content,
    required this.timestamp,
  });

  factory Message.fromSnapshot(
          QueryDocumentSnapshot<Map<String, dynamic>> snapshot) =>
      Message(
        content: snapshot.data()['content'] as String,
        timestamp: (snapshot.data()['timestamp'] as Timestamp).toDate(),
      );

  final String content;
  final DateTime timestamp;

  Map<String, dynamic> toMap() => {
        'content': content,
        'timestamp': Timestamp.fromDate(timestamp),
      };
}
