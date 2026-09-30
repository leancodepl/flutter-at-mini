import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // Provider.debugCheckInvalidValueType = null;
  runApp(const ProviderExample());
}

class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => NameManager(),
      child: MaterialApp(home: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameManager = context.watch<NameManager>();
    return Scaffold(
      body: Center(child: Text('Hello ${nameManager.name}')),
      floatingActionButton: FloatingActionButton(
        onPressed: nameManager.nextName,
        child: Text('Next'),
      ),
    );
  }
}

class NameManager extends ChangeNotifier {
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
