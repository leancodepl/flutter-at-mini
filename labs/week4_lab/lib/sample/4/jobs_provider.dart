import 'package:flutter/material.dart';
import 'package:week4_lab/data/job.dart';

class JobsProvider extends InheritedWidget {
  const JobsProvider({
    Key? key,
    required Widget child,
    required this.jobs,
  }) : super(
          key: key,
          child: child,
        );

  final List<Job> jobs;

  @override
  bool updateShouldNotify(JobsProvider oldWidget) {
    return oldWidget.jobs != jobs;
  }

  static List<Job> of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<JobsProvider>()!.jobs;
}
