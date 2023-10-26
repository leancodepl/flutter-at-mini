import 'package:flutter/material.dart';

class LightSwitch extends ChangeNotifier {
  bool _isOn = false;
  bool get isOn => _isOn;

  void switchOn() {
    _isOn = true;
    notifyListeners();
  }

  void switchOff() {
    _isOn = false;
    notifyListeners();
  }
}

class ListenableExample extends StatefulWidget {
  const ListenableExample({super.key});

  @override
  State<ListenableExample> createState() => _ListenableExampleState();
}

class _ListenableExampleState extends State<ListenableExample> {
  final lightSwitch = LightSwitch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listenable'),
      ),
      body: Center(
        child: LightbulbToggler(
          lightSwitch: lightSwitch,
        ),
      ),
    );
  }
}

class LightbulbToggler extends StatefulWidget {
  const LightbulbToggler({
    super.key,
    required this.lightSwitch,
  });

  final LightSwitch lightSwitch;

  @override
  State<LightbulbToggler> createState() => _LightbulbTogglerState();
}

class _LightbulbTogglerState extends State<LightbulbToggler> {
  void rebuild() {
    setState(() {
      // do nothing just to trigger a rebuild
    });
  }

  @override
  void initState() {
    super.initState();

    widget.lightSwitch.addListener(rebuild);
  }

  @override
  void didUpdateWidget(LightbulbToggler oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.lightSwitch != widget.lightSwitch) {
      oldWidget.lightSwitch.removeListener(rebuild);
      widget.lightSwitch.addListener(rebuild);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.lightSwitch.isOn
            ? const Icon(
                Icons.lightbulb,
                color: Colors.yellow,
              )
            : const Icon(Icons.lightbulb, color: Colors.grey),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => widget.lightSwitch.switchOn(),
          child: const Text('Switch on'),
        ),
        const SizedBox(height: 4),
        TextButton(
          onPressed: () => widget.lightSwitch.switchOff(),
          child: const Text('Switch off'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.lightSwitch.removeListener(rebuild);
    super.dispose();
  }
}
