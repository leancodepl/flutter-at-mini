import 'package:flutter/material.dart';
import 'package:week3_lab/sample2/2/data.dart';

class MessageListScreen extends StatelessWidget {
  final Channel channel;

  const MessageListScreen({Key? key, required this.channel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(channel.name)),
      body: ListView.builder(
        reverse: true,
        itemCount: channel.messages.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              channel.messages[index].text,
              style: const TextStyle(fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}
