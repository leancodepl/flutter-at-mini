import 'package:flutter/material.dart';

class WaterLogApp0 extends StatelessWidget {
  const WaterLogApp0({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WaterLog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WaterLog'),
        ),
        body: const SizedBox(),
      ),
    );
  }
}
