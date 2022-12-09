import 'package:flutter/material.dart';

class TextInputTypesRoute extends MaterialPageRoute {
  TextInputTypesRoute()
      : super(
          builder: (context) => const _TextInputTypes(),
        );
}

class _TextInputTypes extends StatelessWidget {
  const _TextInputTypes({Key? key}) : super(key: key);

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
              label: Text('Default'),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              label: Text('Email'),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              label: Text('Number'),
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
