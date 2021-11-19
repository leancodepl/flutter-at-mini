import 'package:flutter/material.dart';

class ShoutboxPage0 extends StatelessWidget {
  const ShoutboxPage0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoutbox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shoutbox'),
        ),
        body: const SizedBox(),
      ),
    );
  }
}
