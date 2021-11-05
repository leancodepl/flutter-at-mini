import 'package:flutter/material.dart';
import 'package:week5_lab/data/job.dart';
import 'package:week5_lab/data/jobs_data_source.dart';

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
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
