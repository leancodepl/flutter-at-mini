import 'package:flutter/material.dart';
import 'package:week4_lab/data/job.dart';
import 'package:week4_lab/sample/4/job_details.dart';

class JobTile extends StatefulWidget {
  const JobTile({
    super.key,
    required this.item,
    this.showButton = false,
  });

  final Job item;
  final bool showButton;

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
                if (widget.showButton) ...[
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      child: const Text('Go to details'),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => JobDetails(job: widget.item),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
