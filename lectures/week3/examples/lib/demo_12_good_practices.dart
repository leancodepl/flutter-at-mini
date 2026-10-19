import 'package:flutter/material.dart';
import 'package:lecture_week3/demo_info.dart';

/// Demo: good practices – what goes wrong without them (slides 90–93).
///
/// Run: `fvm flutter run -d macos -t lib/demo_12_good_practices.dart` and keep the console
/// visible.
///
/// Tab "method vs widget" (slide 90): tap "Toggle theme".
///   MethodPage reads Theme.of in a _buildHeader() method → the whole page
///   rebuilds. WidgetPage reads it in a separate _Header widget → only
///   _Header rebuilds.
/// Tab "FutureBuilder" (slide 91): tap "Rebuild parent".
///   The future created in build() fires a new request: connectionState goes
///   back to waiting (the previous data is kept meanwhile). The future created
///   once in State stays done.
/// Tab "controller" (slide 93): type into both fields, tap "Rebuild parent".
///   The StatelessWidget creates a new controller on every rebuild → text
///   gone. The controller kept in State survives.
void main() {
  runApp(const MaterialApp(home: GoodPracticesDemo()));
}

class const GoodPracticesDemo({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Good practices'),
          actions: const [
            DemoInfo(
              title: 'Good practices',
              steps: [
                '"method vs widget": tap "Toggle theme". The _buildHeader() method makes the whole MethodPage rebuild; the separate _Header widget rebuilds alone.',
                '"FutureBuilder": tap "Rebuild parent". The future created in build() fires a new request – its connectionState goes back to waiting (orange + progress bar), while data still shows the previous response. The one created once in State stays done.',
                '"controller": type into both fields, tap "Rebuild parent". The controller in a StatelessWidget is recreated → text gone; the one in State survives.',
              ],
              watch: 'the console',
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'method vs widget'),
              Tab(text: 'FutureBuilder'),
              Tab(text: 'controller'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ThemeToggler(
              child: Row(
                children: [
                  Expanded(child: MethodPage()),
                  VerticalDivider(),
                  Expanded(child: WidgetPage()),
                ],
              ),
            ),
            FutureBuilderExample(),
            ControllerExample(),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// 1. _buildX() method vs a separate widget

class const ThemeToggler({super.key, required final Widget child})
    extends StatefulWidget {
  @override
  State<ThemeToggler> createState() => _ThemeTogglerState();
}

class _ThemeTogglerState() extends State<ThemeToggler> {
  var _dark = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              debugPrint('\n---- toggle theme');
              setState(() => _dark = !_dark);
            },
            child: const Text('Toggle theme'),
          ),
        ),
        Expanded(
          child: Theme(
            data: _dark ? ThemeData.dark() : ThemeData.light(),
            // the same const child instance every time → not rebuilt by us
            child: widget.child,
          ),
        ),
      ],
    );
  }
}

class const MethodPage({super.key}) extends StatelessWidget {
  Widget _buildHeader(BuildContext context) {
    // this context belongs to MethodPage → the whole page depends on Theme
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.primaryContainer,
      padding: const EdgeInsets.all(16),
      child: Text('_buildHeader()', style: theme.textTheme.titleLarge),
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build: MethodPage (whole page!)');
    return Column(
      children: [
        _buildHeader(context),
        const Expanded(child: Center(child: Text('…rest of the page…'))),
      ],
    );
  }
}

class const WidgetPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('build: WidgetPage (whole page!)');
    return const Column(
      children: [
        _Header(),
        Expanded(child: Center(child: Text('…rest of the page…'))),
      ],
    );
  }
}

class const _Header() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('build: _Header (only this)');
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.primaryContainer,
      padding: const EdgeInsets.all(16),
      child: Text('_Header widget', style: theme.textTheme.titleLarge),
    );
  }
}

// ---------------------------------------------------------------------------
// 2. FutureBuilder: future created in build vs once in State

var _requestCount = 0;

Future<String> _fetch(String who) async {
  final id = ++_requestCount;
  debugPrint('request #$id ($who)');
  await Future<void>.delayed(const Duration(seconds: 2));
  return 'response #$id';
}

class const FutureBuilderExample({super.key}) extends StatefulWidget {
  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState() extends State<FutureBuilderExample> {
  late final _future = _fetch('created once in State');
  var _rebuilds = 0;

  Widget _result(AsyncSnapshot<String> snapshot) {
    // Note: with a new future FutureBuilder keeps the previous data while
    // waiting – so look at connectionState, not just hasData.
    final waiting = snapshot.connectionState == ConnectionState.waiting;
    return SizedBox(
      width: 320,
      child: Column(
        spacing: 8,
        children: [
          Text(
            'connectionState: ${snapshot.connectionState.name}',
            style: TextStyle(
              fontFamily: 'monospace',
              fontWeight: FontWeight.bold,
              color: waiting ? Colors.orange.shade800 : Colors.green.shade700,
            ),
          ),
          Text(
            'data: ${snapshot.data ?? '–'}',
            style: const TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 4,
            child: waiting ? const LinearProgressIndicator() : null,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 24,
        children: [
          ElevatedButton(
            onPressed: () => setState(() => _rebuilds++),
            child: Text('Rebuild parent ($_rebuilds)'),
          ),
          const Text('❌ future created in build()'),
          FutureBuilder(
            // a new request on every rebuild!
            future: _fetch('created in build'),
            builder: (context, snapshot) => _result(snapshot),
          ),
          const Divider(),
          const Text('✅ future created once in State'),
          FutureBuilder(
            future: _future,
            builder: (context, snapshot) => _result(snapshot),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// 3. TextEditingController in a StatelessWidget vs in State

class const ControllerExample({super.key}) extends StatefulWidget {
  @override
  State<ControllerExample> createState() => _ControllerExampleState();
}

class _ControllerExampleState() extends State<ControllerExample> {
  var _rebuilds = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 24,
          children: [
            ElevatedButton(
              onPressed: () => setState(() => _rebuilds++),
              child: Text('Rebuild parent ($_rebuilds)'),
            ),
            const Text('❌ controller as a field of a StatelessWidget'),
            BadSearchField(),
            const Text('✅ controller in State (+ dispose)'),
            const GoodSearchField(),
          ],
        ),
      ),
    );
  }
}

//
// ignore: prefer_const_constructors_in_immutables
class BadSearchField({super.key}) extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) => TextField(controller: controller);
}

class const GoodSearchField({super.key}) extends StatefulWidget {
  @override
  State<GoodSearchField> createState() => _GoodSearchFieldState();
}

class _GoodSearchFieldState() extends State<GoodSearchField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextField(controller: _controller);
}
