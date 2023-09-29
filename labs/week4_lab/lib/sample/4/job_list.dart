import 'package:flutter/material.dart';
import 'package:week4_lab/sample/4/job_tile.dart';
import 'package:week4_lab/sample/4/jobs_provider.dart';

class JobList extends StatelessWidget {
  const JobList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final jobs = JobsProvider.of(context);

    return ListView(
      children: [
        for (final job in jobs)
          JobTile(
            // key: ValueKey(job.id),
            item: job,
            showButton: true,
          ),
      ],
    );
  }
}
