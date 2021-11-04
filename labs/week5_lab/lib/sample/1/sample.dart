import 'package:flutter/material.dart';
import 'package:week5_lab/data/job.dart';
import 'package:week5_lab/data/jobs_data_source.dart';

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  static const _jobsDataSource = JobsDataSource();
  List<Job> _jobs = [];

  @override
  void initState() {
    super.initState();
    _fetchJobs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Jobs')),
        body: ListView.builder(
          itemCount: _jobs.length,
          itemBuilder: (context, i) {
            final item = _jobs[i];
            return ListTile(
              title: Text(item.name),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }

  Future<void> _fetchJobs() async {
    final jobs = await _jobsDataSource.getJobs();
    setState(() => _jobs = jobs);
  }
}
