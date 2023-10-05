import 'package:flutter/material.dart';

import 'data.dart';

class ListScreen2 extends StatelessWidget {
  const ListScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final channels = Generator.generateRandomChannels(10);
    return Scaffold(
      appBar: AppBar(title: const Text('Sample 2')),
      body: ListView.separated(
        itemCount: channels.length,
        itemBuilder: (context, index) {
          return ListItem(channel: channels[index]);
        },
        separatorBuilder: (context, _) {
          return const Divider(thickness: 1, color: Colors.grey);
        },
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.channel});

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(channel.avatar),
          const SizedBox(width: 8),
          Text(
            channel.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
