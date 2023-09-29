import 'package:flutter/material.dart';
import 'package:week3_lab/sample2/2/data.dart';

class ListScreen3 extends StatefulWidget {
  const ListScreen3({super.key});

  @override
  State<ListScreen3> createState() => _ListScreen3State();
}

class _ListScreen3State extends State<ListScreen3> {
  List<Channel> channels = [];
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          channels = Generator.generateRandomChannels(10);
          isLoading = false;
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample 2')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
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
