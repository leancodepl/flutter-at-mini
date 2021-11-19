import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6_lab/data/message.dart';
import 'package:week6_lab/data/shoutbox_data_source.dart';

class ShoutboxCubit extends Cubit<ShoutboxState> {
  ShoutboxCubit({required ShoutboxDataSource shoutboxDataSource})
      : _shoutboxDataSource = shoutboxDataSource,
        super(const ShoutboxInitialState()) {
    _sub = _shoutboxDataSource.messageStream
        .listen((messages) => emit(ShoutboxLoadedState(messages: messages)));
  }

  final ShoutboxDataSource _shoutboxDataSource;
  late final StreamSubscription _sub;

  Future<void> refresh() async {
    final messages = await _shoutboxDataSource.getMessages();
    emit(ShoutboxLoadedState(messages: messages));
  }

  Future<void> sendMessage(String text) =>
      _shoutboxDataSource.sendMessage(Message(
        content: text,
        timestamp: DateTime.now(),
      ));

  @override
  Future<void> close() async {
    await _sub.cancel();
    return super.close();
  }
}

abstract class ShoutboxState {
  const ShoutboxState();
}

class ShoutboxInitialState extends ShoutboxState {
  const ShoutboxInitialState();
}

class ShoutboxLoadedState extends ShoutboxState {
  const ShoutboxLoadedState({
    required this.messages,
  });

  final List<Message> messages;
}
