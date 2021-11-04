import 'package:flutter/material.dart';
import 'package:week5_lab/data/job.dart';
import 'package:week5_lab/sample/3/sample.dart';
import 'package:week5_lab/sample/4/jobs_provider.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({
    Key? key,
    required this.job,
  }) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    final jobs = JobsProvider.of(context);
    final jobIndex = jobs.indexOf(job);
    return Scaffold(
      appBar: AppBar(
        title: Text(job.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          JobTile(item: job),
          const SizedBox(height: 16),
          Center(child: Text('Number ${jobIndex + 1} on your job list')),
        ],
      ),
    );
  }
}
