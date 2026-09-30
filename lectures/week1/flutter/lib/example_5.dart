import 'dart:isolate';

import 'package:flutter/material.dart';

int fibonacci(int n) {
  if (n == 0 || n == 1) {
    return n;
  }
  return fibonacci(n - 1) + fibonacci(n - 2);
}

Future<int> fibonacciInIsolate(int n) => Isolate.run(() => fibonacci(n));

class Example5 extends StatelessWidget {
  const Example5({super.key});

  static const n = 43;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox.square(
            dimension: 160,
            child: CircularProgressIndicator(strokeWidth: 12),
          ),
          const SizedBox(height: 48),
          FilledButton(
            onPressed: () => _show(context, fibonacci(n)),
            child: const Text('fibonacci($n) on the main isolate'),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () async {
              final result = await fibonacciInIsolate(n);
              if (context.mounted) {
                _show(context, result);
              }
            },
            child: const Text('fibonacci($n) with Isolate.run'),
          ),
        ],
      ),
    );
  }

  void _show(BuildContext context, int result) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('fibonacci($n) = $result')));
  }
}
