import 'package:flutter/material.dart';
import 'package:week5_lab/data/job.dart';
import 'package:week5_lab/data/jobs_data_source.dart';

class Sample0 extends StatefulWidget {
  const Sample0({Key? key}) : super(key: key);

  @override
  State<Sample0> createState() => _Sample0State();
}

class _Sample0State extends State<Sample0> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Jobs')),
        body: Container(),
      ),
    );
  }
}
