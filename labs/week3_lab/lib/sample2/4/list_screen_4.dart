import 'package:flutter/material.dart';
import 'package:week3_lab/sample2/2/data.dart';

class ListScreen4 extends StatefulWidget {
  final ValueChanged<Channel> onPressed;

  const ListScreen4({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<ListScreen4> createState() => _ListScreen4State();
}

class _ListScreen4State extends State<ListScreen4> {
  List<Channel> channels = [];
  var isLoading = true;

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
      appBar: AppBar(title: const Text("Sample 2")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: channels.length,
              itemBuilder: (context, index) {
                return ListItem(
                  channel: channels[index],
                  onPressed: widget.onPressed,
                );
              },
              separatorBuilder: (context, _) {
                return const Divider(thickness: 1, color: Colors.grey);
              },
            ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Channel channel;
  final ValueChanged<Channel> onPressed;

  const ListItem({Key? key, required this.channel, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed(channel);
      },
      child: Container(
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
      ),
    );
  }
}
