import 'package:flutter/material.dart';

class TextInputActionsRoute extends MaterialPageRoute<void> {
  TextInputActionsRoute()
      : super(
          builder: (context) => const _TextInputActions(),
        );
}

class _TextInputActions extends StatelessWidget {
  const _TextInputActions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic form'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
          bottom: 40,
        ),
        children: const [
          TextField(
            decoration: InputDecoration(
              label: Text('Next'),
            ),
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              label: Text('Multiline'),
            ),
            maxLines: 4,
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              label: Text('Search'),
            ),
            textInputAction: TextInputAction.search,
          ),
          TextField(
            decoration: InputDecoration(
              label: Text('Done'),
            ),
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
