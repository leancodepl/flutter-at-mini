import 'package:flutter/material.dart';

class CommsPage extends StatelessWidget {
  const CommsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Beers: ?? selected'),
      ),
      body: const Placeholder(
        child: Center(child: Text('TODO')),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          throw UnimplementedError('TODO');
        },
      ),
    );
  }
}
