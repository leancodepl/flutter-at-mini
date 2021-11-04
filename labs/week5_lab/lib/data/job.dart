import 'dart:ui';

class Job {
  const Job({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.color,
  });

  final String id;
  final String name;
  final String description;
  final String address;
  final Color color;
}
