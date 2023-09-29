import 'dart:math';

class Channel {
  Channel({
    required this.name,
    required this.avatar,
    required this.messages,
  });

  final String name;
  final String avatar;
  final List<Message> messages;
}

class Message {
  Message({required this.text, required this.isMine});
  final String text;

  //Exercise
  final bool isMine;
}

class Generator {
  static List<Channel> generateRandomChannels(int size) {
    final channels = <Channel>[];

    // FIXME: collection-for
    for (var i = 0; i < size; i++) {
      channels.add(
        Channel(
          avatar: 'https://picsum.photos/64',
          name: 'Channel${i + 1}',
          messages: _generateRandomMessages(i + 1),
        ),
      );
    }
    return channels;
  }

  static List<Message> _generateRandomMessages(int size) {
    final r = Random();
    final messages = <Message>[];
    for (var i = 0; i < size; i++) {
      messages.add(
        Message(
          text: _generateRandomString((i + 1) * 3, r),
          // Exercise
          isMine: r.nextBool(),
        ),
      );
    }
    return messages;
  }

  static String _generateRandomString(int len, Random r) {
    return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89),
    );
  }
}
