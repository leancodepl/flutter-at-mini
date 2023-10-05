import 'package:flutter/material.dart';
import 'package:week4_lab/data/job.dart';

class JobsDataSource {
  const JobsDataSource();

  Future<List<Job>> getJobs() async => _jobs;
  Future<List<Job>> getLatestJobs() async => _jobs.toList()..shuffle();
}

final _jobs = [
  Job(
    id: 'faucet',
    name: 'Broken faucet',
    description:
        "I got a broken faucet at my place. I don't have any necessary tools.",
    address: '4 Maple Street',
    color: Colors.blue.shade100,
  ),
  Job(
    id: 'rust',
    name: 'Getting rust off my fence',
    description: 'Please help me get rid of rust, I can buy any equipment',
    address: '10 Flower Blvd',
    color: Colors.green.shade100,
  ),
  Job(
    id: 'dogs',
    name: 'Please look after my dogs',
    description:
        'I need to leave my place for a couple of hours and my dogs need to be taken care of.',
    address: '90210 Beverly Hills',
    color: Colors.red.shade100,
  ),
];
