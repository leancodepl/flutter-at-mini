import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week6_lab/data/message.dart';

class ShoutboxDataSource {
  const ShoutboxDataSource({required FirebaseFirestore firestore})
      : _firestore = firestore;

  final FirebaseFirestore _firestore;

  Future<List<Message>> getMessages() async {
    final messages = await _firestore
        .collection('messages')
        .orderBy(
          'timestamp',
        )
        .get();
    return messages.docs.map(Message.fromSnapshot).toList();
  }

  Future<void> sendMessage(Message message) =>
      _firestore.collection('messages').add(message.toMap());
}
