import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:week6_lab/data/message.dart';
import 'package:week6_lab/data/shoutbox_data_source.dart';
import 'package:week6_lab/sample/1/shoutbox.dart';

class ShoutboxPage1 extends StatelessWidget {
  const ShoutboxPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => ShoutboxDataSource(
        firestore: FirebaseFirestore.instance,
      ),
      child: ChangeNotifierProvider(
        create: (context) => Shoutbox(
          shoutboxDataSource: context.read(),
        ),
        child: MaterialApp(
          title: 'Shoutbox',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Shoutbox'),
            ),
            body: _List(),
          ),
        ),
      ),
    );
  }
}

class _List extends StatelessWidget {
  const _List({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messages = context.watch<Shoutbox>().messages;

    return RefreshIndicator(
      onRefresh: context.watch<Shoutbox>().refresh,
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (_, i) => _Message(
          message: messages[i],
        ),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  _Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final df = DateFormat.Hm();
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Text('[${df.format(message.timestamp)}]: ${message.content}'),
    );
  }
}
