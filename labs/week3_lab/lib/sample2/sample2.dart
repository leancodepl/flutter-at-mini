// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:week3_lab/sample2/1/home_screen.dart';
import 'package:week3_lab/sample2/4/message_list_screen.dart';

import '1/list_screen.dart';
import '2/data.dart';
import '4/list_screen_4.dart';
import 'exercise/message_list_screen_2.dart';

class Sample2 extends StatefulWidget {
  const Sample2({super.key});

  @override
  State<Sample2> createState() => _Sample2State();
}

class _Sample2State extends State<Sample2> {
  bool isList = false;

  // 4 step
  Channel? selectedChannel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 3',
      home: Navigator(
        pages: [
          MaterialPage(
            key: const ValueKey('HomeScreen'),
            child: HomeScreen(
              onPressed: () {
                setState(() {
                  isList = true;
                });
              },
            ),
          ),
          if (isList)
            const MaterialPage(
              key: ValueKey('ListScreen'),
              child: ListScreen(),
            ),
          // 4 Step
          if (selectedChannel != null)
            MaterialPage(
              key: ValueKey(selectedChannel!.name),
              child: MessageListScreen(channel: selectedChannel!),
            ),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          setState(() {
            // 4 step
            if (selectedChannel != null) {
              selectedChannel = null;
            } else {
              isList = false;
            }
          });

          return true;
        },
      ),
    );
  }
}
