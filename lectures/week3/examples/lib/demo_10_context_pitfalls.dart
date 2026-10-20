import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lecture_week3/demo_info.dart';
import 'package:provider/provider.dart';

/// Demo: BuildContext pitfalls (slides 76–77).
///
/// Run: `fvm flutter run -d macos -t lib/demo_10_context_pitfalls.dart`
///
/// Pitfall #1 – context "above" the Provider:
///   open "Broken" → red error body with ProviderNotFoundException (back still works),
///   then open "Fixed" → Builder gives us a context below the Provider.
///
/// Pitfall #2 – context after await:
///   open "Unsafe", tap Save and go back before 3 seconds pass →
///   "Looking up a deactivated widget's ancestor is unsafe" in the console.
///   Do the same with "Safe" → the mounted check quietly skips the UI work.
///   Show the use_build_context_synchronously lint in _saveUnsafe.
void main() {
  runApp(const MaterialApp(home: PitfallsMenu()));
}

class User({required final String name});

class const PitfallsMenu({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void open(Widget page) {
      Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => page));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('BuildContext pitfalls'),
        actions: const [
          DemoInfo(
            title: 'BuildContext pitfalls',
            steps: [
              '#1 "Broken" → red screen with ProviderNotFoundException: context.watch uses the context of the widget that builds the Provider – above it. "Fixed" → Builder gives a context below it.',
              '#2 "Unsafe": tap Save and go back within 3 seconds → "Looking up a deactivated widget\'s ancestor is unsafe" in the console.',
              'Same with "Safe": the context.mounted check quietly skips the UI work. Show the use_build_context_synchronously lint in _saveUnsafe.',
            ],
            watch: 'the console',
          ),
        ],
      ),
      body: ListView(
        children: [
          const ListTile(title: Text('#1 context above the Provider')),
          ListTile(
            leading: const Text('❌'),
            title: const Text('Broken'),
            onTap: () => open(const ProviderPage(fixed: false)),
          ),
          ListTile(
            leading: const Text('✅'),
            title: const Text('Fixed with Builder'),
            onTap: () => open(const ProviderPage(fixed: true)),
          ),
          const Divider(),
          const ListTile(title: Text('#2 context after await')),
          ListTile(
            leading: const Text('❌'),
            title: const Text('Unsafe'),
            onTap: () => open(const SavePage(safe: false)),
          ),
          ListTile(
            leading: const Text('✅'),
            title: const Text('Safe (context.mounted)'),
            onTap: () => open(const SavePage(safe: true)),
          ),
        ],
      ),
    );
  }
}

class const ProviderPage({super.key, required final bool fixed})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The Scaffold lives outside the broken part, so the error screen only
    // replaces the body and the back button keeps working.
    return Scaffold(
      appBar: AppBar(title: Text(fixed ? 'Fixed' : 'Broken')),
      body: Center(child: fixed ? const _FixedBody() : const _BrokenBody()),
    );
  }
}

class const _BrokenBody() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<User>(
      create: (_) => User(name: 'Ala'),
      // ❌ this context belongs to _BrokenBody – *above* the Provider
      child: Text('Hello, ${context.watch<User>().name}!'),
    );
  }
}

class const _FixedBody() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<User>(
      create: (_) => User(name: 'Ala'),
      // ✅ Builder's context is an Element *below* the Provider
      child: Builder(
        builder: (context) => Text('Hello, ${context.watch<User>().name}!'),
      ),
    );
  }
}

class const SavePage({super.key, required final bool safe})
    extends StatelessWidget {
  Future<void> _fakeApiCall() =>
      Future<void>.delayed(const Duration(seconds: 3));

  Future<void> _saveUnsafe(BuildContext context) async {
    await _fakeApiCall();
    // ❌ the page might be gone by now – this context is no longer valid
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Saved!')));
    Navigator.of(context).pop();
  }

  Future<void> _saveSafe(BuildContext context) async {
    await _fakeApiCall();
    if (!context.mounted) {
      debugPrint('Page is gone – skipping UI updates');
      return;
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Saved!')));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(safe ? 'Safe save' : 'Unsafe save')),
      body: Center(
        child: ElevatedButton(
          onPressed: () =>
              unawaited(safe ? _saveSafe(context) : _saveUnsafe(context)),
          child: const Text('Save (takes 3 s)'),
        ),
      ),
    );
  }
}
