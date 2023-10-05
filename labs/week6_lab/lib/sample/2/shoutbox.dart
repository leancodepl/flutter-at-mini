import 'dart:async';

import 'package:flutter/material.dart';
import 'package:week6_lab/data/message.dart';
import 'package:week6_lab/data/shoutbox_data_source.dart';

class Shoutbox with ChangeNotifier {
  Shoutbox({required ShoutboxDataSource shoutboxDataSource})
      : _shoutboxDataSource = shoutboxDataSource;

  final ShoutboxDataSource _shoutboxDataSource;
  List<Message> messages = [];

  Future<void> refresh() async {
    messages = await _shoutboxDataSource.getMessages();
    notifyListeners();
  }

  Future<void> sendMessage(String text) async {
    unawaited(
      _shoutboxDataSource.sendMessage(
        Message(
          content: text,
          timestamp: DateTime.now(),
        ),
      ),
    );

    return refresh();
  }
}
