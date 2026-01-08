import 'package:flutter/material.dart';

class Task2Page extends StatefulWidget {
  const Task2Page({super.key});

  @override
  State<Task2Page> createState() => _Task2PageState();
}

class _Task2PageState extends State<Task2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 2: Pulsing Indicator')),
    );
  }
}
