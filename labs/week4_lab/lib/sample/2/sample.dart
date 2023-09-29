import 'package:flutter/material.dart';
import 'package:week4_lab/data/job.dart';
import 'package:week4_lab/data/jobs_data_source.dart';

class Sample2 extends StatefulWidget {
  const Sample2({super.key});

  @override
  State<Sample2> createState() => _Sample2State();
}

class _Sample2State extends State<Sample2> {
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
        body: ListView.separated(
          itemCount: _jobs.length,
          itemBuilder: (context, i) => JobTile(
            item: _jobs[i],
          ),
          separatorBuilder: (_, __) => const Divider(),
        ),
      ),
    );
  }

  Future<void> _fetchJobs() async {
    final jobs = await _jobsDataSource.getJobs();
    setState(() => _jobs = jobs);
  }
}

class JobTile extends StatefulWidget {
  const JobTile({
    super.key,
    required this.item,
  });

  final Job item;

  @override
  State<JobTile> createState() => _JobTileState();
}

class _JobTileState extends State<JobTile> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() => expanded = !expanded),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.item.color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState:
                expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            firstChild: Text(widget.item.name),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.item.name),
                Text(widget.item.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
