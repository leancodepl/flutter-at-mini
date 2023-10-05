import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:week6_lab/data/message.dart';
import 'package:week6_lab/data/shoutbox_data_source.dart';
import 'package:week6_lab/sample/4/shoutbox_cubit.dart';

class ShoutboxPage4 extends StatelessWidget {
  const ShoutboxPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => ShoutboxDataSource(
        firestore: FirebaseFirestore.instance,
      ),
      child: BlocProvider(
        create: (context) => ShoutboxCubit(
          shoutboxDataSource: context.read(),
        )..refresh(),
        child: MaterialApp(
          title: 'Shoutbox',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Shoutbox'),
            ),
            body: const Column(
              children: [
                Expanded(
                  child: _List(),
                ),
                Divider(
                  color: Colors.grey,
                ),
                _MessageBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageBox extends StatefulWidget {
  const _MessageBox();

  @override
  State<_MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<_MessageBox> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: _controller,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            context.read<ShoutboxCubit>().sendMessage(_controller.text);
            FocusScope.of(context).unfocus();
            _controller.text = '';
          },
        ),
      ],
    );
  }
}

class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: context.watch<ShoutboxCubit>().refresh,
      child: BlocBuilder<ShoutboxCubit, ShoutboxState>(
        builder: (context, state) {
          if (state is ShoutboxLoadedState) {
            return ListView.builder(
              itemCount: state.messages.length,
              itemBuilder: (_, i) => _Message(
                message: state.messages[i],
              ),
              reverse: true,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class _Message extends StatelessWidget {
  _Message({
    required this.message,
  });

  final df = DateFormat.Hm();
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
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
