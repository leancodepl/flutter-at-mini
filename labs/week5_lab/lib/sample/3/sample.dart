import 'package:flutter/material.dart';
import 'package:week5_lab/data/job.dart';
import 'package:week5_lab/data/jobs_data_source.dart';

class Sample3 extends StatefulWidget {
  const Sample3({Key? key}) : super(key: key);

  @override
  State<Sample3> createState() => _Sample3State();
}

class _Sample3State extends State<Sample3> {
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
        body: RefreshIndicator(
          onRefresh: _fetchJobs,
          child: ListView(
            children: [
              ..._jobs.map((j) => JobTile(
                    key: ValueKey(j.id),
                    item: j,
                  )),
            ],
            // child: ListView.builder(
            //   itemCount: _jobs.length,
            //   itemBuilder: (context, i) => JobTile(
            //     key: ValueKey(_jobs[i].id),
            //     item: _jobs[i],
            //   ),
            // ),
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

class JobTile extends StatefulWidget {
  const JobTile({
    Key? key,
    required this.item,
  }) : super(key: key);

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
