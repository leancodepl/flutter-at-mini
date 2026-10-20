import 'package:flutter/material.dart';

import 'package:lecture_week3/demo_info.dart';

/// Demo: keys – hiding a form field (slides 56, 60).
///
/// Run: `fvm flutter run -d macos -t lib/demo_07_keys.dart`
///
/// 1. Fill in all three fields, then uncheck "Newsletter" → the email field
///    disappears, "hasło" now shows the email, "telefon" shows the password
///    and the phone number is gone (elements matched by position and type).
/// 2. Uncomment the three keys, hot restart and repeat → only the email
///    field goes away; the other fields keep their text.
void main() {
  runApp(const MaterialApp(home: FormExample()));
}

class const FormExample({super.key}) extends StatefulWidget {
  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState() extends State<FormExample> {
  var _newsletter = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keys: hiding a form field'),
        actions: const [
          DemoInfo(
            title: 'Keys: hiding a form field',
            steps: [
              'Fill in all three fields, then uncheck "Newsletter" → the email field disappears, "hasło" shows the email, "telefon" shows the password and the phone number is gone.',
              'Elements are matched by position and type only – the State (the text) stays in place while the widgets shift.',
              'Uncomment the three keys in FormExample, hot restart and repeat → only the email field goes away.',
            ],
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CheckboxListTile(
                title: const Text('Newsletter'),
                value: _newsletter,
                onChanged: (v) => setState(() => _newsletter = v!),
              ),
              if (_newsletter)
                const TextField(
                  // key: Key('email'),
                  decoration: InputDecoration(labelText: 'email'),
                ),
              const TextField(
                // key: Key('password'),
                decoration: InputDecoration(labelText: 'hasło'),
              ),
              const TextField(
                // key: Key('phone'),
                decoration: InputDecoration(labelText: 'telefon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
