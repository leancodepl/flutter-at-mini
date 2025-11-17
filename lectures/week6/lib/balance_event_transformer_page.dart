import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6/bloc/balance_bloc.dart';
import 'package:week6/bloc/balance_event.dart';
import 'package:week6/bloc/balance_state.dart';

class BalanceEventTransformerPage extends StatelessWidget {
  const BalanceEventTransformerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: _ConcurrentColumn()),
                SizedBox(width: 16),
                Expanded(child: _SequentialColumn()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ConcurrentColumn extends StatelessWidget {
  const _ConcurrentColumn();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ConcurrentBalanceBloc(),
      child: Builder(
        builder: (context) => Card(
          color: Colors.red.shade50,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Concurrent (default)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Center(
                    child: BlocBuilder<ConcurrentBalanceBloc, BalanceState>(
                      builder: (context, state) => Text(
                        'Balance: ${state.balance}',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(color: Colors.red),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final bloc = context.read<ConcurrentBalanceBloc>();
                    for (var i = 0; i < 5; i++) {
                      bloc.add(const IncrementPressed());
                    }
                  },
                  child: const Text('Add 5 events'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SequentialColumn extends StatelessWidget {
  const _SequentialColumn();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SequentialBalanceBloc(),
      child: Builder(
        builder: (context) => Card(
          color: Colors.green.shade50,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Sequential',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Center(
                    child: BlocBuilder<SequentialBalanceBloc, BalanceState>(
                      builder: (context, state) => Text(
                        'Balance: ${state.balance}',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(color: Colors.green),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final bloc = context.read<SequentialBalanceBloc>();
                    for (var i = 0; i < 5; i++) {
                      bloc.add(const IncrementPressed());
                    }
                  },
                  child: const Text('Add 5 events'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
