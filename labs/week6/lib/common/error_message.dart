import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 128,
            color: theme.colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Oopsie!',
            style: theme.textTheme.displayLarge?.apply(
              color: theme.colorScheme.error,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            style: theme.textTheme.bodyLarge?.apply(
              color: theme.colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}
