import 'package:flutter/material.dart';
import 'package:week4_lab/data/job.dart';
import 'package:week4_lab/sample/4/job_tile.dart';
import 'package:week4_lab/sample/4/jobs_provider.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({
    super.key,
    required this.job,
  });

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
