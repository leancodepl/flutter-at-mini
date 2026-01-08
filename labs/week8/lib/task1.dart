import 'package:flutter/material.dart';

class Task1Page extends StatefulWidget {
  const Task1Page({super.key});

  @override
  State<Task1Page> createState() => _Task1PageState();
}

class _Task1PageState extends State<Task1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 1: Animated Profile Card')),
    );
  }
}
