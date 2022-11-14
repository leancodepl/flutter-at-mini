import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6_lab/data/message.dart';
import 'package:week6_lab/data/shoutbox_data_source.dart';

class ShoutboxCubit extends Cubit<ShoutboxState> {
  ShoutboxCubit({required ShoutboxDataSource shoutboxDataSource})
      : _shoutboxDataSource = shoutboxDataSource,
        super(const ShoutboxInitialState());

  final ShoutboxDataSource _shoutboxDataSource;

  Future<void> refresh() async {
    final messages = await _shoutboxDataSource.getMessages();
    emit(ShoutboxLoadedState(messages: messages));
  }

  Future<void> sendMessage(String text) async {
    _shoutboxDataSource.sendMessage(Message(
      content: text,
      timestamp: DateTime.now(),
    ));

    return refresh();
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
