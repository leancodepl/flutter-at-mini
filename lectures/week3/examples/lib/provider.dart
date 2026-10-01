import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // Provider.debugCheckInvalidValueType = null;
  runApp(const ProviderExample());
}

class const ProviderExample({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => NameManager(),
      child: const MaterialApp(home: HomePage()),
    );
  }
}

class const HomePage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nameManager = context.watch<NameManager>();
    return Scaffold(
      body: Center(child: Text('Hello ${nameManager.name}')),
      floatingActionButton: FloatingActionButton(
        onPressed: nameManager.nextName,
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
