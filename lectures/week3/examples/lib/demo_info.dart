import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// AppBar action (ⓘ) that explains how to use a demo.
class const DemoInfo({
  super.key,
  required final String title,
  required final List<String> steps,
  final String? watch,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // in debug mode, keep clear of the DEBUG banner in the top-right corner
    return Padding(
      padding: const EdgeInsets.only(right: kDebugMode ? 40 : 0),
      child: IconButton(
        tooltip: 'How to use this demo',
        icon: const Icon(Icons.info_outline),
        onPressed: () => unawaited(
          showDialog<void>(
            context: context,
            builder: (context) =>
                _DemoInfoDialog(title: title, steps: steps, watch: watch),
          ),
        ),
      ),
    );
  }
}

class const _DemoInfoDialog({
  required final String title,
  required final List<String> steps,
  final String? watch,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: 520,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 14,
            children: [
              for (final (index, step) in steps.indexed)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    Expanded(child: Text(step)),
                  ],
                ),
              if (watch case final watch?)
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.visibility_outlined, color: theme.hintColor),
                    Expanded(
                      child: Text(
                        'Watch: $watch',
                        style: TextStyle(color: theme.hintColor),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Got it'),
        ),
      ],
    );
  }
}
