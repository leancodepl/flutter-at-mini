import 'package:flutter/material.dart';
import 'package:week3_lab/sample2/2/data.dart';

class MessageListScreen2 extends StatelessWidget {
  final Channel channel;

  const MessageListScreen2({Key? key, required this.channel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messages = channel.messages;
    return Scaffold(
      appBar: AppBar(title: Text(channel.name)),
      body: ListView.separated(
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = channel.messages[index];
          if (message.isMine) {
            return MyMessage(message: message);
          } else {
            return TheirMessage(message: message);
          }
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 4);
        },
      ),
    );
  }
}

class MyMessage extends StatelessWidget {
  final Message message;

  const MyMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Spacer(),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                color: Colors.black38,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              message.text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}

class TheirMessage extends StatelessWidget {
  final Message message;

  const TheirMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              border: Border.all(
                color: Colors.blue,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              message.text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
