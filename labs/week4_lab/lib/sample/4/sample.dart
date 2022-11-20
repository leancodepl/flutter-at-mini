import 'package:flutter/material.dart';
import 'package:week4_lab/data/job.dart';
import 'package:week4_lab/data/jobs_data_source.dart';
import 'package:week4_lab/sample/4/job_list.dart';
import 'package:week4_lab/sample/4/jobs_provider.dart';

class Sample4 extends StatefulWidget {
  const Sample4({Key? key}) : super(key: key);

  @override
  State<Sample4> createState() => _Sample4State();
}

class _Sample4State extends State<Sample4> {
  static const _jobsDataSource = JobsDataSource();
  List<Job> _jobs = [];

  @override
  void initState() {
    super.initState();
    _fetchJobs();
  }

  @override
  Widget build(BuildContext context) {
    return JobsProvider(
      jobs: _jobs,
      child: MaterialApp(
        title: 'Jobs',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: const Text('Jobs')),
          body: RefreshIndicator(
            onRefresh: _fetchJobs,
            child: const JobList(),
          ),
        ),
      ),
    );
  }

  Future<void> _fetchJobs() async {
    final jobs = await _jobsDataSource.getLatestJobs();
    setState(() => _jobs = jobs);
  }
}
