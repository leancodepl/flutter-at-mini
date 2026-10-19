import 'package:flutter/material.dart';

import 'package:lecture_week3/demo_info.dart';

/// Demo: State lifecycle (slides 33, 52–55).
///
/// Run: `fvm flutter run -d macos -t lib/demo_03_lifecycle.dart` and keep the
/// console visible. Every lifecycle method of LoggingWidget prints a line.
///
/// 1. Start → createState, initState, didChangeDependencies, build.
/// 2. "New label" → the parent passes a new widget of the same type:
///    didUpdateWidget(old) + build. Same State object (#).
/// 3. "Toggle theme" → the Theme (an InheritedWidget) changed:
///    didChangeDependencies + build.
/// 4. "Remove / insert" → deactivate + dispose; then a brand new State:
///    createState, initState, …
/// 5. "Move to the other card" without a GlobalKey → dispose + a new State.
///    Turn on "use GlobalKey" and move again → deactivate + activate +
///    didUpdateWidget: the same State survives the move.
void main() {
  runApp(const MaterialApp(home: LifecycleDemo()));
}

class const LifecycleDemo({super.key}) extends StatefulWidget {
  @override
  State<LifecycleDemo> createState() => _LifecycleDemoState();
}

class _LifecycleDemoState() extends State<LifecycleDemo> {
  final _globalKey = GlobalKey();

  var _label = 1;
  var _visible = true;
  var _inSecondCard = false;
  var _useGlobalKey = false;
  var _dark = false;

  void _log(String action) => debugPrint('\n---- $action');

  @override
  Widget build(BuildContext context) {
    final logging = LoggingWidget(
      key: _useGlobalKey ? _globalKey : null,
      label: 'label $_label',
    );

    return Theme(
      data: _dark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('State lifecycle'),
          actions: const [
            DemoInfo(
              title: 'State lifecycle',
              steps: [
                'On start: createState, initState, didChangeDependencies, build.',
                '"New label": the parent gives a new widget of the same type → didUpdateWidget(old) + build. Same State #.',
                '"Toggle theme": Theme (an InheritedWidget) changed → didChangeDependencies + build.',
                '"Remove" → deactivate + dispose. "Insert" → a brand new State (new #).',
                '"Move to the other card" without a key → dispose + a new State. Turn on "use GlobalKey" and move again → deactivate, activate, didUpdateWidget – the same State survives.',
              ],
              watch: 'the console – every lifecycle method prints a line',
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _log('new label');
                    setState(() => _label++);
                  },
                  child: const Text('New label'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _log('toggle theme');
                    setState(() => _dark = !_dark);
                  },
                  child: const Text('Toggle theme'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _log(_visible ? 'remove' : 'insert');
                    setState(() => _visible = !_visible);
                  },
                  child: Text(_visible ? 'Remove' : 'Insert'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _log('move (GlobalKey: $_useGlobalKey)');
                    setState(() => _inSecondCard = !_inSecondCard);
                  },
                  child: const Text('Move to the other card'),
                ),
              ],
            ),
            SwitchListTile(
              title: const Text('use GlobalKey'),
              value: _useGlobalKey,
              onChanged: (value) {
                _log('use GlobalKey: $value (the key changed)');
                setState(() => _useGlobalKey = value);
              },
            ),
            _DemoCard(
              title: 'Card A',
              child: _visible && !_inSecondCard ? logging : null,
            ),
            _DemoCard(
              title: 'Card B',
              child: _visible && _inSecondCard ? logging : null,
            ),
          ],
        ),
      ),
    );
  }
}

class const _DemoCard({required final String title, final Widget? child})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            child ?? const Text('(empty)'),
          ],
        ),
      ),
    );
  }
}

class const LoggingWidget({super.key, required final String label})
    extends StatefulWidget {
  @override
  State<LoggingWidget> createState() {
    debugPrint('createState');
    return _LoggingWidgetState();
  }
}

class _LoggingWidgetState() extends State<LoggingWidget> {
  void _log(String method) =>
      debugPrint('State #${identityHashCode(this)} (${widget.label}): $method');

  @override
  void initState() {
    super.initState();
    _log('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _log('didChangeDependencies');
  }

  @override
  void didUpdateWidget(LoggingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _log('didUpdateWidget (was: ${oldWidget.label})');
  }

  @override
  void deactivate() {
    _log('deactivate');
    super.deactivate();
  }

  @override
  void activate() {
    super.activate();
    _log('activate');
  }

  @override
  void dispose() {
    _log('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _log('build');
    // depending on Theme → didChangeDependencies when it changes
    final color = Theme.of(context).colorScheme.primary;
    return Text(
      'State #${identityHashCode(this)} – ${widget.label}',
      style: TextStyle(color: color, fontSize: 20),
    );
  }
}
