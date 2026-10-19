import 'package:flutter/material.dart';
import 'package:lecture_week3/demo_info.dart';
import 'package:provider/provider.dart';

/// Demo: ChangeNotifier + Provider (slides 70–72, 86).
///
/// Run: `fvm flutter run -d macos -t lib/demo_09_provider.dart`
///
/// 1. Tap "Next" → the name changes: notifyListeners() → ChangeNotifierProvider
///    marks dependents dirty → HomePage (which used watch) rebuilds.
/// 2. Bonus: swap ChangeNotifierProvider for a plain Provider – the name no
///    longer updates (and provider complains in debug mode), because a plain
///    Provider does not listen to the notifier.
void main() {
  runApp(const MaterialApp(home: ProviderExample()));
}

class const ProviderExample({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NameManager(),
      child: const HomePage(),
    );
  }
}

class const HomePage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final name = context.watch<NameManager>().name;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier + Provider'),
        actions: const [
          DemoInfo(
            title: 'ChangeNotifier + Provider',
            steps: [
              'Tap "Next" → notifyListeners() → ChangeNotifierProvider marks dependents dirty → HomePage (watch) rebuilds with the new name.',
              'The button uses context.read – callbacks should not subscribe.',
              'Bonus: swap ChangeNotifierProvider for a plain Provider → the name no longer updates.',
            ],
          ),
        ],
      ),
      body: Center(child: Text('Hello $name')),
      floatingActionButton: FloatingActionButton(
        // read, not watch: a callback should not subscribe
        onPressed: () => context.read<NameManager>().nextName(),
        child: const Text('Next'),
      ),
    );
  }
}

class NameManager() extends ChangeNotifier {
  var _nameIndex = 0;

  String get name => names[_nameIndex];

  final names = ['John', 'Jane', 'Jim', 'Jill'];

  void nextName() {
    _nameIndex++;
    if (_nameIndex >= names.length) {
      _nameIndex = 0;
    }
    notifyListeners();
  }
}
