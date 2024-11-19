import 'package:flutter/material.dart';

class BlocPage extends StatelessWidget {
  const BlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Beers'),
      ),
      body: const Placeholder(
        child: Center(child: Text('TODO')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.refresh),
        label: const Text('Load more'),
        onPressed: () {
          throw UnimplementedError('TODO');
        },
      ),
    );
  }
}
